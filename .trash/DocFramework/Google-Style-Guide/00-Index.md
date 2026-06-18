---
title: "Google Developer Documentation Style Guide Index"
source: "https://developers.google.com/tech-writing"
source_type: "Google"
status: not-started
tags:
  - doc-framework
  - google
  - tech-writing
cssclasses: doc-learning
date: 2026-02-04
---

# Google Developer Documentation Style Guide

> [!abstract] 框架简介 | Framework Overview
>
> **Google Developer Documentation Style Guide** 是 Google 为技术文档作者提供的写作指南，强调**以用户为中心**（user-centered）的文档设计理念。
>
> The **Google Developer Documentation Style Guide** is a writing guide for technical documentation authors provided by Google, emphasizing a **user-centered** approach to documentation design.
>
> **官方网址 | Official Site**: <https://developers.google.com/tech-writing>

---

## 框架核心理念 | Core Principles

> [!success] 核心原则 | Core Principles
>
> 1. **以用户为中心 | User-Centered** - 始终考虑读者的需求
> 2. **清晰简洁 | Clear and Concise** - 用最少的词语传达信息
> 3. **结构化写作 | Structured Prose** - 使用清晰的标题和段落结构
> 4. **可扫描性 | Scannability** - 让读者快速找到需要的信息

---

## 主要内容模块 | Main Content Modules

### 1. 写作基础 | Writing Fundamentals

> [!info] 模块概述 | Module Overview
>
> | 主题 | Topic | 描述 | Description |
> |------|-------|------|-------------|
> | 清晰写作 | Writing Clearly | 使用简明的语言和结构 | Use simple language and structure |
> | 可扫描性 | Scannability | 组织内容以便快速浏览 | Organize for quick scanning |
> | 主动语态 | Active Voice | 使用主动语态增强可读性 | Use active voice for readability |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/writing-clearly|原始文档 | Original]]
> - [[02-Annotated/writing-clearly|标注版本 | Annotated]]

---

### 2. 内容组织 | Content Organization

> [!info] 模块概述 | Module Overview
>
> | 主题 | Topic | 描述 | Description |
> |------|-------|------|-------------|
> | 主题句 | Topic Sentences | 段落开头明确主题 | State the topic at paragraph start |
> | 段落结构 | Paragraph Structure | 一个主题一个段落 | One topic per paragraph |
> | 过渡词 | Transition Words | 使用过渡词连接观点 | Use transitions to connect ideas |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/content-organization|原始文档 | Original]]
> - [[02-Annotated/content-organization|标注版本 | Annotated]]

---

### 3. 文档元素 | Document Elements

> [!info] 模块概述 | Module Overview
>
> | 主题 | Topic | 描述 | Description |
> |------|-------|------|-------------|
> | 代码示例 | Code Samples | 编写清晰的可运行代码 | Write clear, runnable code |
> | 概念解释 | Conceptual Explanations | 清晰解释技术概念 | Explain technical concepts clearly |
> | 操作步骤 | Procedures | 编写清晰的步骤说明 | Write clear step-by-step instructions |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/document-elements|原始文档 | Original]]
> - [[02-Annotated/document-elements|标注版本 | Annotated]]

---

### 4. 语法与风格 | Grammar and Style

> [!info] 模块概述 | Module Overview
>
> | 主题 | Topic | 描述 | Description |
> |------|-------|------|-------------|
> | 用词选择 | Word Choice | 选择精确、简单的词汇 | Choose precise, simple words |
> | 标点符号 | Punctuation | 正确使用标点符号 | Use punctuation correctly |
> | 格式约定 | Formatting Conventions | 使用一致的格式 | Use consistent formatting |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/grammar-style|原始文档 | Original]]
> - [[02-Annotated/grammar-style|标注版本 | Annotated]]

---

## 学习路径 | Learning Path

### 推荐顺序 | Recommended Order

1. [[02-Annotated/getting-started|快速入门 | Getting Started]]
2. [[02-Annotated/writing-clearly|清晰写作 | Writing Clearly]]
3. [[02-Annotated/scannability|可扫描性 | Scannability]]
4. [[02-Annotated/content-organization|内容组织 | Content Organization]]
5. [[02-Annotated/code-samples|代码示例 | Code Samples]]
6. [[02-Annotated/practical-application|实际应用 | Practical Application]]

---

## 学习进度 | Learning Progress

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  learning_stage AS "阶段 | Stage",
  reading_progress AS "进度 | Progress",
  dateformat(next_review, "MM-dd") AS "复习 | Review"
FROM "DocFramework/Google-Style-Guide"
WHERE learning_stage != "mastered" AND status != "not-started"
SORT file.link
```

---

## 练习与案例 | Exercises & Cases

### 改进练习 | Improvement Exercises

- [[03-Exercises/before-after|改进前后对比 | Before and After]]
- [[03-Exercises/rewrite-sentences|句子改写练习 | Rewrite Sentences]]

### 应用案例 | Application Cases

- [[03-Exercises/real-google-docs|Google 文档案例分析 | Google Docs Analysis]]
- [[03-Exercises/apply-to-project|应用到我的项目 | Apply to My Project]]

---

## 与其他框架对比 | Comparison with Other Frameworks

### vs Diataxis

| 维度 | Diataxis | Google Style Guide |
|------|----------|-------------------|
| 重点 | 文档分类与受众 | 写作技巧与风格 |
| 适用场景 | 规划文档结构 | 提升写作质量 |
| 互补性 | 提供框架 | 提供细节 |

**相关链接 | Related Links**：

- [[../Diataxis/00-Index|Diataxis Framework]]

### vs Microsoft Style Guide

| 维度 | Google | Microsoft |
|------|--------|-----------|
| 语气 | 直接、简洁 | 温暖、友好 |
| 重点 | 技术准确性 | 用户友好性 |

**相关链接 | Related Links**：

- [[../Microsoft-Style-Guide/00-Index|Microsoft Style Guide]]

---

## 相关资源 | Related Resources

### 官方资源 | Official Resources

- [Google Developer Documentation Style Guide](https://developers.google.com/tech-writing) | Official Site
- [Google Technical Writing One](https://developers.google.com/tech-writing/one) | Course One
- [Google Technical Writing Two](https://developers.google.com/tech-writing/two) | Course Two

### 扩展阅读 | Extended Reading

- [[../Diataxis/00-Index|Diataxis Framework]] - 文档分类框架
- [[../Microsoft-Style-Guide/00-Index|Microsoft Style Guide]] - Microsoft 文档规范
- [Google Developer Documentation Style Guide (Chinese Translation)](https://github.com/DeveloperMalaysia/google-developer-documentation-style-guide-zh) | 中文翻译

---

## 个人笔记 | Personal Notes

> [!note] 我的学习笔记 | My Learning Notes

记录你对 Google Style Guide 的理解和感悟...

Record your understanding and insights about the Google Style Guide...

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
