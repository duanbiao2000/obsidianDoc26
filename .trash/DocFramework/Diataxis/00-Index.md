---
title: "Diataxis Framework Index | Diátaxis 框架索引"
source: "https://diataxis.fr/"
source_type: "Diataxis"
status: not-started
tags:
  - doc-framework
  - diataxis
cssclasses: doc-learning
date: 2026-02-04
---

# Diataxis Framework | Diátaxis 框架

> [!abstract] 框架简介 | Framework Overview
>
> **Diátaxis** 是一个系统的文档框架，由 **Daniele Procida** 创建。它将文档内容按**目的**（purpose）和**受众**（audience）分为四个维度：
>
> **Diátaxis** is a systematic documentation framework created by **Daniele Procida**. It categorizes documentation content by **purpose** and **audience** into four dimensions:
>
> - **Tutorials** - 教程（学习导向 | Learning-oriented）
> - **How-to Guides** - 操作指南（问题导向 | Problem-oriented）
> - **Reference** - 参考（信息导向 | Information-oriented）
> - **Explanation** - 解释（理解导向 | Understanding-oriented）
>
> **官方网址 | Official Site**: <https://diataxis.fr/>

---

## 框架核心理念 | Core Principles

> [!success] 核心思想 | Core Idea
>
> 一个优秀的文档项目应该**包含全部四个维度**，但**明确区分**它们：
>
> A great documentation project should **include all four dimensions**, but **clearly distinguish** them:
>
> - 让读者**知道**他们在看哪种文档 | Let readers **know** what type of document they're reading
> - 不同读者有不同需求 | Different readers have different needs
> - 混合在一起会让所有人都找不到需要的内容 | Mixing them together makes it hard for everyone

---

## 四个维度详解 | The Four Dimensions

### 1. Tutorials | 教程

> [!info] 维度特征 | Dimension Characteristics
>
> | 属性 | Attribute | 值 | Value |
> |------|-----------|-----|-------|
> | 受众 | Audience | 初学者 | Beginners |
> | 目的 | Purpose | 学习 | Learning |
> | 形式 | Format | 教学式、步骤化 | Instructional, step-by-step |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/tutorial|原始文档 | Original]]
> - [[02-Annotated/tutorial|标注版本 | Annotated]]

---

### 2. How-to Guides | 操作指南

> [!info] 维度特征 | Dimension Characteristics
>
> | 属性 | Attribute | 值 | Value |
> |------|-----------|-----|-------|
> | 受众 | Audience | 实践者 | Practitioners |
> | 目的 | Purpose | 解决问题 | Problem-solving |
> | 形式 | Format | 问题-解决方案 | Problem-solution |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/how-to-guide|原始文档 | Original]]
> - [[02-Annotated/how-to-guide|标注版本 | Annotated]]

---

### 3. Reference | 参考

> [!info] 维度特征 | Dimension Characteristics
>
> | 属性 | Attribute | 值 | Value |
> |------|-----------|-----|-------|
> | 受众 | Audience | 专家 | Experts |
> | 目的 | Purpose | 查找信息 | Information lookup |
> | 形式 | Format | 结构化列表、表格 | Structured lists, tables |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/reference|原始文档 | Original]]
> - [[02-Annotated/reference|标注版本 | Annotated]]

---

### 4. Explanation | 解释

> [!info] 维度特征 | Dimension Characteristics
>
> | 属性 | Attribute | 值 | Value |
> |------|-----------|-----|-------|
> | 受众 | Audience | 理解者 | Understanders |
> | 目的 | Purpose | 理解背景 | Understanding context |
> | 形式 | Format | 叙述性、讨论式 | Narrative, discursive |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/explanation|原始文档 | Original]]
> - [[02-Annotated/explanation|标注版本 | Annotated]]

---

## 学习路径 | Learning Path

### 推荐顺序 | Recommended Order

1. [[02-Annotated/overview|框架概述 | Framework Overview]] - 理解四个维度
2. [[02-Annotated/tutorials|教程详解 | Tutorials Deep Dive]]
3. [[02-Annotated/how-to-guides|操作指南详解 | How-to Guides Deep Dive]]
4. [[02-Annotated/reference|参考详解 | Reference Deep Dive]]
5. [[02-Annotated/explanation|解释详解 | Explanation Deep Dive]]
6. [[02-Annotated/practical-application|实际应用 | Practical Application]]

---

## 学习进度 | Learning Progress

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  learning_stage AS "阶段 | Stage",
  reading_progress AS "进度 | Progress",
  dateformat(next_review, "MM-dd") AS "复习 | Review"
FROM "DocFramework/Diataxis"
WHERE learning_stage != "mastered" AND status != "not-started"
SORT file.link
```

---

## 练习与案例 | Exercises & Cases

### 分类练习 | Classification Exercises

- [[03-Exercises/classification-practice|文档分类练习 | Classification Practice]]
- [[03-Exercises/identify-dimensions|识别维度练习 | Identify Dimensions]]

### 重构练习 | Refactoring Exercises

- [[03-Exercises/refactoring-mixed-docs|重构混合文档 | Refactor Mixed Documents]]
- [[03-Exercises/create-navigation|创建清晰导航 | Create Clear Navigation]]

### 应用案例 | Application Cases

- [[03-Exercises/real-world-examples|真实案例分析 | Real-world Examples]]
- [[03-Exercises/apply-to-project|应用到我的项目 | Apply to My Project]]

---

## 相关资源 | Related Resources

### 官方资源 | Official Resources

- [Diataxis 官网](https://diataxis.fr/) | Official Site
- [Diataxis GitHub](https://github.com/diataxis/documentation-framework) | Source Repository
- [Daniele Procida 的演讲视频](https://www.youtube.com/watch?v=k7--b3MKW8Y) | Talk by Creator

### 扩展阅读 | Extended Reading

- [[Google-Style-Guide/00-Index|Google Style Guide]] - Google 文档规范
- [[Microsoft-Style-Guide/00-Index|Microsoft Style Guide]] - Microsoft 文档规范
- [[Write-The-Docs/00-Index|Write the Docs]] - 文档实践社区

---

## 个人笔记 | Personal Notes

> [!note] 我的学习笔记 | My Learning Notes

记录你对 Diataxis 框架的理解和感悟...

Record your understanding and insights about the Diataxis framework...

**关键收获 | Key Takeaways**：

- [ ] Takeaway 1
- [ ] Takeaway 2
- [ ] Takeaway 3

**疑问待解答 | Questions to Explore**：

- [ ] Question 1
- [ ] Question 2

---

## 快速链接 | Quick Links

- [[../00-Home|返回学习中心 | Back to Learning Hub]]
- [[../00-Templates/annotated-doc-template|查看模板 | View Template]]
- [[01-Original|查看原始文档 | View Original Docs]]
