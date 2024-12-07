import torch
import torch.nn as nn
import torch.optim as optim

# 设置随机种子（可选）
torch.manual_seed(0)

# 构造简单的训练数据: y = 3x + 2 + 一点噪声
x_train = torch.randn(100, 1) * 5  # 100个样本，每个样本维度为1
y_train = 3 * x_train + 2 + torch.randn(100, 1) * 0.5

# 定义一个简单的线性模型 y = Wx + b
model = nn.Linear(1, 1)  # 输入维度1，输出维度1

# 定义损失函数（均方误差MSE）
criterion = nn.MSELoss()

# 定义优化器，使用SGD，并设置学习率
optimizer = optim.SGD(model.parameters(), lr=0.01)

# 开始训练
for epoch in range(1000):
    # 前向传播：计算预测值和loss
    y_pred = model(x_train)
    loss = criterion(y_pred, y_train)
    
    # 每一次迭代前要清零梯度，否则梯度会在计算图中累积
    optimizer.zero_grad()
    
    # 反向传播：计算梯度
    loss.backward()
    
    # 使用优化器更新参数
    optimizer.step()
    
    # 每隔一段打印一下loss
    if (epoch+1) % 100 == 0:
        print(f"Epoch {epoch+1}/1000, Loss: {loss.item():.4f}")

# 查看训练结束后模型的参数
[w, b] = model.parameters()
print("Trained weight: ", w.item())
print("Trained bias: ", b.item())
