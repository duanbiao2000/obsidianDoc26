---
type: design
tags: [ielts, speaking, design]
created: 2026-08-04
updated: 2026-08-04
status: validated
---

# 口语训练分支结构化设计 · daily-ielts-speaking

## 1. 背景与目标

Speaking 目录现有 71 个文件（SOP、计分卡、题库、语料、话题笔记），全部平铺且 frontmatter 类型不统一，agent 每次会话需要重新"考古"才能接续。目标：把 `daily-ielts-speaking` 建成一条**自解释**的训练轨道——agent 打开就知道练什么、卡在哪、下一步是什么。

约束：

- 不迁移现有 71 个文件（避免断 wikilink、迁移成本高、价值低）；
- 复用已有 SOP / 计分卡 / 六维评分体系；
- 每次训练反馈 ≤ 3 分钟、周复盘 ≤ 30 分钟（agent 聚合）。

## 2. 分支边界

| 分支 | 定位 | 承载内容 |
| :--- | :--- | :--- |
| `main` | 稳定基线 | 已确认沉淀的知识 |
| `daily-ielts-full-mock` | 每日整套真题训练 | 4 单元 × 听说读写、全真模拟 |
| `daily-ielts-speaking` | 口语专项训练 + review | 材料吸收 / 快答 / 独白 / 深度问答 / 错题 / 六维评分 |

## 3. 组件清单

| 文件 | 类型 | 作用 |
| :--- | :--- | :--- |
| [[口语训练分支README]] | hub | 分支入口：定位、文件地图、使用流程、frontmatter 约定 |
| 每日口语训练日志-YYYY-MM-DD | speaking-session | 当日训练记录（一天一页，汇总当日各段） |
| [[口语错题本]] | speaking-error-bank | 错误台账：错误句 / 修正 / 错因维度 / 复现次数 |
| [[每日进步计分卡-2026-08-04]] | scorecard | 已有，实时填六维、三查与 SOP §9 指标 |
| [[口语训练系统-原则与里程碑]] | sop | 复用：每日结构、C-R-E-D、三查、里程碑 |
| [[口语评价六维对照表_稳定连贯细腻可理解]] | reference | 复用：评分标准 |
| handoff | handoff | 接续入口：当前位置 / 下一步 / 关联文件 |

## 4. Frontmatter 约定

- `type`: `speaking-material` / `speaking-session` / `speaking-error` / `sop` / `mock-record` / `scorecard`
- 必填：`date` / `topic` / `part` / `用时` / `status`
- 评分段：六维 `fluency / range / coherence / accuracy / nuance / intelligibility` + 三查达标

## 5. 数据流（每日工作流）

1. 会话开始：agent 读 handoff + 计分卡 + 错题本，零重述接续；
2. 每段 24m：材料吸收 6m（C-R-E-D 拆解 + 跟读）→ 作答 10m（三查）→ 结构/专项 8m；
3. 反馈 ≤ 3m：只改 top 1 → 复答那一题；
4. 收尾：写计分卡 → 错题入库 → 更新当日日志与 handoff；
5. 每周：agent 聚合 top 3 错因与趋势，输出周复盘。

## 6. Agent 便利

- **自动接续**：handoff 自动发现，跨会话不丢上下文；
- **错因驱动**：错题本统计 → 针对性选材/出题（如 Q4 摇摆 → 立场稳定性专项）；
- **评分一致**：六维模板跨天可比，周聚合趋势；
- **材料审计**：AI 生成材料按清单过审（C-R-E-D / 三查 / 时间预算 / 真题结构）；
- **录音自评**：Intelligibility 留录音回放自评位。

## 7. 错误处理

- 错因闭环：错误 → 修正入库 → 复答 → 周聚合；
- 复现触发器：同一错误复现 ≥ 2 次 → 下周专项；
- 纠偏触发器：沿用 SOP §7（连续两周期同维度无提升 → 停线诊断）。

## 8. 验证标准

- 会话零重述接续（用户不说"我之前练到哪"）；
- 每题反馈 ≤ 3 分钟；
- 周复盘 ≤ 30 分钟；
- 跨天六维可比、趋势可查；
- 现有 71 文件零断链（不迁移）。

## 9. 实施清单

本次已建：设计文档、分支 README、今日训练日志、错题本、计分卡与 handoff 更新。
后续待办：周复盘模板、材料库索引（复用 360 篇 / 10 篇 / 题库）、录音附件引用约定。
