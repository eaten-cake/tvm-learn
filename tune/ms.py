import tvm
from tvm.script import tir as T
from tvm.script import relax as R
from tvm import meta_schedule as ms
from tvm import te, topi

import torch
from torch import nn

import numpy as np

import time
import tempfile

class BatchMatmulRelu(nn.Module):
    def __init__(self):
        super(BatchMatmulRelu, self).__init__()
    
    def forward(self, A, B):
        C = torch.bmm(A, B)
        D = torch.relu(C)
        return D

def record_run_log(record_name: str, run_secs: float, log_file: str):
    with open(log_file, "a") as f:
        f.write("%s run time: %.4f\n" % (record_name, run_secs))


def batch_matmul_relu(BATCH, N, M, K, dtype):
    A = te.placeholder((BATCH, N, K), name='A', dtype=dtype)
    B = te.placeholder((BATCH, K, M), name='B', dtype=dtype)
    k = te.reduce_axis((0, K), name='k')
    C = te.compute((BATCH, N, M), lambda b, n, m: te.sum(A[b, n, k] * B[b, k, m], axis=k), name='C')
    D = topi.nn.relu(C)
    return [A, B, D]

BATCH = 16
N = 512
M = 512
K = 512
dtype = 'float32'

# torch execution
A_np = np.random.uniform(size=(BATCH, N, K)).astype(dtype)
B_np = np.random.uniform(size=(BATCH, K, M)).astype(dtype)

A_torch = torch.tensor(A_np)
B_torch = torch.tensor(B_np)

model = BatchMatmulRelu()

start_time = time.time()
C_torch = model(A_torch, B_torch)
end_time = time.time()
print("Time cost of torch execution: ", end_time - start_time, "s")

args = batch_matmul_relu(BATCH, N, M, K, dtype)

func = te.create_prim_func(args).with_attr({"global_symbol": "batch_matmul_relu"})
mod = tvm.IRModule({"batch_matmul_relu": func})

# tvm execution
A_tvm = tvm.nd.array(A_np, device=tvm.cpu(0))
B_tvm = tvm.nd.array(B_np, device=tvm.cpu(0))
D_tvm = tvm.nd.array(np.empty((BATCH, N, M), dtype=dtype), device=tvm.cpu(0))

sch = tvm.tir.Schedule(mod)

work_dir = "./work_dir"
database = ms.tune_tir(
    mod,
    "llvm -num-cores=1",
    work_dir,
    max_trials_global=1,
    num_trials_per_iter=1,
)

target = tvm.target.Target("llvm")

sch = ms.tir_integration.compile_tir(database, mod, target)

lib = tvm.build(sch.mod, target=target)

lib["batch_matmul_relu"](A_tvm, B_tvm, D_tvm)

np.testing.assert_allclose(D_tvm.numpy(), C_torch.numpy(), rtol=1e-5)

evaluator = lib.time_evaluator("batch_matmul_relu", dev=tvm.cpu(0))

run_secs = evaluator(A_tvm, B_tvm, D_tvm).mean

print("Time cost of tvm execution: ", run_secs, "s")

