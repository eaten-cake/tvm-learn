from torch.utils.data import Dataset, DataLoader
import torch
from torch import nn

class MyDataset(Dataset):

    def __init__(self, data, labels):
        super().__init__()
        self.data = data
        self.labels = labels
    
    def __len__(self):
        return len(self.data)
    
    def __getitem__(self, index):
        return self.data[index], self.labels[index]

data = torch.randn(100, 3)
labels = torch.randint(0, 2, (100,))

dataset = MyDataset(data, labels)
dataloader = DataLoader(dataset, batch_size=32, shuffle=True)


