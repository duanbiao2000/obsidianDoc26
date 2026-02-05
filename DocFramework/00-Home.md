---
title: "文档规范框架学习中心 | Documentation Framework Learning Hub"
cssclasses: dashboard
status: in-progress
tags:
  - doc-framework
  - home
date: 2026-02-04
---

# 文档规范框架学习中心 | Documentation Framework Learning Hub

欢迎来到文档规范框架学习中心！这里系统地收集和标注了主流的文档规范框架，帮助你学习和应用文档最佳实践。

Welcome to the Documentation Framework Learning Hub! This is a systematic collection of annotated documentation standards frameworks to help you learn and apply documentation best practices.

---

## 学习框架概览 | Framework Overview

| 框架 | Framework | 来源 | Source | 核心关注 | Focus | 难度 | Difficulty | 状态 | Status |
|------|-----------|------|--------|---------|-------|------|------------|------|--------|
| [[Diataxis/00-Index\|Diataxis]] | [diataxis.fr](https://diataxis.fr/) | 文档分类与受众 | Doc classification & audience | 初级 | Beginner | 🟢 | 进行中 | In Progress |
| [[Google-Style-Guide/00-Index\|Google Style Guide]] | [Google Developers](https://developers.google.com/tech-writing) | 以用户为中心 | User-centered | 中级 | Intermediate | 🟢 | 进行中 | In Progress |
| [[Microsoft-Style-Guide/00-Index\|Microsoft Style Guide]] | [Microsoft Docs](https://docs.microsoft.com/en-us/style-guide/) | 简洁一致 | Concise & consistent | 中级 | Intermediate | 🟢 | 进行中 | In Progress |
| [[Write-The-Docs/00-Index\|Write the Docs]] | [Write the Docs](https://www.writethedocs.org/) | 文档实践 | Documentation practice | 高级 | Advanced | ⚪ | 计划中 | Planned |

---

## 推荐学习路径 | Recommended Learning Paths

### 路径一：快速入门 | Quick Start (1-2 weeks)

适合初学者，快速掌握文档规范的核心概念。

For beginners, quickly grasp core concepts of documentation standards.

1. ✅ [[Diataxis/02-Annotated/start-here\|Diataxis 框架概述]] - 理解四个维度 | Understand the four dimensions
2. ✅ [[Google-Style-Guide/02-Annotated/highlights\|Google 基础]] - Google 文档原则入门
3. ✅ [[Microsoft-Style-Guide/02-Annotated/welcome\|Microsoft 基础]] - Microsoft 文档风格入门

### 路径二：深入学习 | Deep Dive (4-6 weeks)

全面学习三大框架，建立完整的文档规范知识体系。

Comprehensive learning of three major frameworks.

1. 完成 Diataxis 全部内容
2. 完成 Google Style Guide 核心部分
3. 完成 Microsoft Style Guide 核心部分
4. ⬜ 综合练习：为自己的项目创建文档规划

### 路径三：专家路径 | Expert Path (ongoing)

持续学习，参与社区，创建自己的文档风格指南。

Continuous learning, community engagement, create your own style guide.

1. 完成所有框架学习
2. 研究 Write the Docs 高级实践
3. 参与文档社区讨论
4. 创建自己的文档风格指南

---

## 学习进度仪表盘 | Learning Progress Dashboard

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  source_type AS "来源 | Source",
  learning_stage AS "阶段 | Stage",
  reading_progress AS "进度 | Progress"
FROM "DocFramework"
WHERE learning_stage != "mastered" AND status != "not-started"
SORT source_type, importance DESC
```

---

## 最近更新 | Recent Updates

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  dateformat(file.mtime, "yyyy-MM-dd") AS "更新日期 | Date"
FROM "DocFramework"
WHERE file.mtime >= date(today) - dur(7 days)
SORT file.mtime DESC
LIMIT 5
```

---

## 待复习内容 | Due for Review

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  dateformat(next_review, "yyyy-MM-dd") AS "复习日期 | Review Date",
  importance AS "重要性 | Importance"
FROM "DocFramework"
WHERE next_review <= date(today) + dur(7 days) AND next_review >= date(today)
SORT next_review ASC
```

---

## 学习统计 | Learning Statistics

### 总体进度 | Overall Progress

```dataview
TABLE WITHOUT ID
  "<progress value='" + reading_progress + "' max='100%'></progress>" AS "总进度 | Total Progress",
  length(filter(rows, (r) => r.learning_stage = "mastered")) AS "已掌握 | Mastered",
  length(filter(rows, (r) => r.learning_stage != "mastered" AND r.status != "not-started")) AS "学习中 | Learning"
FROM "DocFramework"
WHERE status != "not-started"
```

### 按框架统计 | By Framework

```dataview
TABLE
  source_type AS "框架 | Framework",
  length(rows) AS "文档数 | Docs",
  length(filter(rows, (r) => r.learning_stage = "mastered")) AS "已掌握 | Mastered",
  length(filter(rows, (r) => r.status = "annotated")) AS "已标注 | Annotated"
FROM "DocFramework"
WHERE status != "not-started"
GROUP BY source_type
```

---

## 核心概念索引 | Core Concepts Index

### 文档分类 | Document Classification

- [[Diataxis/02-Annotated/tutorials\|教程 | Tutorials]] - 学习导向 | Learning-oriented
- [[Diataxis/02-Annotated/how-to-guides\|操作指南 | How-to Guides]] - 问题导向 | Problem-oriented
- [[Diataxis/02-Annotated/reference\|参考 | Reference]] - 信息导向 | Information-oriented
- [[Diataxis/02-Annotated/explanation\|解释 | Explanation]] - 理解导向 | Understanding-oriented

### 写作原则 | Writing Principles

- [[Google-Style-Guide/02-Annotated/highlights\|重点摘要 | Highlights]] - Google 文档原则概览
- [[Microsoft-Style-Guide/02-Annotated/welcome\|欢迎 | Welcome]] - Microsoft 风格指南入门

---

## 练习与案例 | Exercises & Cases

### 分类练习 | Classification Exercises

- [[Diataxis/03-Exercises/classification-practice\|文档分类练习]] - 判断文档属于哪个维度
- [[Diataxis/03-Exercises/refactoring-practice\|文档重构练习]] - 拆分混合维度文档

### 改进案例 | Improvement Cases

- [[Google-Style-Guide/03-Exercises/before-after\|改进前后对比]] - 文档改进案例
- [[Microsoft-Style-Guide/03-Exercises/word-choice\|用词优化练习]] - 提升写作质量

### 实践项目 | Practice Projects

- [[My-Projects/doc-improvement-plan\|文档改进计划]] - 应用到实际项目
- [[My-Projects/style-guide\|项目风格指南]] - 创建团队文档规范

---

## 学习资源 | Learning Resources

### 外部资源 | External Resources

- [Diataxis 官网](https://diataxis.fr/) | [Diataxis Official Site](https://diataxis.fr/)
- [Google Developer Documentation Style Guide](https://developers.google.com/tech-writing)
- [Microsoft Writing Style Guide](https://docs.microsoft.com/en-us/style-guide/)
- [Write the Docs](https://www.writethedocs.org/)
- [Documentation Spring](https://www.diataxis.fr/spring/)

### 工具 | Tools

- [[DocFramework/00-Templates/annotated-doc-template\|标注文档模板]] | Annotated Document Template
- [[DocFramework/00-Templates/frontmatter-template\|元数据模板]] | Metadata Template
- [[.claude/skills/doc-framework-annotator\|Claude Code Skill]] - 自动化标注工具

---

## 个人笔记 | Personal Notes

> [!note] 学习心得 | Learning Insights

记录你的学习心得和感悟...

Record your learning insights and reflections...

**行动计划 | Action Plan**：

- [ ] Action item 1
- [ ] Action item 2
- [ ] Action item 3

---

## 快速导航 | Quick Navigation

### 按学习阶段 | By Learning Stage

- [[?阅读中 | Reading]]
- [[?理解中 | Comprehending]]
- [[?应用中 | Applying]]
- [[?已掌握 | Mastered]]

### 按重要性 | By Importance

- [[?#importance/critical\|关键内容 | Critical]]
- [[?#importance/high\|重要内容 | High]]
- [[?#importance/medium\|中等内容 | Medium]]

### 按难度 | By Difficulty

- [[?#difficulty/beginner\|初级内容 | Beginner]]
- [[?#difficulty/intermediate\|中级内容 | Intermediate]]
- [[?#difficulty/advanced\|高级内容 | Advanced]]

---

**开始学习**：[[Diataxis/00-Index]] | **查看模板**：[[DocFramework/00-Templates]]

---

> [!tip] 使用提示 | Usage Tips
>
> 1. **使用 Dataview** | **Use Dataview**：确保已安装 Dataview 插件以显示仪表盘
> 2. **标注文档** | **Annotate Documents**：使用 `doc-framework-annotator` Skill 进行自动标注
> 3. **定期复习** | **Regular Review**：根据 `next_review` 日期定期复习已学内容
> 4. **实践应用** | **Apply Practice**：完成练习后尝试应用到实际项目
