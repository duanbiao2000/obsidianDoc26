---
type: speaking-branch-hub
tags: [ielts, speaking, hub]
created: 2026-08-04
updated: 2026-08-04
status: active
---

# 口语训练分支 · daily-ielts-speaking

> 口语专项训练轨道：材料吸收 / 快答 / 独白 / 深度问答 / 错题 / 六维评分。与 `daily-ielts-full-mock`（每日整套真题）分工；`main` 为稳定基线。

## 文件地图

- 系统 SOP：[[口语训练系统-原则与里程碑]]
- 评分标准：[[口语评价六维对照表_稳定连贯细腻可理解]]
- 当日日志：[[每日口语训练日志-2026-08-04]]
- 错题台账：[[口语错题本]]
- 计分卡：[[每日进步计分卡-2026-08-04]]
- 设计文档：[[2026-08-04-daily-ielts-speaking-design]]

## 使用流程

1. 会话开始：agent 读 handoff + 计分卡 + 错题本，接续训练；
2. 每段 24m：材料吸收 6m（C-R-E-D 拆解 + 跟读）→ 作答 10m（三查）→ 结构/专项 8m；
3. 反馈 ≤ 3m：只改 top 1 → 复答；
4. 收尾：计分卡 → 错题入库 → 更新日志与 handoff。

## Frontmatter 约定

- `type`: `speaking-material` / `speaking-session` / `speaking-error` / `sop` / `mock-record` / `scorecard`
- 必填：`date` / `topic` / `part` / `用时` / `status`
- 评分段：六维 + 三查达标

## 日志模板（一天一页）

```markdown
---
type: speaking-session
tags: [ielts, speaking, session]
date: YYYY-MM-DD
part: 1|2|3|综合
用时: 待报
status: in-progress
---

# 每日口语训练日志 · YYYY-MM-DD

## 话题与作答

## 六维评分

| 维度 | 分 | 证据 |
| :--- | :--- | :--- |

## Top 1 要改

## 下一步
```
