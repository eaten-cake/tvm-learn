import tvm
from tvm import te, tir
from tvm.script import tir as T
from tvm.script import relax as R

from tvm.meta_schedule import TuneContext
from tvm.meta_schedule.schedule_rule import AutoInline
from tvm.meta_schedule.space_generator import PostOrderApply

N, M, K = 128, 128, 64
A = te.placeholder((N, K), name="A")
B = te.placeholder((K, M), name="B")
k = te.reduce_axis((0, K), name="K")
C = te.compute((N, M), lambda i, j: te.sum(A[i, k] * B[k, j], axis=k), name="C")

matmul = te.create_prim_func([A, B, C]).with_attr({"global_symbol": "matmul"})
mod = tvm.IRModule({"matmul": matmul})

args = {
    "mod": mod,
    "target": "llvm -num-cores=1",
    "space_generator": "post-order-apply",
    # "search_strategy": "evolutionary",
    "search_strategy": "my",
}

context = TuneContext(**args)

schedules = context.generate_design_space()

print("Number of schedules: ", len(schedules))

context.pre_tuning(
    max_trials=10,
    num_trials_per_iter=10,
    design_spaces=schedules,
)

candidates = context.generate_measure_candidates()

print("Number of candidates: ", len(candidates))



# for schedule in schedules:
#     schedule.show()