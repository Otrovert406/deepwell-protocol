# 情绪检测 Prompt

分析用户输入文本中的情绪特征，返回以下维度：

## 主要情绪
- 快乐 / 悲伤 / 愤怒 / 焦虑 / 平静 / 麻木 / 幸福 / 恐惧

## 强度
- 1-5 分

## 语言特征
- 比喻使用
- 句子长度
- 语气强度词数量

## 输出格式
```json
{
  "primary_emotion": "悲伤",
  "intensity": 4,
  "language_features": {
    "metaphors": ["被抽走脊梁的狗"],
    "avg_sentence_length": 12.5,
    "intensity_words": 3
  }
}
```
