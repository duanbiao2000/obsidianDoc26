---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/机制]
---

# 学Harness须吃透四机制：控制循环、状态持久化、工具沙箱、错误自愈

**核心**：学 Agentic Harness 的关键在四个机制：状态循环（Control Loop）、状态持久化（State/Memory Management）、工具沙箱执行（Tool Sandbox Execution）、错误捕获与自我修复（Reflexion/Retry）。

**为什么 / 证据**（四机制）：
### 1. 状态循环 Control Loop
> Harness 掌握控制权，决定何时调用 LLM、截断上下文、插入人工干预、终止循环。
### 2. 状态持久化 State / Memory
> 跨多轮保留上下文、历史记忆，使 Agent 能接续而非每次从零开始。
### 3. 工具沙箱执行 Tool Sandbox
> 在受控环境（代码解释器 / Bash / API）中执行动作并捕获结果，而非只生成文本。
### 4. 错误捕获与自我修复 Reflexion / Retry
> 捕捉异常与失败，动态插入自我反思 Prompt 或重试，形成闭环自愈。

这四者构成 Harness 的"最小骨架"（见 [[Harness让代码掌控制权、LLM降级为循环内推理算子]]、[[Harness运行时按状态记忆与观察动态组装Prompt]]、[[Harness框架可归四类且类别比具体产品更持久]]）。

**边界 / 反例**：
- 四机制只是最小集：真实框架还涉及 Human-in-the-loop、可观测性（日志/追踪）、并发与限速等。
- 过度聚焦某一机制（如 Sandbox 安全）可能忽视整体控制流，做出脆弱系统。

**我的判断**（个人层 / 应用）：
- 我读任何 Harness 源码先按这四机制画一张对照表，哪一格空着就是它的薄弱点；自建时优先把"错误自愈"做扎实，因为业余实现最常见死循环/无限重试。

**关联**：[[Harness运行时按状态记忆与观察动态组装Prompt]] [[Harness让代码掌控制权、LLM降级为循环内推理算子]] [[Harness框架可归四类且类别比具体产品更持久]] [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]]

**开放问题**：四机制中哪一个最难做对、最常被业余实现忽视？是状态持久化（丢上下文）还是错误修复（死循环）？
