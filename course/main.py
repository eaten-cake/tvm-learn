import torch
from torch import nn

class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 16, kernel_size=3, padding=1)
        self.bn1 = nn.BatchNorm2d(16)

        self.blocks = []
        for i in range(4):
            self.blocks.append(self.make_block(4, 4))
        self.blocks = nn.ModuleList(self.blocks)
        self.fc = nn.Linear(3136, 100)

    def make_block(self, in_channels, out_channels):
        block = nn.Sequential(
            nn.Conv2d(in_channels, out_channels, kernel_size=3, padding=1, stride=2),
            nn.BatchNorm2d(out_channels),
            nn.ReLU(),
            nn.MaxPool2d(4),
        )
        return block

    def forward(self, x):
        x = self.conv1(x)
        x = self.bn1(x)
        split_x = torch.split(x, 4, dim=1)
        split_x = list(split_x)
        for idx,block in enumerate(self.blocks):
            split_x[idx] = block(split_x[idx])
        x = torch.cat(split_x, dim=1)
        x = torch.flatten(x, 1)
        x = self.fc(x)
        x = nn.Softmax(dim=1)(x)
        return x


model = Net()
model = model.eval()

input_shape = (1, 3, 112, 112)
input_data = torch.randn(input_shape)

output_data = model(input_data)

print(output_data.shape)

torch.onnx.export(
    model,
    (input_data,),
    "model.onnx",
    input_names=["input"],
    output_names=["output"],
)

# x = torch.randn((1, 32, 32, 32))
# split_x = torch.split(x, 8, dim=1)
# print(split_x[0].shape)




