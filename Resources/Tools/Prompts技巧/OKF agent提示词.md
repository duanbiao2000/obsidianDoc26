---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source:
domain:
core_concepts:
---


基于对话中提到的 OKF（Open Knowledge Framework）逻辑，核心是将**知识**与**操作**分离：Concepts 是原子化的知识单元，Playbook 是调用这些知识的流程指南。

以下是将任意 Markdown 笔记转换为 OKF 格式的**具体操作步骤**和**一键式提示词**。

---

### 一、转换操作流程（4 步法）

| 步骤 | 动作 | 目标 |
|------|------|------|
| **1. 语义解构** | 通读原文，识别 **3-7 个核心概念**（名词性知识点）和 **1-2 条操作流程**（动词性步骤） | 区分"是什么"（Concept）和"怎么做"（Playbook） |
| **2. 原子化封装** | 为每个概念创建独立文件，只保留该概念的：定义、原理、示例、边界条件 | 确保单个 Concept 可独立被 AI/人类理解，不依赖上下文 |
| **3. 建立语义链** | 在 Concept 文件底部添加 `Related: [[Concept A]], [[Concept B]]`<br>在 Playbook 步骤中引用 Concept：`参考 [[Concept X]] 完成此步` | 让 Agent 能通过链接跳转，形成知识图谱 |
| **4. 生成导航层** | 创建 `index.md`（地图），列出所有 Concepts 和 Playbook，并标注学习路径 | 让人类能浏览，让 AI 能索引 |

---

### 二、Chat 版一键提示词（直接复制使用）

```markdown
你是一位 OKF (Open Knowledge Framework) 架构师。请将用户提供的 Markdown 笔记转换为标准的 **OKF Mini Bundle** 格式。

## 转换原则
1. **Concept 原子化**：将知识拆解为 3-5 个独立概念文件（concept_*.md），每个只解释一个核心思想（类似百科词条）
2. **Playbook 流程化**：将原文中的操作步骤、方法、技巧提取为 1 个 playbook_*.md，只写"做什么"和"顺序"，不解释原理（原理通过 [[链接]] 引用 Concept）
3. **双向链接**：所有文件使用 [[文件名]] 或 [显示文本](文件名.md) 建立语义关联
4. **元数据标准化**：每个文件顶部必须包含 YAML frontmatter

## 文件结构模板

### 1. Concept 文件（concept_{序号}_{概念名}.md）
```yaml
---
title: 概念中文名
type: concept
concept_id: C{序号}
tags: [主题标签]
related: [[concept_xxx], [playbook_xxx]]
---
# 概念中文名

## 一句话定义
[用 1-2 句话精确定义，适合 AI 快速抓取]

## 详细解释
[原文中关于该概念的解释，保持完整信息但重新组织]

## 关键要素
- 要素 A：[说明]
- 要素 B：[说明]

## 实际示例
[原文中的例子，或根据上下文补充]

## 关联概念
- 上游/基础：[[concept_xxx]]
- 下游/应用：[[playbook_xxx]]
```

### 2. Playbook 文件（playbook_{主题}.md）
```yaml
---
title: 操作手册标题
type: playbook
playbook_id: P1
goal: [本 Playbook 要达成的目标]
target_audience: [适用人群]
required_concepts: [[concept_1], [concept_2]]
---
# 操作手册标题

## 适用场景
[什么时候用这个 Playbook]

## 前置准备
- 已掌握：[[concept_xxx]]
- 工具/环境：[需要的东西]

## 执行步骤
### Step 1: [动作名称]
参考 [[concept_xxx]]，执行 [具体操作]。验证标准：[可检查的结果]

### Step 2: [动作名称]
...

## 常见问题
**Q: [问题]**  
A: [解答，可引用 [[concept_xxx]]]

## 进阶路径
完成本 Playbook 后，可学习 [[concept_xxx]] 或执行 [[playbook_xxx]]
```

### 3. Index 文件（index.md）
```yaml
---
title: {主题} OKF Bundle
type: index
version: 0.1
---
# {主题} 知识 bundle

## 概览
[原文主题的 1 段简介]

## 知识地图
```mermaid
[可选：用文本流程图展示 Concept 与 Playbook 的关系，如：]
concept_A --> playbook_1 --> concept_B
```

## 快速入口
### 核心概念（Concepts）
1. [[concept_1_xxx]] - [一句话描述]
2. [[concept_2_xxx]] - [一句话描述]
...

### 操作指南（Playbooks）
1. [[playbook_xxx]] - [适用场景描述]

## 使用建议
- **人类学习路径**：建议按 C1 → C2 → P1 顺序阅读
- **Agent 调用指令**："基于本 Bundle 中的 [[concept_xxx]] 和 [[playbook_xxx]]，帮我完成 [任务]"
```

## 输出要求
1. 使用代码块分别展示每个文件内容，文件名作为代码块标题（如 ```markdown:concept_1_xxx.md）
2. 确保原文所有信息**不丢失**，但被重新归类到 Concept 或 Playbook 中
3. 如果原文没有明确操作流程，Playbook 改为"学习导航手册"，指导如何阅读这些 Concept
4. 保持语言与原文一致（中文或英文）

