import tvm
from tvm import te, topi, auto_scheduler
from tvm.script import tir as T
from tvm.script import relax as R
from tvm import meta_schedule as ms

import numpy as np

def vector_add(lhs: te.Tensor, rhs: te.Tensor):
    assert len(lhs.shape) == len(rhs.shape) == 1 and lhs.shape[0] == rhs.shape[0]
    shape = lhs.shape
    out = te.compute(shape, lambda i: lhs[i] + rhs[i])
    return out

def matmul(lhs: te.Tensor, rhs: te.Tensor, bias: te.Tensor):
    assert len(lhs.shape) == 2 and len(rhs.shape) == 2 and lhs.shape[1] == rhs.shape[0]
    shape = (lhs.shape[0], rhs.shape[1])
    k = te.reduce_axis((0, lhs.shape[1]), name="k")
    matmul_out = te.compute(shape, lambda i, j: te.sum(lhs[i, k] * rhs[k, j], axis=k), name="matmul_out")
    out = te.compute(shape, lambda i, j: matmul_out[i, j] + bias[i, j], name="out")
    return out

def schedule_template(mod: tvm.IRModule):
    sch = tvm.tir.Schedule(mod)
    matmul_out_block = sch.get_block("matmul_out", "matmul")
    i, j, k = sch.get_loops(matmul_out_block)
    # j_factors = sch.sample_perfect_tile(j, n=2)
    # j0, j1 = sch.split(j, factors=j_factors)
    sch.reorder(i, k, j)
    sch.unroll(j)
    out_block = sch.get_block("out", "matmul")
    out_i, out_j = sch.get_loops(out_block)
    
    sch.reverse_compute_at(out_block, k)
    # sch.unroll(out_j)
    return sch

N, K, M = 1024, 1024, 1024
lhs = te.placeholder((N, K), dtype="float32", name="lhs")
rhs = te.placeholder((K, M), dtype="float32", name="rhs")
bias = te.placeholder((N, M), dtype="float32", name="bias")
out = matmul(lhs, rhs, bias)

matmul_func = te.create_prim_func([lhs, rhs, bias, out]).with_attr({"global_symbol": "matmul"})
mod = tvm.IRModule({"matmul": matmul_func})
sch = schedule_template(mod)
sch.mod.show()



# database = ms.tune_tir(
#     mod=mod,
#     target="llvm --num-cores=1",
#     max_trials_global=10,
#     num_trials_per_iter=10,
#     # space=ms.space_generator.ScheduleFn(stochastic_schedule_mm), # annotate to use auto-scheduling
#     work_dir="./tune_tmp",
# )

# sch = ms.tir_integration.compile_tir(database, mod, "llvm --num-cores=1")

sch.mod.show()

lhs_np = np.random.uniform(size=(N, K)).astype("float32")
rhs_np = np.random.uniform(size=(K, M)).astype("float32")
bias_np = np.random.uniform(size=(N, M)).astype("float32")
result_np = np.dot(lhs_np, rhs_np) + bias_np
out_np = np.empty((N, M), dtype="float32")

no_lib = tvm.build(mod, target="llvm")
sch_lib = tvm.build(sch.mod, target="llvm")

lhs_tvm = tvm.nd.array(lhs_np)
rhs_tvm = tvm.nd.array(rhs_np)
bias_tvm = tvm.nd.array(bias_np)
out_tvm = tvm.nd.array(out_np)

sch_lib["matmul"](lhs_tvm, rhs_tvm, bias_tvm, out_tvm)

np.testing.assert_allclose(out_tvm.numpy(), result_np, rtol=1e-3)

no_lib_func = no_lib.time_evaluator("matmul", tvm.cpu())
print("no_tune: ", no_lib_func(lhs_tvm, rhs_tvm, bias_tvm, out_tvm).mean, "s")
sch_lib_func = sch_lib.time_evaluator("matmul", tvm.cpu())
print("tune: ", sch_lib_func(lhs_tvm, rhs_tvm, bias_tvm, out_tvm).mean, "s")
