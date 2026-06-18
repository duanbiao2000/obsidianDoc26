---
title: "Highlights | 重点摘要"
source: "https://developers.google.com/style/highlights"
source_type: "Google"
original_language: "en"
date: 2026-02-04
status: annotated
importance: "critical"
difficulty: "beginner"
learning_stage: "comprehension"
annotation_version: "1.0"
last_annotated: 2026-02-04
annotation_language: "bilingual"
cssclasses: doc-learning
reading_progress: "100%"
next_review: 2026-02-11
review_count: 1
tags:
  - doc-framework
  - google-style-guide
  - bilingual
  - fundamentals
related_docs:
  - "[[Diataxis/02-Annotated/start-here]]"
  - "[[Microsoft-Style-Guide/02-Annotated/welcome]]"
---

# Highlights | 重点摘要

The style guide covers a lot of material, so the following page provides an overview of its most important points. For more information about topics on the page, follow the links.
本风格指南涵盖大量内容，因此以下页面提供了其最重要观点的概述。如需了解更多关于页面主题的信息，请点击链接。

> [!success] 核心要点 | Core Concept
> ==Google Developer Documentation Style Guide | Google 开发者文档风格指南==
>
> This guide provides editorial guidelines for writing clear and consistent technical documentation.
> 本指南为编写清晰一致的技术文档提供编辑准则。
>
> **核心目标 | Core Goal**：Create documentation that is **accessible**, **clear**, and **user-friendly**.
> 创建**易于访问**、**清晰**且**用户友好**的文档。

---

## Tone and content | 语气与内容

> [!info] Google 原则 | Google Principle
> **原则名称 | Principle**：Be conversational and friendly without being frivolous.
> **对话式友好原则**：保持对话式和友好，但不轻浮。

- Be conversational and friendly without being frivolous.
  - 对话式且友好，但不轻浮。
- Don't pre-announce anything in documentation.
  - 不要在文档中预先宣布任何内容。
- Use descriptive link text.
  - 使用描述性链接文本。
- Write accessibly.
  - 写作要易于理解。
- Write for a global audience.
  - 为全球受众写作。

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：为什么技术文档应该"对话式"（conversational），而不是"正式"（formal）？
> **提示 | Hint**：考虑读者阅读文档时的情境和心态...
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为开发者阅读文档时通常是在**解决问题**，而不是在阅读学术论文。对话式的语气让读者感觉**有人在帮助他们**，而不是在阅读冷冰冰的说明书。
>
> **深入分析 | Deep Dive**：
>
> - **Why?** 对话式语气减少了认知负担，让技术内容更容易消化。
> - **Balance?** "Without being frivolous" 意味着不要过度随意，保持专业性。
>
> **实际应用 | Application**：
>
> - ✅ "To add a user, click the **Add user** button."
> - ❌ "The user addition functionality is invoked by depressing the user addition interface element."
>
> </details>

> [!example] 示例：描述性链接文本 | Example: Descriptive Link Text
> **好做法 | Good Practice**：
>
> ```markdown
> For more information, see the [authentication guide](https://example.com/auth).
> 更多信息，请参阅[身份验证指南](https://example.com/auth)。
> ```
>
> **坏做法 | Bad Practice**：
>
> ```markdown
> For more information, [click here](https://example.com/auth).
> 更多信息，[点击这里](https://example.com/auth)。
> ```
>
> **关键差异 | Key Difference**：描述性链接文本让读者**在点击前就知道会去哪里**，而"点击这里"则毫无信息量。

> [!warning] 常见错误 | Common Mistake
> ❌ **错误做法 | Wrong**：在文档中预先宣布即将推出的功能。
> ✅ **正确做法 | Correct**：只记录已经发布并可用的功能。
>
> **原因 | Reason**：预先宣布功能可能会让读者寻找不存在的功能，导致挫败感。

---

## Language and grammar | 语言与语法

> [!important] Google 原则 | Google Principle
> **原则名称 | Principle**：Use second person and active voice.
> **第二人称与主动语态原则**：使用第二人称和主动语态。

- Use second person: "you" rather than "we."
  - 使用第二人称："you" 而不是 "we"。
- Use active voice: make clear who's performing the action.
  - 使用主动语态：明确谁在执行操作。
- Use standard American spelling and punctuation.
  - 使用标准的美式拼写和标点。
- Put conditions before instructions, not after.
  - 将条件放在指令之前，而不是之后。
