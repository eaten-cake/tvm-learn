import tvm
from tvm import te
from tvm import tir as T
from tvm import relax as R

import numpy as np

loops = []

def find_width8(op):
    """查找范围可以被 8 整除的所有「tir.For」节点。"""
    if isinstance(op, tvm.tir.For):
        if isinstance(op.extent, tvm.tir.IntImm):
            if op.extent.value % 8 == 0:
                loops.append(op)

def vectorize8(op):
    """Split 可以向量化 `find_width8` 中的循环。"""
    if op in loops:
        extent = op.extent.value
        name = op.loop_var.name
        lo, li = te.var(name + ".outer"), te.var(name + ".inner")
        body = tvm.tir.stmt_functor.substitute(op.body, {op.loop_var: lo * 8 + li})
        body = tvm.tir.For(li, 0, 8, tvm.tir.ForKind.VECTORIZED, body)
        body = tvm.tir.For(lo, 0, extent // 8, tvm.tir.ForKind.SERIAL, body)
        return body
    return None

@tvm.tir.transform.prim_func_pass(opt_level=0)
def vectorize(f, mod, ctx):
    global loops

    tvm.tir.stmt_functor.post_order_visit(f.body, find_width8)

    if not loops:
        return f

    # 最后一个列表参数表示将转换哪些类型的节点。
    # 在这种情况下，只有 `For` 节点会调用 `vectorize8`
    return f.with_body(tvm.tir.stmt_functor.ir_transform(f.body, None, vectorize8, ["tir.For"]))



@tvm.transform.module_pass(opt_level=1)
class TestPass:
    def transform_module(self, mod, ctx):
        return vectorize(mod)
        # return mod

if __name__ == "__main__":
    n = T.const(128, "int32")
    A = te.placeholder((n,), name="A")
    B = te.compute((n,), lambda i: A[i] * 2, name="B")
    s = te.create_prim_func([A, B]).with_attr({"global_symbol": "mul2"})
    C = te.compute((n,), lambda i: A[i] + 1, name="add_one")
    add_one = te.create_prim_func([A, C]).with_attr({"global_symbol": "add_one"})
    mod = tvm.IRModule()
    mod["mul2"] = s
    mod["add_one"] = add_one

    mod.show()

    mod = tvm.build(mod, target="llvm")

    a_np = np.random.uniform(0, 1, size=(128,)).astype(A.dtype)
    b_np = a_np * 2
    a = tvm.nd.array(a_np)
    b = tvm.nd.empty((128,))
    mod["mul2"](a, b)
    np.testing.assert_allclose(b.numpy(), b_np, rtol=1e-5)
    
    

    # transformed_mod = T.transform.UnrollLoop()(mod)

    # transformed_mod.show()

    # mod = TestPass()(mod)
    # mod = vectorize(mod)
    # seq = tvm.transform.Sequential([
        
    # ])

    # mod.show()

    # # 创建测试模块
    # @tvm.script.ir_module
    # class TestModule:
    #     @tir.prim_func
    #     def main():
    #         for i in tir.serial(10):
    #             tir.evaluate(0)

    # print("原始 TIR:")
    # print(TestModule.script())

    # # 应用 Pass
    # mod = RenameLoopVarsPass()(TestModule)
    # print("\n转换后 TIR:")
    # print(mod.script())