---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/机制]
---

# Harness让代码掌控制权、LLM降级为循环内推理算子

**核心**：单纯 Prompt 驱动让 LLM 决定整个执行计划，易在长链中迷路或死循环；Harness 驱动时由代码掌握控制权（Control Loop），LLM 只是内部"推理算子"，由 Harness 决定何时调用、截断、人工干预、终止。

**为什么 / 证据**：
> 单纯 Prompt 驱动：让 LLM 决定整个任务的执行计划，并一步步输出下一行动（容易在长链条中迷路或陷入死循环）。
> Harness 驱动：Harness 掌握控制权（Control Loop）。Harness 决定何时调用 LLM、何时截断上下文、何时强制插入人工干预（Human-in-the-loop）、何时终止循环。LLM 只是 Harness 内部的一个"推理算子"。

这是控制权的归属转变，也是 [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] 在运行时的体现，对应 [[LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进]] 的 Phase 3。

**边界 / 反例**：
- 完全代码驱动可能牺牲探索性灵活度；某些开放式任务反而需要 LLM 主导规划。
- Human-in-the-loop 提升可靠性，也增加延迟与人工成本，未必适合所有场景。

**我的判断**（个人层 / 应用）：
- 我默认"代码为主、LLM 为算子"，但在探索/创意类任务里故意放宽：让 LLM 先自由规划几步，再交回代码校验与执行。控制权重心随任务在两端间移。

**关联**：[[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]] [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] [[LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进]] [[学Harness须吃透四机制：控制循环、状态持久化、工具沙箱、错误自愈]] [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]]

**开放问题**：控制权在"代码"与"LLM"之间的黄金分割点，随任务类型（确定性 vs 探索性）如何变化？
