---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---
除了你正在看的 **SimpleEnglish / ASD-STE100**（“无歧义的维修手册体”），最经典、最可复用的 output style 大致可归为下面几类。Claude Code 官方也内置了其中的 **Concise、Proactive、Explanatory、Learning**；output style 本质上是在系统提示末尾加入对角色、语气和格式的约束，而不是改变模型本身的知识或能力。 [code.claude](https://code.claude.com/docs/en/output-styles)

## 工程协作型

| 风格                           | 核心约束                          | 最适合的任务                 | 典型语气                                |
| ---------------------------- | ----------------------------- | ---------------------- | ----------------------------------- |
| **Concise / Minimal**        | 结论优先；去掉过程播报与寒暄                | 高频编码、CLI、review        | “Fixed. Root cause: …”              |
| **Proactive / Autonomous**   | 默认合理假设，先执行后汇报                 | 小到中型、边界明确的任务           | “I implemented X and validated Y.”  |
| **Plan-first / Architect**   | 先澄清约束、给方案和 trade-offs，再改代码    | 架构改造、迁移、复杂 bug         | “Option A optimizes for…, while B…” |
| **SRE / Incident Commander** | 事实—影响—缓解—根因—后续动作              | 故障排查、runbook、发布事故      | “Impact: … Mitigation: …”           |
| **Security Reviewer**        | 威胁模型优先；按 exploitability 和影响分级 | Auth、支付、依赖审计、PR review | “High: attacker can…”               |
| **Code Reviewer**            | 只报可行动问题；按严重性排序；避免无效吹毛求疵       | Pull request 审查        | “Blocking: this changes…”           |

对你的 agent/harness 项目，**Plan-first** 和 **SRE** 往往比默认 coding style 更有价值：前者防止模型过早写代码，后者让模型在失败时交付可复现、可验证的信息，而不只是“修好了”。SimpleEnglish 则很适合作为这些风格的共同语言层，尤其用于 runbook、错误信息、事故报告和 AGENTS.md。 [github](https://github.com/AminBlg/SimpleEnglish)

## 学习与思考型

- **Explanatory**：在完成任务的同时，穿插解释实现选择与代码库模式；适合你探索陌生仓库、框架源码或推理 agent 的设计。Claude Code 将其定位为提供 “Insights” 的工程协作模式。 [code.claude](https://code.claude.com/docs/en/output-styles)
- **Learning / Socratic**：不直接包办全部工作，而是让用户完成少量关键步骤，再给反馈；适合刻意练习，而不适合赶工。官方 Learning style 会提出战略性的小任务，并可在代码中放置 `TODO(human)` 标记。 [code.claude](https://code.claude.com/docs/en/output-styles)
- **Rubber-duck / First-principles**：强制模型先重述问题、列出假设、区分事实与猜测，再提出最小验证实验。它尤其适合复杂 bug、性能异常、LLM evaluation 偏差。  
- **Research analyst**：把“结论、证据、反例、置信度、未决问题”分开写；适合读论文、比较模型、技术选型，能显著抑制貌似自信的空泛总结。  

一个适合你做 agentic engineering 的规则是：**Reason explicitly; act minimally; verify mechanically.**  
即先公开关键假设，再执行最小变更，最后用测试、日志或命令结果验证，而不是把“看起来合理”当作完成。



## 最值得先配的五个

我建议你不要收集几十个 persona，而是建立一个小型 **style stack**：

1. **minimal-coder**：日常实现；只报告结果、变更、验证。  
2. **architect**：复杂任务先输出约束、方案、风险和执行计划。  
3. **simple-english**：文档、CLI 文案、错误信息、runbook。  
4. **research-analyst**：论文、模型比较、技术路线判断。  
5. **editorial-english**：IELTS、视频脚本、博客和公开技术表达。  
