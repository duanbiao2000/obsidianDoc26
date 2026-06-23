---
type: concept
title: 上下文工程 (Context Engineering)
created: 2026-06-21
updated: 2026-06-21
tags: [ai, engineering, context, agent]
related: [claude-code, ai-coding-agent-core-loop, staff-engineer, system-mental-model-document-engineering]
sources: ["Journals/Coding/Staff Engineer必经之路.md"]
---

# 上下文工程 (Context Engineering)

**上下文工程** 是指为 AI Agent 设计和管理高质量的上下文信息，以确保其输出的准确性、一致性和任务完成效率。在 AI 编码代理领域，这是未来最核心的能力之一，因为高级 Agent 的最大瓶颈已经不是模型本身，而是 **context quality**。

## 核心要素

| 要素 | 本质 |
|------|------|
| repo memory | 长期知识 |
| retrieval | 信息召回 |
| tool routing | 工具选择 |
| state compression | 状态压缩 |
| planning graph | 任务图 |
| execution constraints | 安全边界 |
| evaluation loop | 验证系统 |

## 与 Staff Engineer 的关系

Staff Engineer 将越来越像“上下文架构师”，需要设计上述要素来驾驭 AI Agent，确保协作的高效与安全。上下文工程是实现 [[AI 编码代理核心循环]] 的关键支撑。

## 典型实践

Claude Code 的上下文工作流（grep 相关文件、确定代码重要性、避免 token 爆炸、持续保持任务状态）是上下文工程的具体体现。

## 开放问题

随着模型上下文窗口不断扩大，人工设计上下文的必要性是否会下降？此议题仍需持续观察。