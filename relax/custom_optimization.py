import os
import tempfile
import numpy as np
import tvm
from tvm import IRModule, relax
from tvm.relax.frontend import nn

class RelaxModel(nn.Module):
    def __init__(self):
        super(RelaxModel, self).__init__()
        self.fc1 = nn.Linear(784, 256)
        self.relu1 = nn.ReLU()
        self.fc2 = nn.Linear(256, 10, bias=False)

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu1(x)
        x = self.fc2(x)
        return x


input_shape = (1, 784)
mod, params = RelaxModel().export_tvm({"forward": {"x": nn.spec.Tensor(input_shape, "float32")}})
# mod.show()

target = tvm.target.Target("llvm --num-cores=1")

# trials = 10

# with tempfile.TemporaryDirectory() as work_dir, target:
#     seq = tvm.ir.transform.Sequential([
#         relax.get_pipeline("zero"),
#         relax.transform.MetaScheduleTuneTIR(work_dir=work_dir, max_trials_global=trials),
#         relax.transform.MetaScheduleApplyDatabase(work_dir=work_dir),
#     ])
#     mod = seq(mod)

# mod.show()

from tvm import dlight as dl

# Apply DLight rules
with target:
    mod = tvm.ir.transform.Sequential(
        [
            relax.get_pipeline("zero"),
            dl.ApplyDefaultSchedule(  # pylint: disable=not-callable
                dl.gpu.Matmul(),
                dl.gpu.GEMV(),
                dl.gpu.Reduction(),
                dl.gpu.GeneralReduction(),
                dl.gpu.Fallback(),
            ),
        ]
    )(mod)

mod.show()

ex = relax.build(mod, target=target)
dev = tvm.device("llvm", 0)
vm = relax.VirtualMachine(ex, dev)
# Need to allocate data and params on GPU device
data = tvm.nd.array(np.random.rand(*input_shape).astype("float32"), dev)
gpu_params = [tvm.nd.array(np.random.rand(*p.shape).astype(p.dtype), dev) for _, p in params]
gpu_out = vm["forward"](data, *gpu_params).numpy()
print(gpu_out)

