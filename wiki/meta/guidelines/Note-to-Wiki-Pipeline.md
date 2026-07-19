# Note to Wiki Pipeline（笔记转 Wiki 最佳实践）

**Version**: 1.0  
**Date**: 2026-06-29  
**Purpose**: 从单篇笔记到多类型 Wiki 页面的标准化、可复用操作流程。

---

## 1. 文档目的

本流程用于将一篇原始笔记系统化地转化为多个不同粒度、相互关联的 Wiki 页面，实现**知识爆炸**。

**核心目标**：
- 提高知识复用性
- 构建结构化知识网络
- 保持操作一致性

---

## 2. 适用场景

- 单篇高质量笔记的深度转化
- 需要从一篇笔记中提取多个概念、方法、模板等内容
- 追求知识网络化而非简单归档

---

## 3. 推荐操作流程（7 步法）

### Step 1: 准备阶段
- 加载以下 Skill：
  - `conversion-agent.skill.md`
  - `page-type-decision.skill.md`
  - `Knowledge-Explosion-Constraints.md`
- 快速判断笔记是否值得处理（是否触及禁止拆分清单）

### Step 2: 阅读与理解
- 通读整篇笔记，抓住核心价值
- 初步判断笔记类型（提示词 / 表达技巧 / 框架 / 综合等）

### Step 3: 维度拆解
使用以下 7 个维度进行拆解：

| 维度   | 对应 Wiki 类型     | 提取重点               |
|--------|--------------------|------------------------|
| 概念   | `concept`          | 抽象原则、框架         |
| 方法   | `concept` / `prompt` | 具体技巧、流程         |
| 模板   | `template` / `prompt` | 可复用结构或指令       |
| 示例   | `concept`          | 正例、反例、案例       |
| 实体   | `entity`           | 具体的人、工具、考试   |
| 问题   | `qa`               | 高质量问答             |
| 速查   | `quickref`         | 列表、表格、对比       |

**目标**：尽量提取 **2~4 个不同维度**。

### Step 4: 决策是否触发知识爆炸
回答以下问题：
- 是否包含多个高价值维度？
- 能否生成 2 个以上有意义的 Wiki 页面？
- 是否满足拆分粒度判断标准？

**决策**：
- 是 → 进入知识爆炸流程
- 否 → 仅做常规单类型转换

### Step 5: 创建页面并建立关联
- 使用对应模板创建页面：
  - `concept` → `Concept-Page-Template.md`
  - `prompt` → `Prompt-Page-Template.md`
  - `quickref` → `QuickRef-Page-Template.md`
- 每个页面至少添加 **2~4 个** 有意义的 wikilink

### Step 6: 生成报告与记录
- 生成 **Knowledge Explosion Report**（使用模板）
- 更新以下文件：
  - `Conversion-Tracker.md`
  - `INDEX.md`（必要时）
  - `LOG.md`

### Step 7: 质量复盘（推荐）
检查以下内容：
- 是否符合约束条件？
- 页面关联是否有效？
- 是否存在过度拆分？

---

## 4. 输出物清单

| 输出物                        | 是否必做 | 说明 |
|-------------------------------|----------|------|
| 多个 Wiki 页面                | 是       | 按类型创建 |
| Knowledge Explosion Report    | 推荐     | 记录拆解过程 |
| Conversion-Tracker 更新       | 是       | 记录所有生成页面 |
| INDEX.md / LOG.md 更新        | 是       | 必要时更新 |

---

## 5. 推荐工具与引用

- **主 Skill**：`conversion-agent.skill.md`
- **类型决策**：`page-type-decision.skill.md`
- **约束参考**：`Knowledge-Explosion-Constraints.md`
- **类型定义**：`Wiki-Page-Type-Guide.md`
- **操作手册**：`Knowledge-Explosion-Workflow.md`

---

## 6. 注意事项

- **最小拆分原则**：单篇笔记建议生成 **2~5 个** Wiki 页面
- **优先概念层**：多个维度中优先提取 `concept`
- **重视关联**：知识爆炸的核心在于连接，而非数量
- **避免低价值拆分**：严格遵守禁止拆分清单

---

*本流程为日常处理笔记转 Wiki 的标准化操作规范。*