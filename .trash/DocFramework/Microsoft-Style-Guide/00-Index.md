---
title: "Microsoft Writing Style Guide Index"
source: "https://docs.microsoft.com/en-us/style-guide/"
source_type: "Microsoft"
status: not-started
tags:
  - doc-framework
  - microsoft
  - writing-style
cssclasses: doc-learning
date: 2026-02-04
---

# Microsoft Writing Style Guide

> [!abstract] 框架简介 | Framework Overview
>
> **Microsoft Writing Style Guide** 是 Microsoft 为技术文档作者提供的写作指南，强调**温暖、放松、直接**（warm, relaxed, direct）的语气，以及**简洁一致**（concise and consistent）的表达方式。
>
> The **Microsoft Writing Style Guide** is a writing guide for technical documentation authors provided by Microsoft, emphasizing a **warm, relaxed, direct** voice and **concise and consistent** expression.
>
> **官方网址 | Official Site**: <https://docs.microsoft.com/en-us/style-guide/>

---

## 框架核心理念 | Core Principles

> [!success] 核心原则 | Core Principles
>
> 1. **温暖友好 | Warm and Friendly** - 像与人交谈一样写作
> 2. **放松自然 | Relaxed and Natural** - 避免过于正式或刻板
> 3. **直接明了 | Direct and Clear** - 直奔主题，不绕弯子
> 4. **简洁一致 | Concise and Consistent** - 用最少词语，保持风格统一

---

## 主要内容模块 | Main Content Modules

### 1. 语气与语调 | Voice and Tone

> [!info] 模块概述 | Module Overview
>
> | 元素 | Element | 描述 | Description |
> |------|---------|------|-------------|
> | 温暖 | Warm | 表现出对用户的关心 | Show care for the user |
> | 放松 | Relaxed | 避免过于正式的语言 | Avoid overly formal language |
> | 直接 | Direct | 直奔主题，不绕弯 | Get to the point directly |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/voice-tone|原始文档 | Original]]
> - [[02-Annotated/voice-tone|标注版本 | Annotated]]

---

### 2. 用词选择 | Word Choice

> [!info] 模块概述 | Module Overview
>
> | 原则 | Principle | 描述 | Description |
> |------|-----------|------|-------------|
> | 简单优先 | Simple First | 优先使用简单、常见的词 | Prefer simple, common words |
> | 精准表达 | Precise Expression | 选择最准确的词汇 | Choose the most accurate words |
> | 避免行话 | Avoid Jargon | 除非必要，否则不用专业术语 | Avoid technical terms unless necessary |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/word-choice|原始文档 | Original]]
> - [[02-Annotated/word-choice|标注版本 | Annotated]]

---

### 3. 格式与结构 | Format and Structure

> [!info] 模块概述 | Module Overview
>
> | 主题 | Topic | 描述 | Description |
> |------|-------|------|-------------|
> | 标题 | Headings | 使用清晰的标题层次 | Use clear heading hierarchy |
> | 列表 | Lists | 使用列表组织相关信息 | Use lists for related information |
> | 强调 | Emphasis | 适度使用强调格式 | Use emphasis sparingly |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/format-structure|原始文档 | Original]]
> - [[02-Annotated/format-structure|标注版本 | Annotated]]

---

### 4. 常见问题 | Common Issues

> [!info] 模块概述 | Module Overview
>
> | 问题 | Issue | 建议 | Recommendation |
> |------|-------|------|----------------|
> | 被动语态 | Passive Voice | 使用主动语态 | Use active voice |
> | 名词化 | Nominalization | 使用动词形式 | Use verb forms |
> | 冗长表达 | Wordiness | 删除不必要的词 | Remove unnecessary words |
>
> **相关文档 | Related Docs**：
>
> - [[01-Original/common-issues|原始文档 | Original]]
> - [[02-Annotated/common-issues|标注版本 | Annotated]]

---

## 学习路径 | Learning Path

### 推荐顺序 | Recommended Order

1. [[02-Annotated/getting-started|快速入门 | Getting Started]]
2. [[02-Annotated/voice-tone|语气与语调 | Voice and Tone]]
3. [[02-Annotated/word-choice|用词选择 | Word Choice]]
4. [[02-Annotated/sentence-structure|句子结构 | Sentence Structure]]
5. [[02-Annotated/formatting|格式约定 | Formatting]]
6. [[02-Annotated/practical-application|实际应用 | Practical Application]]

---

## 学习进度 | Learning Progress

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "文档 | Document",
  learning_stage AS "阶段 | Stage",
  reading_progress AS "进度 | Progress",
  dateformat(next_review, "MM-dd") AS "复习 | Review"
FROM "DocFramework/Microsoft-Style-Guide"
WHERE learning_stage != "mastered" AND status != "not-started"
SORT file.link
```

---

## 练习与案例 | Exercises & Cases

### 优化练习 | Optimization Exercises

- [[03-Exercises/word-choice|用词优化练习 | Word Choice Practice]]
- [[03-Exercises/rewrite-paragraphs|段落改写练习 | Rewrite Paragraphs]]

### 应用案例 | Application Cases

- [[03-Exercises/microsoft-docs-analysis|Microsoft 文档案例分析 | Microsoft Docs Analysis]]
- [[03-Exercises/apply-to-project|应用到我的项目 | Apply to My Project]]

---

## 与其他框架对比 | Comparison with Other Frameworks

### vs Diataxis

| 维度 | Diataxis | Microsoft Style Guide |
|------|----------|----------------------|
| 重点 | 文档分类与受众 | 写作风格与语气 |
| 适用场景 | 规划文档结构 | 提升写作亲和力 |
| 互补性 | 提供框架 | 提供风格指导 |

**相关链接 | Related Links**：

- [[../Diataxis/00-Index|Diataxis Framework]]

### vs Google Style Guide

| 维度 | Microsoft | Google |
|------|-----------|--------|
| 语气 | 温暖、友好 | 直接、简洁 |
| 重点 | 用户体验 | 技术准确性 |

**相关链接 | Related Links**：

- [[../Google-Style-Guide/00-Index|Google Style Guide]]

---

## 相关资源 | Related Resources

### 官方资源 | Official Resources

- [Microsoft Writing Style Guide](https://docs.microsoft.com/en-us/style-guide/) | Official Site
- [Microsoft Style Guide (GitHub)](https://github.com/MicrosoftDocs/style-guide) | Source Repository

### 扩展阅读 | Extended Reading

- [[../Diataxis/00-Index|Diataxis Framework]] - 文档分类框架
- [[../Google-Style-Guide/00-Index|Google Style Guide]] - Google 文档规范

---

## 个人笔记 | Personal Notes

> [!note] 我的学习笔记 | My Learning Notes

记录你对 Microsoft Style Guide 的理解和感悟...

Record your understanding and insights about the Microsoft Style Guide...

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
