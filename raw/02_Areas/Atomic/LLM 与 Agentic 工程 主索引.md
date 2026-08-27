---
type: MOC
created: 2026-08-26
updated: 2026-08-26
tags: [MOC, domain/LLM]
---

# 主索引 · LLM 与 Agentic 工程 ｜ 笔记②

> 核心问题：如何把 LLM 应用从"写好 Prompt"升级为"用 Harness 控制循环串起可靠智能体"？
> 本索引是**笔记②**的入口；真实结构由下方笔记的 [[双向链接]] 涌现。
> 注：具体框架产品易过时，已丢弃；仅保留可长期迁移的概念与分类。

## 定位与关系
- [[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]] — 微观指令设计 vs 宏观控制外骨骼
- [[无高质量Prompt则Harness失精度、无Harness则Prompt有上限]] — 无 Prompt 精度→Harness 失效；无 Harness→Prompt 有上限

## 机制与演进
- [[Harness运行时按状态记忆与观察动态组装Prompt]] — 运行时按状态/记忆/观察组装
- [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] — 确定性归代码、推理拆极简专职
- [[Harness让代码掌控制权、LLM降级为循环内推理算子]] — LLM 降级为循环内推理算子
- [[LLM应用按基础Prompt到高级Prompt到Agentic Harness三阶段叠加演进]] — Phase 1→2→3 叠加

## 分类与学习
- [[Harness框架可归四类且类别比具体产品更持久]] — 四类稳定心智模型（产品会换、类别稳定）
- [[学Harness须吃透四机制：控制循环、状态持久化、工具沙箱、错误自愈]] — 四机制最小骨架

## 待探索的开放问题
- 何时从 Prompt 工程升级到 Harness？动态 Prompt 如何防漂移？
- 确定性/推理的边界在哪？控制权在代码与 LLM 间的黄金分割点？
- Phase 4 是什么？四机制里哪个最常被忽视？
- 具体框架归属（需动态核实，不固化）