- For usage and spelling of specific words, see the word list.
  - 有关特定单词的用法和拼写，请参阅词汇表。

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：为什么技术文档推荐使用"you"而不是"we"？
> **提示 | Hint**：考虑文档的焦点应该在哪里...
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为文档的焦点应该是**读者（you）**，而不是作者（we）。读者关心的是**他们能做什么**，而不是**产品团队做了什么**。
>
> **深入分析 | Deep Dive**：
>
> - **"You" focus**: 将读者置于行动的中心，赋予他们控制感。
> - **"We" problem**: 让焦点转移到作者或产品团队身上，削弱了以用户为中心的体验。
>
> **实际应用 | Application**：
>
> - ✅ "**You** can add users by clicking the button."
> - ❌ "**We** allow you to add users..."
> - ❌ "Users can be added..."（被动语态，who's performing the action?）
>
> </details>

> [!example] 示例：条件前置 | Example: Conditions Before Instructions
> **好做法 | Good Practice**：
>
> ```markdown
> **To** add a user **if** you have admin privileges:
> 如果您具有管理员权限，要添加用户：
> 1. Go to the Users page.
>    前往"用户"页面。
> 2. Click Add user.
>    点击"添加用户"。
> ```
>
> **坏做法 | Bad Practice**：
>
> ```markdown
> 1. Go to the Users page.
>    前往"用户"页面。
> 2. Click Add user.
>    点击"添加用户"。
> Note: You must have admin privileges.
> 注意：您必须具有管理员权限。
> ```
>
> **关键差异 | Key Difference**：前置条件让读者**在开始操作前就知道是否满足要求**，避免执行到一半才发现无法完成。

---

## Formatting, punctuation, and organization | 格式、标点和组织

> [info] 格式规范 | Formatting Guidelines

- Use sentence case for document titles and section headings.
  - 文档标题和章节标题使用句首字母大写。
- Use numbered lists for sequences.
  - 序列使用编号列表。
- Use bulleted lists for most other lists.
  - 大多数其他列表使用无序列表。
- Use description lists for pairs of related pieces of data.
  - 相关数据对使用描述列表。
- Use serial commas.
  - 使用序列逗号（牛津逗号）。
- Put code-related text in code font.
  - 将代码相关文本使用代码字体。
- Put UI elements in bold.
  - 将 UI 元素加粗。
- Use unambiguous date formatting.
  - 使用明确的日期格式。

> [!tip] 写作技巧 | Writing Technique
> **技巧 | Technique**：Sentence case vs Title Case
>
> **何时使用 | When to use**：
>
> - **Sentence case**（句首字母大写）：Google 风格指南推荐用于标题
>   - "How to format code"（只有首单词大写）
> - **Title Case**（标题字母大写）：某些其他风格指南使用
>   - "How to Format Code"（每个主要单词首字母大写）
>
> **Google's preference | Google 偏好**：Sentence case 更自然，更易于阅读。

> [!question] 自我检查 | Self-Check
> 在继续阅读前，问自己：
>
> 1. 你是否能在文档中一眼识别出代码元素和 UI 元素？
> 2. 你是否在列表中正确使用了编号列表（有序）和无序列表（无序）？
>
> ==关键点 | Key Point==：**格式一致性**（Format consistency）是专业文档的基础。

> [!example] 示例：序列逗号 | Example: Serial Comma
> **好做法 | Good Practice**：
>
> ```markdown
> The function accepts red, green, and blue.
> 该函数接受红色、绿色和蓝色。
> ```
>
> **有争议的做法 | Controversial**：
>
> ```markdown
> The function accepts red, green and blue.
> 该函数接受红色、绿色和蓝色。
> ```
>
> **关键差异 | Key Difference**：序列逗号（在"and"前加逗号）可以消除歧义。例如："red, green, and blue combinations" 明确表示 "(red, green) and (blue combinations)" 是不正确的。

> [!example] 示例：代码字体和 UI 加粗 | Example: Code Font and Bold UI
> **好做法 | Good Practice**：
>
> ```markdown
> To run the script, use **npm start**. Then click the **Save** button.
> 要运行脚本，请使用 **npm start**。然后点击 **保存** 按钮。
> ```
>
> **坏做法 | Bad Practice**：
>
> ```markdown
> To run the script, use npm start. Then click the Save button.
> 要运行脚本，请使用 npm start。然后点击保存按钮。
> ```
>
> **关键差异 | Key Difference**：代码字体和 UI 加粗让读者**快速识别技术元素和界面元素**，提高可扫描性。

---

## Images | 图像

> [info] 图像规范 | Image Guidelines

- Provide alt text.
  - 提供替代文本（alt text）。
- Provide high-resolution or vector images when practical.
  - 在可行时提供高分辨率或矢量图像。

