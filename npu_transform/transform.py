import tvm
from tvm import te, topi
from tvm.script import tir as T
from tvm.script import relax as R

import numpy as np

input = np.random.uniform(0, 1, size=(3, 32, 32)).astype("int16")

def transform_to_npu_layout(input: np.array):
    # input : (C, H, W)
    assert len(input.shape) == 3, "Input should be 3-dimensional"
    C, H, W = input.shape
    IC_GROUP = (C + 31) // 32
    # pad_input : ((C + 31) // 32 * 32, H, W)
    pad_input = np.pad(input, ((0, int((C + 31) // 32 * 32) - C), (0, 0), (0, 0)), mode="constant", constant_values=0)
    # reshape_input : (IC_GROUP, 32, H, W)
    reshape_input = np.reshape(pad_input, (IC_GROUP, 32, H, W))
    # transpose_input : (IC_GROUP, H, W, 32)
    transpose_input = np.transpose(reshape_input, (0, 2, 3, 1))
    return transpose_input

output = transform_to_npu_layout(input)

def te_transform_to_npu_layout(C, H, W, INPUT):
    IC_GROUP = (C + 31) // 32
    PAD_INPUT = topi.nn.pad(INPUT, (0, 0, 0), ((C + 31) // 32 * 32 - C, 0, 0))
    RESHAPE_INPUT = topi.reshape(PAD_INPUT, (IC_GROUP, 32, H, W))
    TRANSPOSE_INPUT = topi.transpose(RESHAPE_INPUT, (0, 2, 3, 1))
    return TRANSPOSE_INPUT


C, H, W = 3, 32, 32

INPUT = te.placeholder((C, H, W), name="INPUT", dtype="int16")

OUTPUT = te_transform_to_npu_layout(C, H, W, INPUT)

transform_func = te.create_prim_func([INPUT, OUTPUT]).with_attr({"global_symbol": "transform_func"})
transform_ir_module = tvm.IRModule({"transform_func": transform_func})
transform_ir_module.show()

lib = tvm.build(transform_ir_module, target="llvm")

input_tvm = tvm.nd.array(input)
output_tvm = tvm.nd.array(np.empty((1, 32, 32, 32), "int16"))

lib["transform_func"](input_tvm, output_tvm)

np.testing.assert_allclose(output_tvm.numpy(), output, rtol=1e-5)

