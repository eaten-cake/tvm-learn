import tvm
from tvm import relax
from tvm.relax.frontend.torch import from_exported_program
from tvm import meta_schedule as ms

import torch
from torch import nn
from torch.export import export

class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 3, 3, padding=1)
        self.fc1 = nn.Linear(3 * 224 * 224, 10)
    
    def forward(self, x):
        x = self.conv1(x)
        x = x.flatten(1)
        x = self.fc1(x)
        return x
    
model = Net()
model = model.eval()

input_shape = (1, 3, 224, 224)
input_data = torch.randn(input_shape, dtype=torch.float32)

exported_program = export(model, (input_data,))
exported_program.run_decompositions()

mod = from_exported_program(exported_program)

mod, params = relax.frontend.detach_params(mod)

trials = 64

mod = relax.get_pipeline("zero")(mod)

# database = ms.relax_integration.tune_relax(
#     mod,
#     params,
#     "llvm --num-cores=1",
#     "./word_dir",
#     trials,
#     trials
# )

database = ms.database.JSONDatabase(work_dir="./word_dir")

ex = ms.relax_integration.compile_relax(database, mod, "llvm", params)

target = tvm.target.Target("llvm")


dev = tvm.device("llvm", 0)
# ex = relax.build(mod, target, params)
vm = relax.VirtualMachine(ex, dev)

input_tvm = tvm.nd.array(input_data.numpy(), dev)

out = vm["main"](input_tvm)

print(out[0].numpy())

evaluator = vm.time_evaluator("main", dev)
run_secs = evaluator(input_tvm).mean

print(run_secs, "s")

