# Deepwell Protocol

**深井协议** — 你的 AI 回音壁

你不需要一口完美的井，你只需要一把锄头。

## 这是什么

Deepwell 是一个开源的情绪记录平台。用户通过与 AI 回音壁进行长期单对话，倾诉情绪、记录生活。AI 以理解、陪伴、非评判的方式给予反馈。

从 80 万字真实对话中提炼，现在正在转型为完整的移动端产品。

## 核心特色

- **单对话模型** — 每个用户只有一个对话，所有情绪都在一条时间线上
- **超长上下文** — AI 记住你是谁、你的经历、你的语言习惯
- **AI 回音壁** — 不评判、不指责、不贴标签，真正理解你的感受
- **隐私优先** — 数据本地加密，开发者不可查看
- **社交同步** — 可选择分享到朋友圈/小红书

## 快速开始

```bash
# 克隆仓库
git clone git@github.com:Otrovert406/deepwell-protocol.git
cd deepwell-protocol

# 运行 Flutter App
cd app
flutter pub get
flutter run

# 运行 Go 后端
cd server
go run ./cmd/main.go
```

## 文档

- [开发计划](PLAN.md)
- [协议](docs/PROTOCOL/)
- [案例](docs/CASE/)
- [工具包](docs/TOOLKIT/)
- [AI Prompts](ai/prompts/)

## 目标用户

1. **高敏感人群** — 需要释放和倾诉
2. **高表达欲人群** — 习惯分享日常
3. **内敛型人群** — 需要引导进行线上记录

## 参与贡献

这个项目需要：Flutter 开发者、Go 后端开发者、AI/ML 工程师、设计师、写作者。任何人都可以参与。

## 许可证

MIT
