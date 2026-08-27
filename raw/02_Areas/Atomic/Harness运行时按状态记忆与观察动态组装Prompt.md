---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/机制]
---

# Harness运行时按状态记忆与观察动态组装Prompt

**核心**：在 Agentic Harness 中，Prompt 不再是人工拼接的静态字符串，而是由程序在运行时根据 State / Memory / Observation 动态组装的组件。

**为什么 / 证据**：
> Harness 会根据当前的状态（State）、历史记忆（Memory）以及工具执行结果（Observation），**在运行时自动组装 Prompt**。
> 例如：当 Agent 遇到错误时，Harness 会捕捉异常堆栈，动态插入一段"自我反思 Prompt"（Reflexion Prompt），重新送入 LLM。

这意味着 Prompt 从"写死的文本"变成"控制循环生产的产物"，是 Harness 区别于高级 Prompt 工程的关键（见 [[LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进]]、[[Harness让代码掌控制权、LLM降级为循环内推理算子]]）。

**边界 / 反例**：
- 动态组装若缺乏规范或歧义，LLM 仍会给出错误决策，导致控制循环失效（见 [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]]）。
- 动态性提升灵活性，也增加可观测性与调试难度——"此刻喂了什么 Prompt"不再一眼可见。

**我的判断**（个人层 / 应用）：
- 我若自己搭 Harness，强制对每个循环步落盘"实际送入的 Prompt"快照，便于回放调试；否则动态组装会成为黑箱，出问题无从查。

**关联**：[[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]] [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] [[学Harness须吃透四机制：控制循环、状态持久化、工具沙箱、错误自愈]] [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]]

**开放问题**：如何在长循环中保证"动态组装的 Prompt"一致而不漂移？能否对每轮实际送入的 Prompt 做可审计快照？