请转换以下 Markdown 内容：

[PASTE YOUR MARKDOWN HERE]
```

---

### 三、使用示例（IELTS Part 2 片段）

**输入片段（原始笔记）**：
```markdown
雅思 Part 2 故事技巧：要用"PEEP 结构"。Point（观点）- Example（例子）- Explanation（解释）- Point（回扣）。比如描述"a memorable journey"，先说出这是去云南的火车（Point），然后描述车上遇到的老奶奶（Example），解释这个经历为什么改变你对旅行的看法（Explanation），最后说这就是你难忘的旅程（Point）。记住时间控制在 2 分钟，不要过快。
```

**提示词输出（OKF Bundle）**：

```markdown:concept_1_peep_structure.md
---
title: PEEP 结构
type: concept
concept_id: C1
tags: [ielts, speaking, part2, structure]
related: [[concept_2_time_control], [playbook_1_storytelling]]
---
# PEEP 结构

## 一句话定义
雅思口语 Part 2 故事叙述的四种步框架：Point（观点）→ Example（例子）→ Explanation（解释）→ Point（回扣）。

## 详细解释
PEEP 是一种确保故事完整且逻辑清晰的叙述结构：
- **Point（观点）**：开门见山回答问题，给出核心主题
- **Example（例子）**：提供具体、生动的个人经历或观察
- **Explanation（解释）**：阐述该例子的意义、感受或影响
- **Point（回扣）**：结尾再次强调主题，形成首尾呼应

## 关键要素
- 完整性：四个环节缺一不可，避免故事突兀结束
- 个人化：Example 必须是具体细节，而非泛泛而谈
- 深度：Explanation 部分展示语言能力和思维深度

## 实际示例
**题目**：Describe a memorable journey  
**应用**：
- P：这是一次去云南的火车旅行
- E：车上遇到一位带着孙子的老奶奶，分享了她年轻时的旅行故事
- E：这让我意识到旅行不仅是看风景，更是与人连接
- P：因此这成为我人生中最难忘的旅程

## 关联概念
- 应用方法：[[playbook_1_storytelling]]
- 相关限制：[[concept_2_time_control]]
```

```markdown:concept_2_time_control.md
---
title: 2 分钟时间控制
type: concept
concept_id: C2
tags: [ielts, speaking, time-management]
related: [[concept_1_peep_structure]]
---
# 2 分钟时间控制

## 一句话定义
雅思口语 Part 2 个人陈述环节的标准时长限制，要求考生在 2 分钟内完成作答，既不可过短也不可超时。

## 详细解释
...
```

```markdown:playbook_1_storytelling.md
---
title: Part 2 故事叙述操作手册
type: playbook
playbook_id: P1
goal: 在 2 分钟内完成一个结构完整、细节丰富的雅思 Part 2 故事
target_audience: 雅思口语考生，目标分数 6.5+
required_concepts: [[concept_1_peep_structure], [concept_2_time_control]]
---
# Part 2 故事叙述操作手册

## 适用场景
拿到 Part 2 话题卡（Cue Card）后，1 分钟准备时间内的快速构思与 2 分钟陈述执行。

## 前置准备
- 已理解 [[concept_1_peep_structure]] 的四个环节
- 已掌握 [[concept_2_time_control]] 的 pacing 技巧

## 执行步骤
### Step 1: 审题与定位（10秒）
确定话题核心要求，决定 Point 的主题方向。

### Step 2: PEEP 骨架搭建（40秒）
在草稿纸上快速写下四个关键词：
- P: [主题]
- E: [具体人物/地点/物品]
- E: [感受/影响]
- P: [重复主题用词]

### Step 3: 陈述执行（2分钟）
按 [[concept_1_peep_structure]] 的顺序展开，每环节分配约 30 秒。监控语速，确保不超时（参考 [[concept_2_time_control]]）。

## 验证标准
- [ ] 故事包含明确的 Example 细节
- [ ] 结尾有 Explanation 升华
- [ ] 时长在 1 分 45 秒 - 2 分钟之间
```

---

### 四、关键技巧总结

1. **Concept 不要写"步骤"**：如果看到"首先、然后、最后"，那属于 Playbook；Concept 只解释"是什么"和"为什么"。
2. **Playbook 不要写"定义"**：如果 Playbook 需要解释某个术语，用 `[[concept_xxx]]` 占位，不要展开。
3. **保持链接活性**：确保每个 Concept 至少被 1 个 Playbook 引用，每个 Playbook 至少链接 2 个 Concept，形成网络。
4. **Index 是入口**：未来给 AI 的指令可以是："基于 `index.md` 中的 [[concept_1]] 和 [[playbook_1]]，帮我..." —— AI 会自动跳转读取关联文件。

这样转换后，你的笔记就从"线性文本"变成了"可导航的知识图谱"，既方便人类复习，也能让 AI Agent 精准调用。

### 示例

[[playbook_01_philosopher_journal]]