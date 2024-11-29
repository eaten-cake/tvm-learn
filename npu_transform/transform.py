import tvm
from tvm import te, topi
from tvm.script import tir as T
from tvm.script import relax as R

import numpy as np

input = np.random.uniform(0, 1, size=(3, 32, 32))

pad_input = np.pad(input, ((0, int((3 + 31) // 32 * 32) - 3), (0, 0), (0, 0)), mode="constant", constant_values=0)

C = te.var("C")
H = te.var("H")
W = te.var("W")

INPUT = te.placeholder((C, H, W), dtype="float16", name="INPUT")

PAD_INPUT = topi.nn.pad(INPUT, (0, 0, 0), ((C + 31) // 32 * 32 - C, 0, 0), name="PAD_INPUT")

transform_func = te.create_prim_func([INPUT, C, H, W, PAD_INPUT]).with_attr({"global_symbol": "transform_func"})

transform_ir_module = tvm.IRModule({"main": transform_func})

transform_ir_module.show()

lib = tvm.build(transform_ir_module, target="llvm")

input_tvm = tvm.nd.array(input)

pad_input_tvm = lib["main"](input_tvm)

print(pad_input_tvm.shape)

# # PAD_C = te.compute((1,), lambda i: (C + 31) / 32, name="PAD_C")

# PAD_INPUT = topi.broadcast.broadcast_to(INPUT, ((C + 31) / 32, H, W))

# print(PAD_INPUT.shape)

