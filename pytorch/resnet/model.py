import torch
import torch.nn as nn

# 基础残差块
class BasicBlock(nn.Module):
    expansion = 1
    
    def __init__(self, in_channels, out_channels, stride=1, downsample=None):
        super().__init__()
        self.conv1 = nn.Conv2d(
            in_channels, out_channels, kernel_size=3, 
            stride=stride, padding=1, bias=False
        )
        self.bn1 = nn.BatchNorm2d(out_channels)
        self.relu = nn.ReLU(inplace=True)
        self.conv2 = nn.Conv2d(
            out_channels, out_channels, kernel_size=3,
            stride=1, padding=1, bias=False
        )
        self.bn2 = nn.BatchNorm2d(out_channels)
        self.downsample = downsample
    
    def forward(self, x):
        identity = x
        
        out = self.conv1(x)
        out = self.bn1(out)
        out = self.relu(out)
        
        out = self.conv2(out)
        out = self.bn2(out)
        
        if self.downsample is not None:
            identity = self.downsample(x)
            
        out += identity
        out = self.relu(out)
        
        return out

# ResNet主体结构
class ResNet18(nn.Module):
    def __init__(self, num_classes=1000):
        super().__init__()
        self.in_channels = 64
        
        # 初始卷积层
        self.conv1 = nn.Conv2d(3, 64, kernel_size=7, stride=2, padding=3, bias=False)
        self.bn1 = nn.BatchNorm2d(64)
        self.relu = nn.ReLU(inplace=True)
        self.maxpool = nn.MaxPool2d(kernel_size=3, stride=2, padding=1)
        
        # 四个残差阶段
        self.layer1 = self._make_layer(64, 64, blocks=2, stride=1)
        self.layer2 = self._make_layer(64, 128, blocks=2, stride=2)
        self.layer3 = self._make_layer(128, 256, blocks=2, stride=2)
        self.layer4 = self._make_layer(256, 512, blocks=2, stride=2)
        
        # 分类头
        self.avgpool = nn.AdaptiveAvgPool2d((1, 1))
        self.fc = nn.Linear(512 * BasicBlock.expansion, num_classes)
    
    def _make_layer(self, in_channels, out_channels, blocks, stride):
        downsample = None
        if stride != 1 or in_channels != out_channels * BasicBlock.expansion:
            downsample = nn.Sequential(
                nn.Conv2d(in_channels, out_channels * BasicBlock.expansion, 
                         kernel_size=1, stride=stride, bias=False),
                nn.BatchNorm2d(out_channels * BasicBlock.expansion)
            )
            
        layers = []
        layers.append(
            BasicBlock(in_channels, out_channels, stride, downsample)
        )
        for _ in range(1, blocks):
            layers.append(
                BasicBlock(out_channels * BasicBlock.expansion, out_channels)
            )
            
        return nn.Sequential(*layers)
    
    def forward(self, x):
        # 输入尺寸: [batch, 3, 224, 224]
        x = self.conv1(x)    # -> [batch, 64, 112, 112]
        x = self.bn1(x)
        x = self.relu(x)
        x = self.maxpool(x)  # -> [batch, 64, 56, 56]
        
        x = self.layer1(x)   # -> [batch, 64, 56, 56]
        x = self.layer2(x)   # -> [batch, 128, 28, 28]
        x = self.layer3(x)   # -> [batch, 256, 14, 14]
        x = self.layer4(x)   # -> [batch, 512, 7, 7]
        
        x = self.avgpool(x)  # -> [batch, 512, 1, 1]
        x = torch.flatten(x, 1)  # -> [batch, 512]
        x = self.fc(x)       # -> [batch, num_classes]
        
        return x

# 测试代码
if __name__ == "__main__":
    model = ResNet18(num_classes=1000)
    input_tensor = torch.randn(2, 3, 224, 224)  # batch_size=2
    output = model(input_tensor)
    print(f"输入尺寸: {input_tensor.shape}")
    print(f"输出尺寸: {output.shape}")  # 应得到 [2, 1000]
