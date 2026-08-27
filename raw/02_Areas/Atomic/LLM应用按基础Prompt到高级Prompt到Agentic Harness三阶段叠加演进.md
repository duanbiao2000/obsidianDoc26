---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/阶段模型]
---

# LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进

**核心**：LLM 应用按控制复杂度三阶段演进——基础 Prompting → 高级 Prompt 工程 → Agentic Harness；后一阶段不替代前一阶段，而是叠加。

**为什么 / 证据**：
> Phase 1 基础 Prompting：User → Raw Prompt → LLM → Output。
> Phase 2 高级 Prompt 工程：User → System Prompt + CoT + Few-Shot → LLM → Direct Output。
> Phase 3 Agentic Harness：State/Memory ↔ Dynamic Prompt Builder；Control Loop → LLM Engine → Tool Call / Code Sandbox → Observation，观察结果回流驱动下一轮。

Phase 3 本质是引入"控制循环 + 状态 + 工具执行 + 观察回流"，把 LLM 从一次性生成器变成循环里的推理算子（见 [[Harness让代码掌控制权、LLM降级为循环内推理算子]]、[[Harness运行时按状态记忆与观察动态组装Prompt]]）。

**边界 / 反例**：
- 三阶段是叠加而非替代：小任务停在 Phase 2 即可，Harness 复杂度需匹配问题规模，否则过度工程。
- 演进路线描述"能力上限"提升，不代表每个应用都该走到 Phase 3。

**我的判断**（个人层 / 应用）：
- 我的选型铁律：先用 Phase 2 把单轮质量打满，确认不够再上 Phase 3；绝不因为"Agent 很火"而跳过前两步直接上 Harness。

**关联**：[[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]] [[Harness让代码掌控制权、LLM降级为循环内推理算子]] [[Harness运行时按状态记忆与观察动态组装Prompt]] [[Harness框架可归四类且类别比具体产品更持久]]

**开放问题**：演进的下一阶段（Phase 4）可能是什么？多 Agent 自组织编排？Agent 自我改进循环？还是更底层的"世界模型"式规划？
