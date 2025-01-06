import torch
from torch import nn

# L2

# 均方误差损失函数

mse_loss = nn.MSELoss()

x = torch.tensor(
    [1.0, 2.0, 3.0]
)

y = torch.tensor(
    [1.0, 2.0, 5.0]
)

print(mse_loss(x, y))