> [!warning] 常见错误 | Common Mistake
> ❌ **错误做法 | Wrong**：使用低分辨率的截图，让用户无法看清文本。
> ✅ **正确做法 | Correct**：使用高分辨率图像或矢量图形（SVG），确保在不同缩放级别下都清晰。
>
> **额外提醒 | Additional Note**：Alt text 不仅对可访问性很重要，也对图像加载失败时的用户体验至关重要。

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：为什么 alt text（替代文本）对技术文档如此重要？
> **提示 | Hint**：考虑不同的使用场景和用户需求...
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：Alt text 支持：
>
> 1. **屏幕阅读器用户**：视障用户通过屏幕阅读器理解图像内容
> 2. **低带宽环境**：图像可能无法加载，alt text 提供了关键信息
> 3. **搜索引擎优化**：帮助搜索引擎理解图像内容
>
> **深入分析 | Deep Dive**：
>
> - **Good alt text**: "Screenshot of the Settings panel showing the Privacy options"
> - **Bad alt text**: "image.png" 或 "Screenshot"
> - **Decorative images**: 使用空 alt text (`alt=""`)
>
> </details>

---

## 总结与反思 | Summary & Reflection

> [!abstract] 核心思想 | Core Idea
> ==Google Developer Documentation Style Guide 的核心理念==
>
> **Accessibility First | 无障碍优先**：文档应该让所有人都能理解和使用。
> **Clarity Through Consistency | 通过一致性实现清晰**：遵循统一的格式和风格指南。
> **User-Centric Approach | 以用户为中心**：使用"you"和主动语态，让读者成为行动的主体。

> [!question] 深度思考 | Deep Thinking
> **核心问题 | Core Question**：Google Style Guide 与传统学术写作风格有哪些本质区别？
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：
>
> | 方面 | Aspect | 学术写作 | Academic Writing | Google Style Guide |
> |------|--------|----------|------------------|-------------------|
> | 语气 | Tone | 正式、客观 | Formal, objective | 对话式、友好 | Conversational, friendly |
> | 人称 | Person | 第三人称、被动语态 | Third person, passive | 第二人称、主动语态 | Second person, active |
> | 目标 | Goal | 展示专业知识 | Show expertise | 帮助用户解决问题 | Help users solve problems |
> | 受众 | Audience | 同行专家 | Peer experts | 各级开发者 | Developers of all levels |
>
> **关键洞察 | Key Insight**：技术文档的目标是**实用**（pragmatic），而不是**展示**（performative）。好的文档是**透明的**——读者在完成任务后甚至不会注意到文档的存在。
> </details>

---

## 学习练习 | Learning Exercises

> [!help] 学习练习 | Learning Exercise

**练习 1：改写练习 | Rewriting Exercise**
将以下"学术风格"的文本改写为符合 Google Style Guide 的风格：

原文：

```
The system administrator is provided with the capability of user account management through the utilization of the administrative interface.
```

<details>
<summary>查看答案 | View Answer</summary>

**改写后 | Rewritten**：

```
As an admin, you can manage user accounts in the Admin page.
作为管理员，您可以在"管理"页面中管理用户账户。
```

**关键改进 | Key Improvements**：

- "The system administrator" → "As an admin"（更直接、更个人化）
- "is provided with the capability of" → "can"（更简洁、更主动）
- "through the utilization of" → "in"（更简单、更自然）
- "user account management" → "manage user accounts"（动词化，更清晰）

</details>

**练习 2：条件前置练习 | Condition-First Exercise**
将以下"条件后置"的指令改写为"条件前置"：

原文：

```
1. Navigate to Settings > Privacy.
2. Toggle "Enable notifications".
Note: This feature requires a premium subscription.
```

<details>
<summary>查看答案 | View Answer</summary>

**改写后 | Rewritten**：

```
**To** enable notifications **if** you have a premium subscription:
1. Go to Settings > Privacy.
2. Toggle "Enable notifications".

如果您拥有高级订阅，要启用通知：
1. 前往设置 > 隐私。
2. 切换"启用通知"。
```

</details>

**练习 3：链接文本改进 | Link Text Improvement**
将以下链接改为描述性链接：

原文：

```
Click here to learn more about authentication.
```

<details>
<summary>查看答案 | View Answer</summary>

**改写后 | Rewritten**：

```
Learn more about [authentication](https://example.com/auth).
了解有关[身份验证](https://example.com/auth)的更多信息。
```

</details>

---

## 相关链接 | Related Links

- [[Google-Style-Guide/00-Index]] - Google Style Guide 学习索引
- [[Diataxis/02-Annotated/start-here]] - Diataxis 框架概述
- [[Microsoft-Style-Guide/02-Annotated/welcome]] - Microsoft Style Guide 欢迎页
- [Original URL](https://developers.google.com/style/highlights)

---

**Last updated: 2025-04-02 UTC | 最后更新：2025-04-02 UTC**
