---
name: doc-framework-annotator
description: Annotate documentation framework learning materials with bilingual insights, heuristic questions, and key highlights. Use when working with DocFramework/ directory or when user mentions document standards, style guides, or learning documentation practices. Supports Diataxis, Google Style Guide, Microsoft Style Guide, and Write the Docs.
---

# Documentation Framework Annotator | 文档框架标注器

## Overview | 概述

This skill helps annotate documentation framework learning materials (Diataxis, Google Style Guide, Microsoft Style Guide, etc.) with:

- **Heuristic questions** | 启发式问答
- **Key insight highlights** | 关键要点高亮
- **Bilingual annotations** | 双语标注（English + 中文）
- **Practical examples** | 实用示例
- **Learning exercises** | 学习练习
- **Cross-references** | 交叉引用

## When to Use | 使用场景

- Working with files in `DocFramework/` directory
- User mentions "annotate", "highlight", "标注", "高亮"
- Processing documentation framework materials
- Creating learning materials from style guides
- User wants to learn documentation best practices

## Annotation Patterns | 标注模式

### 1. Core Concept Highlight | 核心概念标注

Identify and highlight fundamental concepts with bilingual support:

```markdown
==Core Concept Text | 核心概念文本==

> [!success] 核心要点 | Core Concept
> **Main idea | 主要观点**：The core concept in one sentence.
> **解释 | Explanation**：Why this concept matters...
```

### 2. Heuristic Question Generation | 启发式问答生成

Create thought-provoking questions with bilingual answers:

```markdown
> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：[提出引导性问题 | Ask a guiding question]
> **提示 | Hint**：[给出思考方向 | Give thinking direction]
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：[The detailed answer]
>
> **深入分析 | Deep Dive**：
> - **Why?** 为什么这很重要？
> - **What?** 有什么影响？
>
> **常见误区 | Common Pitfall**：What people usually misunderstand...
>
> **实际应用 | Application**：How to apply this in practice?
> </details>
```

### 3. Good vs Bad Examples | 好坏示例对比

Create comparative examples in both languages:

```markdown
> [!example] 示例：好做法 vs 坏做法 | Example: Good vs Bad Practice
> **好做法 | Good Practice**：
> ```markdown
> # Clear, actionable example
> ```
>
> **坏做法 | Bad Practice**：
> ```markdown
> # Confusing, incomplete example
> ```
>
> **关键差异 | Key Difference**：Why the first is better...
```

### 4. Self-Check Questions | 自我检查点

Add reflection points before continuing:

```markdown
> [!question] 自我检查 | Self-Check
> 在继续阅读前，问自己：
> 1. [Question one?]
> 2. [Question two?]
>
> ==关键点 | Key Point==：[Important reminder]
```

### 5. Common Pitfalls | 常见错误

Highlight mistakes to avoid:

```markdown
> [!warning] 常见错误 | Common Mistake
> ❌ **错误做法 | Wrong**：[What people do wrong]
> ✅ **正确做法 | Correct**：[What they should do]
>
> **原因 | Reason**：[Why the correct way is better]
```

## Framework-Specific Patterns | 框架特定模式

### Diataxis Framework | Diataxis 框架

When annotating Diataxis content, emphasize the four dimensions:

```markdown
> [!abstract] 核心思想 | Core Idea
> Diátaxis 是一个系统的文档框架，将文档内容按**目的**（purpose）和**受众**（audience）分为四个维度：
> - **Tutorials** - 教程（学习导向 | Learning-oriented）
> - **How-to Guides** - 操作指南（问题导向 | Problem-oriented）
> - **Reference** - 参考（信息导向 | Information-oriented）
> - **Explanation** - 解释（理解导向 | Understanding-oriented）

> [!info] 维度对比 | Dimension Comparison
> | 维度 | Dimension | 受众 | Audience | 目的 | Purpose |
> |------|-----------|------|----------|------|----------|
> | 教程 | Tutorials | 初学者 | Beginners | 学习 | Learning |
> | 操作指南 | How-to Guides | 实践者 | Practitioners | 解决问题 | Problem-solving |
> | 参考 | Reference | 专家 | Experts | 查找信息 | Information lookup |
> | 解释 | Explanation | 理解者 | Understanders | 理解背景 | Understanding context |
```

### Google Style Guide | Google 风格指南

When annotating Google Developer Documentation:

```markdown
> [!important] Google 原则 | Google Principle
> **原则名称 | Principle Name**：[Principle content]
>
> **应用场景 | When to apply**：When this principle matters
>
> **示例 | Example**：
> - ❌ 不符合原则的做法 | Violates principle
> - ✅ 符合原则的做法 | Follows principle
```

### Microsoft Style Guide | Microsoft 风格指南

When annotating Microsoft Writing Style Guide:

```markdown
> [!tip] 写作技巧 | Writing Technique
> **技巧 | Technique**：[Specific technique]
>
> **何时使用 | When to use**：[Context]
>
> **示例 | Example**：
> - ❌ Not so good | 不够好
> - ✅ Better | 更好
```

## Metadata Suggestions | 元数据建议

Suggest appropriate YAML frontmatter:

