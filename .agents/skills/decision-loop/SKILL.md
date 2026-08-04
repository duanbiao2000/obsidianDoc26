---
name: decision-loop
description: "Run the personal Decision-Profile system: before a major decision, recommend 2-3 decision paradigms matched to the user's decision profile, create a decision card, and run a red-team (红蓝对抗) loop to stress-test the plan; after the decision lands, record the outcome; periodically distill cards into the evolving decision profile. Use when the user faces a significant choice (career, finance, study, health, relationships), asks for red-teaming, blind-spot analysis, paradigm or framework recommendations, wants to log, review, or replay a decision, or says to update or refine their decision profile."
---

# Decision-Loop

个人决策闭环系统（Decision-Profile）：决策前匹配范式 + 红蓝对抗，决策后回写，定期提炼画像。项目文件是唯一事实来源，本技能只指挥流程，不复制内容。

根据用户意图进入对应工作流：新决策 / 红蓝对抗 / 范式推荐 → **A**；报告决策结果 → **B**；提炼画像 → **C**。

## 项目位置

- 项目根：`raw/01_Projects/Decision-Profile/`
- 入口：[MOC-Decision-Profile.md](raw/01_Projects/Decision-Profile/MOC-Decision-Profile.md)
- 画像：[Profile.md](raw/01_Projects/Decision-Profile/Profile.md)（决策前必读）
- 范式索引：[00-Paradigm-Index.md](raw/01_Projects/Decision-Profile/Paradigms/00-Paradigm-Index.md)
- 卡片模板：[Templates/Decision-Card.md](raw/01_Projects/Decision-Profile/Templates/Decision-Card.md)
- 使用手册：[README.md](raw/01_Projects/Decision-Profile/README.md)（人读版全流程，与本技能互补）
- loop 规格：`01_Inbox/2026-07-11-自我服务.md` 第五节

## 工作流 A：决策前（做决策 / 红蓝对抗 / 范式推荐）

1. 读 `Profile.md`（已知盲点 + 决策前调用清单）。
2. 读范式索引，按「决策类别 × stakes × 盲点」选 2-3 个范式，向用户说明每个范式的核心问题（不超过 3 个）。
3. 收集决策上下文：问题、选项（≥2）、stakes、截止时间。若 stakes = low，提醒用户不值得 loop，直接决定。
4. 若尚无卡片：复制 `Templates/Decision-Card.md` 到 `Cards/YYYY-MM-DD-决策-<主题>.md`，填第 1、2 节（第 2 节必须在 loop 之前写）。
5. 跑红蓝对抗 loop：
   - **GOAL**：穷尽最致命盲点，输出带对冲方案的清单；
   - **EACH ITERATION**：红方批判（只许新盲点）→ 蓝方对冲 → 输出 vN；
   - **VERIFY**：去重校验 + 证据缺口标注 + 硬校验（最致命 3 条必须用真实信息核对）；
   - **STOP WHEN**：连续两轮无新盲点，且最致命 3 条已通过真实核对。
6. 填第 3、4 节（盲点/对冲、最终判断、理由、信心分、触发条件）；卡片状态 → `decided`。

## 工作流 B：决策落地后（用户报告结果）

1. 回填第 5 节（实际结果 / 与原判断的偏差 / 一句话教训）和第 6 节（1-2 条画像候选 + 范式使用效果）；状态 → `reviewing`。
2. 提示用户是否立即提炼画像（否则按工作流 C 节奏进行）。

## 工作流 C：定期提炼（每 5 张卡 / 每季度 / 用户要求）

1. 扫描 `Cards/`，统计盲点复现次数与范式使用效果。
2. 更新 `Profile.md`：
   - 候选 → 确认：某盲点/优势在 ≥2 张卡复现；被反驳 → 降级为「待复核」并附证据卡链接；
   - 每条画像条目带证据卡链接（可反向追溯）；
   - 升版 vN → vN+1，changelog ≤3 行（新增 / 修正 / 删除）。
3. 更新范式索引的「使用记录」。

## 铁律

1. Profile 只从 Cards 归纳，不凭空写。
2. 范式是视角不是答案，最多 3 个；决策权始终在用户。
3. 只处理 stakes = high/medium 的决策。
4. 信心分（0-5）决策后不改，它是校准数据。

## 红蓝对抗提示词要点

用长期项目上下文锁死背景，然后：

> 你是我的决策红队。每轮只提出新盲点（3 个最致命 + 2 个成本漏斗），重复旧点计 0 分；每条标注它依赖的事实/数据（证据缺口）；给出可落地对冲方案；连续两轮无新盲点且最致命 3 条已通过真实信息核对时，输出最终行动清单并停止。
