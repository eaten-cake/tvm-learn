import tvm
from tvm import dlight

# 定义矩阵乘法计算
A = tvm.te.placeholder((1024, 1024), name="A")
B = tvm.te.placeholder((1024, 1024), name="B")
k = tvm.te.reduce_axis((0, 1024), name="k")
C = tvm.te.compute((1024, 1024), lambda i, j: tvm.te.sum(A[i, k] * B[k, j], axis=k))

func = tvm.te.create_prim_func([A, B, C])

# 使用DLight优化调度
sch = dlight.gpu.Matmul().apply(func, tvm.target.Target("cuda"), False)

sch.mod.show()

# # 生成CUDA代码
# mod = tvm.build(sch.mod, [A, B, C], target="cuda")
# print(mod.imported_modules[0].get_source())  # 输出优化后的GPU内核代码