```yaml
---
source: "[original URL]"
source_type: "[Diataxis|Google|Microsoft|WriteTheDocs]"
status: reading # reading | annotated | practicing | mastered
importance: "[low|medium|high|critical]"
difficulty: "[beginner|intermediate|advanced]"
learning_stage: "[reading|comprehension|application|mastery]"
annotation_language: "bilingual" # en | zh | bilingual
tags:
  - doc-framework
  - [specific tags]
---
```

## Exercise Generation | 练习生成

Create learning exercises:

```markdown
> [!help] 学习练习 | Learning Exercise

**练习 1：分类练习 | Classification Exercise**
以下是四个文档片段，请判断它们属于哪个维度：
1. [片段 1 | Fragment 1]
2. [片段 2 | Fragment 2]
3. [片段 3 | Fragment 3]
4. [片段 4 | Fragment 4]

<details>
<summary>查看答案 | View Answer</summary>

1. **[维度]** - [理由 | Reason]
2. **[维度]** - [理由 | Reason]
3. **[维度]** - [理由 | Reason]
4. **[维度]** - [理由 | Reason]
</details>

**练习 2：重构练习 | Refactoring Exercise**
找出你项目中的一个文档，分析它是否混合了多个维度。如果是，尝试将它拆分为独立的文档。

**练习 3：创建练习 | Creation Exercise**
为你最熟悉的工具或技术，创建一个简单的"快速开始"教程和一个"常见问题"操作指南。
```

## Cross-Reference Suggestions | 交叉引用建议

Suggest related content:

```markdown
---
**相关链接 | Related Links**：
- [[Related Note 1]]
- [[Related Note 2]]

**原文链接 | Original URL**：[URL](https://example.com)
---
```

## Output Guidelines | 输出指南

1. **Preserve original content** | 保留原文 - Add annotations, don't replace
2. **Use consistent formatting** | 使用一致的格式 - Follow the patterns above
3. **Add value, not clutter** | 增加价值，不要杂乱 - Every annotation should provide insight
4. **Maintain readability** | 保持可读性 - Don't over-annotate
5. **Enable progressive disclosure** | 支持渐进式展示 - Use `<details>` for detailed answers
6. **Bilingual support** | 双语支持 - Always provide both English and Chinese

## Special Commands | 特殊命令

### `/annotate-concept`

Highlight and explain a core concept:

```
User: /annotate-concept "Diataxis framework"
```

Output:

```markdown
==Diátaxis Framework | Diátaxis 框架==

> [!success] 核心要点 | Core Concept
> Diátaxis is a systematic documentation framework that categorizes content by **purpose** and **audience** into four dimensions:
> Diátaxis 是一个系统的文档框架，将文档按**目的**（purpose）和**受众**（audience）分为四个维度：
> - **Tutorials** - 教程（学习导向 | Learning-oriented）
> - **How-to Guides** - 操作指南（问题导向 | Problem-oriented）
> - **Reference** - 参考（信息导向 | Information-oriented）
> - **Explanation** - 解释（理解导向 | Understanding-oriented）

> [!question] 深度思考 | Deep Thinking
> **核心问题 | Core Question**：Why classify documents by "purpose" instead of "topic"? 为什么文档需要按"目的"分类，而不是按"主题"分类？
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：Because the **same topic** may need **different document types**. 因为**同一主题**（same topic）可能需要**不同类型的文档**（different document types）。
>
> **深入分析 | Deep Dive**：
> For example, the Flask framework needs both tutorials (to teach beginners) and reference (for experts to look up APIs). If mixed together, no one can find what they need.
> 例如，Flask 框架既需要教程（教新手入门），也需要参考（让专家查 API）。如果把它们混在一起，谁都找不到需要的内容。
>
> **Key Insight | 关键洞察**：Readers with **different goals** need **different formats**.
> 具有**不同目标**的读者需要**不同格式**的文档。
> </details>
```

### `/create-exercise`

Generate practice exercises for content:

```
User: /create-exercise for "tutorial vs how-to guide"
```

Output:

```markdown
> [!help] 学习练习 | Learning Exercise

**练习 1：分类练习 | Classification Exercise**
以下是四个文档片段，请判断它们属于哪个维度：

1. "Flask routing function accepts the following parameters: `rule`, `options`, `methods`..."
2. "Let's create a blog app. First, design the data model..."
3. "Why does Flask use context variables? Because WSGI apps handle concurrent requests..."
4. "How to add user authentication? Use Flask-Login extension..."

<details>
<summary>查看答案 | View Answer</summary>

1. **Reference | 参考** - Structured, provides parameter list
2. **Tutorial | 教程** - For beginners, step-by-step learning
3. **Explanation | 解释** - Explains "why", helps understanding
4. **How-to Guide | 操作指南** - Solves specific problem (adding auth)
</details>

**练习 2：重构练习 | Refactoring Exercise**
找出你项目中的一个文档，分析它是否混合了多个维度。如果是，尝试将它拆分为独立的文档。

**练习 3：创建练习 | Creation Exercise**
为你最熟悉的工具或技术，创建一个简单的"快速开始"教程和一个"常见问题"操作指南。
```

## References | 参考资料

- **Diataxis**: <https://diataxis.fr/>
- **Google Developer Documentation Style Guide**: <https://developers.google.com/tech-writing>
- **Microsoft Writing Style Guide**: <https://docs.microsoft.com/en-us/style-guide/>
- **Write the Docs**: <https://www.writethedocs.org/>
- **Obsidian Callouts**: <https://help.obsidian.md/Editing+and+formatting/Callouts>
