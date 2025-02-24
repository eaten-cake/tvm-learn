import torch
import torch.nn as nn
import torch.optim as optim

# 原始代码修改处
text = "今 天 天 气 真 好 我 们 一 起 去 公 园 玩"  # 按单字分割（演示用）
words = text.split()  # 现在每个字都是独立token

# 更推荐实际使用分词工具（如jieba）：
# import jieba
# text = "今天天气真好我们一起去公园玩"
# words = list(jieba.cut(text))  # ['今天', '天气', '真好', '我们', '一起', '去', '公园', '玩']
vocab = list(set(words))  # 构建词表
word2idx = {word: i for i, word in enumerate(vocab)}
idx2word = {i: word for i, word in enumerate(vocab)}

# 准备训练数据
sequences = []
for i in range(1, len(words)):
    input_seq = words[:i]
    target_word = words[i]
    sequences.append((input_seq, target_word))

# 超参数
embedding_dim = 64
hidden_dim = 128
epochs = 10

# 模型定义
class SimpleLM(nn.Module):
    def __init__(self, vocab_size):
        super().__init__()
        self.embedding = nn.Embedding(vocab_size, embedding_dim)
        self.rnn = nn.RNN(embedding_dim, hidden_dim, batch_first=True)
        self.fc = nn.Linear(hidden_dim, vocab_size)

    def forward(self, x):
        embedded = self.embedding(x)
        output, _ = self.rnn(embedded)
        return self.fc(output[:, -1, :])  # 取最后一个时间步

model = SimpleLM(len(vocab))
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters())

# 训练循环
for epoch in range(epochs):
    total_loss = 0
    for seq, target in sequences:
        # 将输入序列转为索引
        input_idx = torch.tensor([word2idx[w] for w in seq]).unsqueeze(0)
        target_idx = torch.tensor([word2idx[target]])

        # 前向传播
        output = model(input_idx)
        loss = criterion(output, target_idx)

        # 反向传播
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        total_loss += loss.item()
    
    if (epoch+1) % 20 == 0:
        print(f"Epoch {epoch+1}, Loss: {total_loss/len(sequences):.4f}")

# 推理演示
def generate_text(seed_text, max_length=5):
    model.eval()
    current_seq = seed_text.split()
    with torch.no_grad():
        for _ in range(max_length):
            input_idx = torch.tensor([word2idx[w] for w in current_seq]).unsqueeze(0)
            print(input_idx.shape)
            exit(0)
            output = model(input_idx)
            predicted_idx = torch.argmax(output).item()
            current_seq.append(idx2word[predicted_idx])
    return ' '.join(current_seq)

print(generate_text("我 们"))  # 示例输出：今天 天气 真好 我们 一起

