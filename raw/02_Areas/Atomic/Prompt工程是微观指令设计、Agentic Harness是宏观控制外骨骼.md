---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/框架]
---

# Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼

**核心**：Prompt 工程是微观层面的"沟通与指令设计"，Agentic Harness 是宏观层面的"系统架构与控制外骨骼"；Harness 把 Prompt 工程从"人工编写静态文本"升维为"程序化、动态调度的底层基础设施"。

**为什么 / 证据**：
> Prompt 工程是微观层面的"沟通与指令设计"，而 Agentic Harness 是宏观层面的"系统架构与控制外骨骼"。Agentic Harness 将 Prompt 工程从"人工编写静态文本"升维为"程序化、动态调度的底层基础设施"。

这是理解 LLM 应用演进的主干区分：前者优化"单次/少次输入的上下文与指令"，后者提供"确定性的运行环境与控制循环"（见 [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]]、[[Harness让代码掌控制权、LLM降级为循环内推理算子]]）。

**边界 / 反例**：
- 二者是层级关系而非互斥：Harness 内含 Prompt 工程，不是替代它（见 [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]]）。
- 对简单、单次、低副作用任务，纯 Prompt 工程往往更划算，不必引入 Harness 成本。

**我的判断**（个人层 / 应用）：
- 我的默认决策：单轮、低风险、无副作用任务 → 纯 Prompt；一旦涉及多轮、需重试/状态维持/外部工具/副作用 → 上 Harness。不为"显得先进"而上 Harness。

**关联**：[[Harness运行时按状态记忆与观察动态组装Prompt]] [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] [[Harness让代码掌控制权、LLM降级为循环内推理算子]] [[LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进]] [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]]

**开放问题**：何时该从 Prompt 工程升级到 Harness？有没有简单的决策阈值（任务轮数、是否带副作用、是否需重试）？
