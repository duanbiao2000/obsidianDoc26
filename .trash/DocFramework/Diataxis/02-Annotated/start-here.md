---
title: "Start here - Diátaxis in five minutes | 从这里开始 - 五分钟了解 Diátaxis"
source: "https://diataxis.fr/start-here/"
source_type: "Diataxis"
original_language: "en"
date: 2026-02-04
status: annotated
tags:
  - doc-framework
  - diataxis
  - bilingual
  - getting-started
cssclasses: doc-learning
importance: critical
difficulty: beginner
learning_stage: comprehension
annotation_version: "1.0"
last_annotated: 2026-02-04
annotation_language: "bilingual"
reading_progress: "100%"
next_review: 2026-02-11
review_count: 1
---

# Start here - Diátaxis in five minutes | 从这里开始 - 五分钟了解 Diátaxis

> [!quote] 原作者建议 | Author's Advice
> Treat this website as a handbook or a toolbox that you make use of when you need it.
> 把这个网站当作一本手册或一个工具箱，在你需要时使用它。

---

## Introduction | 引言

> [!abstract] 核心要点 | Core Point
> **The best way to get started with Diátaxis is by applying it** - to something, however small.
> **开始使用 Diátaxis 的最佳方式就是应用它** —— 应用于任何事物，无论多么微小。

You don't need to read everything on this website to make sense of Diátaxis, or to start using it in practice. In fact I recommend that you don't.

你不需要阅读这个网站的所有内容来理解 Diátaxis，或开始在实践中使用它。事实上，我建议你不要这样做。

**Read this page for a brief primer.** Each section contains links to more in-depth material; refer to that when you need it - when you're actually at work, or reflecting on the documentation problems you have encountered.

**阅读本页作为简要入门。** 每个部分都包含更深入材料的链接；在你需要时参考它们 —— 当你实际工作时，或反思你遇到的文档问题时。

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：为什么作者建议"不要读完所有内容"才开始实践？
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为 Diátaxis 是一个**实用工具**（pragmatic tool），不是理论教科书。通过**实际应用**（practical application）遇到问题，然后带着问题去查阅相关章节，这样学习更高效。
>
> **深入分析 | Deep Dive**：
>
> - **Why?** 理论与实践的结合点在于问题。当你遇到具体文档问题时，相关章节会"活起来"（comes alive）
> - **What?** 这是一种"按需学习"（just-in-time learning）而非"储备式学习"（just-in-case learning）
> - **How?** 先了解框架概览（本页），然后在实际工作中遇到问题时再深入阅读相关章节
>
> **常见误区 | Common Pitfall**：认为必须读完所有理论才能开始实践。
> **实际应用 | Application**：读完本页后，立即找一个现有文档进行 Diátaxis 分析。
> </details>

---

## The four kinds of documentation | 四种文档类型

> [!success] 核心概念 | Core Concept
> ==Diátaxis Framework | Diátaxis 框架==
>
> The core idea of Diátaxis is that there are fundamentally **four identifiable kinds of documentation**, that respond to **four different needs**.
>
> Diátaxis 的核心思想是：文档根本上可以分为**四种可识别的类型**，对应**四种不同的需求**。
>
> | 类型 | Kind | 目的 | Purpose | 受众 | Audience |
> |------|-----|------|---------|------|----------|
> | **Tutorials** | 教程 | 学习 | Learning | 初学者 | Beginners |
> | **How-to guides** | 操作指南 | 解决问题 | Problem-solving | 实践者 | Practitioners |
> | **Reference** | 参考 | 查找信息 | Information lookup | 专家 | Experts |
> | **Explanation** | 解释 | 理解背景 | Understanding | 理解者 | Understanders |

Each has a different purpose, and needs to be written in a different way.

每种类型都有不同的目的，需要以不同的方式编写。

> [!question] 自我检查 | Self-Check
> 在继续阅读前，问自己：
>
> 1. 你是否曾经遇到过"找不到需要的信息"的文档？
> 2. 你是否曾经被"过多解释"困扰，只想要一个简单的答案？
>
> ==关键点 | Key Point==：文档混乱的根源往往是**混淆了这四种类型**。

---

### 1. Tutorials | 教程

> [!info] 核心定义 | Core Definition
> **A tutorial is a lesson**, that takes a student by the hand through a learning experience.
>
> **教程是一堂课**，牵引学生通过学习体验。

**A tutorial is always practical**: the user *does* something, under the guidance of an instructor. A tutorial is designed around an encounter that the learner can make sense of, in which the instructor is responsible for the learner's safety and success.

**教程始终是实用的**：用户在指导下*做*某事。教程围绕学习者可以理解的 encounter 设计，其中指导者负责学习者的安全和成功。

A driving lesson is a good example of a tutorial. The purpose of the lesson is to develop skills and confidence in the student, not to get from A to B.

驾驶课是教程的一个好例子。课程的目的是培养学习者的技能和信心，而不是从 A 点到达 B 点。

> [!example] 示例：好教程 vs 坏教程 | Example: Good vs Bad Tutorial
> **好教程 | Good Tutorial**：
>
> ```markdown
> # Your First Flask App
>
> In this tutorial, you'll create a simple web app that displays "Hello World".
>
> ## Step 1: Install Flask
> First, ensure you have Python installed. Then run:
>
> ```bash
> pip install flask
> ```
>
> ```
>
> **坏教程 | Bad Tutorial**：
> ```markdown
> # Flask Tutorial
>
> Flask is a microframework. It is based on Werkzeug WSGI toolkit and Jinja2 template engine.
>
> Before using Flask, you need to understand decorators, contexts, request-response cycles...
> ```
>
> **关键差异 | Key Difference**：好教程让读者**立即行动**（immediate action），坏教程让读者在**理论中迷失**（lost in theory）。

*The user will learn through what they do* - not because someone has tried to teach them.

*用户通过他们所做的事情来学习* —— 不是因为有人试图教导他们。

> [!warning] 常见错误 | Common Mistake
> **❌ 错误做法 | Wrong**：在教程中加入过多解释、背景知识、概念说明。
> **✅ 正确做法 | Correct**：保持教程专注于"做"，只在必要时提供最简解释。
>
> **原因 | Reason**：教程的目的是**培养技能**（skill-building），不是**传递知识**（knowledge transfer）。

---

### 2. How-to guides | 操作指南

> [!info] 核心定义 | Core Definition
> **A how-to guide addresses a real-world goal or problem**, by providing practical directions to help the user who is in that situation.
>
> **操作指南解决现实世界的目标或问题**，通过提供实用指导来帮助处于该情况下的用户。

**A how-to guide always addresses an already-competent user**, who is expected to be able to use the guide to help them get their work done.

**操作指南始终面向已经具备一定能力的用户**，期望他们能够使用指南来完成工作。

In contrast to a tutorial, a how-to guide is concerned with *work* rather than *study*.

与教程不同，操作指南关注的是*工作*而不是*学习*。

> [!example] 示例：操作指南标题 | Example: How-to Guide Titles
> **好的操作指南标题 | Good How-to Titles**：
>
> - "How to store cellulose nitrate film"（电影摄影）
> - "How to configure frame profiling"（软件）
> - "Troubleshooting deployment problems"（故障排除）
>
> **共同特征 | Common Features**：
>
> - 解决具体问题
> - 假设读者已有基础知识
> - 提供步骤化解决方案
> - 不解释基本概念

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：操作指南和教程的根本区别是什么？
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：
>
> - **教程**：面向**初学者**（beginners），目标是**学习**（learning），从头到尾完成
> - **操作指南**：面向**实践者**（practitioners），目标是**解决问题**（problem-solving），可以跳过不需要的步骤
>
> **深入分析 | Deep Dive**：
> 想象一个驾驶场景：
>
> - **教程**："如何驾驶" —— 从零开始，学习基本操作
> - **操作指南**："如何更换备胎" —— 假设你会开车，只需解决这个具体问题
>
> **实际应用 | Application**：当你写文档时，问自己："读者是需要学习基础（教程），还是需要解决具体问题（操作指南）？"
> </details>

---

### 3. Reference | 参考

> [!info] 核心定义 | Core Definition
> **Reference guides contain the technical description** - facts - that a user needs in order to do things correctly: accurate, complete, reliable information, free of distraction and interpretation.
>
> **参考指南包含技术描述** —— 事实 —— 用户需要用来正确做事的信息：准确、完整、可靠的信息，没有干扰和解释。

They contain *propositional or theoretical knowledge*, not guides to action.

它们包含*命题性或理论知识*，不是行动指南。

> [!example] 示例：参考文档 | Example: Reference Documentation
> **好的参考文档 | Good Reference**：
>
> ```python
> class Flask:
>     """The Flask object implements a WSGI application.
>
>     :param import_name: the name of the application package
>     :param static_url_path: URL prefix for static files
>     :param static_folder: Folder containing static files
>     """
> ```
>
> **特征 | Characteristics**：
>
> - 结构化数据
> - 完整参数列表
> - 无冗余解释
> - 可扫描、可搜索

*Reference material is neutral.* It is not concerned with what the user is doing.

*参考资料是中立的*。它与用户正在做什么无关。

> [!tip] 组织原则 | Organization Principle
> **Where possible, the architecture of reference documentation should reflect the structure or architecture of the thing it's describing** - just like a map does.
>
> **在可能的情况下，参考文档的架构应该反映其所描述事物的结构或架构** —— 就像地图一样。
>
> **示例 | Example**：如果方法属于某个类，而类属于某个模块，那么文档中应该体现同样的层次关系。

---

### 4. Explanation | 解释

> [!info] 核心定义 | Core Definition
> **Explanatory guides provide context and background.** They serve the need to understand and put things in a bigger picture. Explanation joins things together, and helps answer the question *why?*
>
> **解释性指南提供上下文和背景。** 它们服务于理解的需求，将事物置于更大的图景中。解释将事物连接起来，帮助回答*为什么？*

**Explanation often needs to circle around its subject, and approach it from different directions.** It can contain opinions and take perspectives.

**解释通常需要围绕其主题循环，从不同方向接近它。** 它可以包含观点并采取不同视角。

> [!example] 示例：解释性文档 | Example: Explanation
> **好的解释文档 | Good Explanation**：
>
> ```markdown
> # Why does Flask use context variables?
>
> Flask uses context variables (like `current_app`) because WSGI applications handle multiple concurrent requests. Without context, the application wouldn't know which request a variable belongs to...
> ```
>
> **特征 | Characteristics**：
>
> - 解释"为什么"
> - 连接相关概念
> - 可以包含观点
> - 面向想要理解的人

> [!warning] 常见错误 | Common Mistake
> **❌ 错误做法 | Wrong**：在教程中堆砌过多解释，让初学者应接不暇。
> **✅ 正确做法 | Correct**：在教程中提供最简解释，然后链接到详细解释文章。
>
> **示例 | Example**：
>
> - 教程中："我们使用 HTTPS，因为它更安全"
> - 链接到："使用 HTTPS 加密的安全通信"（解释性文档）

---

## The Diátaxis map | Diátaxis 地图

> [!abstract] 框架可视化 | Framework Visualization
> The four kinds of documentation and the relationships between them can be summarised in the Diátaxis map.
>
> 四种文档类型及其相互关系可以在 Diátaxis 地图中总结。

```
                    ┌─────────────┐
                    │ EXPLANATION │
                    │   解释      │
                    │  (why)      │
                    └──────┬──────┘
                           │
        ┌──────────────────┴──────────────────┐
        │         Cognition (认知)            │
        │                                     │
┌───────┴───────┐                   ┌────────┴────────┐
│   TUTORIALS   │                   │    REFERENCE    │
│     教程       │                   │      参考        │
│  (learning)   │                   │   (information) │
└───────┬───────┘                   └────────┬────────┘
        │                                     │
        │         Action (行动)              │
        │                                     │
┌───────┴───────┐                   ┌────────┴────────┐
│ HOW-TO GUIDES │                   │                 │
│   操作指南     │                   │                 │
│  (doing)      │                   │                 │
└───────────────┘                   └─────────────────┘
```

> [!success] 核心洞察 | Key Insight
> **Diátaxis is not just a list of four different things, but a conceptual arrangement of them.** It shows how the four kinds of documentation are related to each other, and distinct from each other.
>
> **Diátaxis 不仅仅是四种不同事物的列表，而是它们的概念排列。** 它展示了四种文档类型如何相互关联，又如何相互区别。

**Crossing or blurring the boundaries described in the map is at the heart of a vast number of problems in documentation.**

**跨越或模糊地图中描述的边界是大量文档问题的核心。**

> [!question] 启发式思考 | Guiding Question
> **核心问题 | Core Question**：为什么"混淆文档类型"是个问题？
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为不同类型的文档服务于**不同的读者需求**。当你混淆它们时，**所有读者都会受损**：
>
> **深入分析 | Deep Dive**：
>
> - 初学者想学东西 → 被大量 API 参考淹没
> - 专家想查参数 → 被基础教程内容干扰
> - 实践者想解决问题 → 看到长篇理论解释
> - 理解者想了解背景 → 只有操作步骤
>
> **实际应用 | Application**：在文档导航中清晰地区分不同类型（如 "Getting Started" vs "API Reference"）。
> </details>

---

## The Diátaxis compass | Diátaxis 指南针

> [!info] 两个维度 | Two Dimensions
> As you can see from the map:
>
> 从地图中可以看出：
>
> **横向维度 | Horizontal Dimension**：
>
> - tutorials and how-to guides → **action**（行动）
> - reference and explanation → **cognition**（认知）
>
> **纵向维度 | Vertical Dimension**：
>
> - tutorials and explanation → **acquisition/study**（获取/学习）
> - how-to guides and reference → **application/work**（应用/工作）

> [!tip] 实用工具 | Practical Tool
> **The compass is useful in two different ways.**
>
> **指南针在两种不同情况下有用。**
>
> **创建文档时 | When creating documentation**：
>
> - 帮助阐明你的意图
> - 确保你在做你认为你在做的事情
>
> **审视文档时 | When examining documentation**：
>
> - 帮助理解文档中发生了什么
> - 让问题凸显出来

**The compass decision table | 指南针决策表**：

| If the content... | ...and serves the user's... | ...then it must belong to... |
|-------------------|----------------------------|------------------------------|
| informs action | acquisition of skill | a tutorial |
| informs action | application of skill | a how-to guide |
| informs cognition | application of skill | reference |
| informs cognition | acquisition of skill | explanation |

| 如果内容... | ...并且服务于用户的... | ...那么它必须属于... |
|-------------------|----------------------------|------------------------------|
| 指导行动 | 技能获取 | 教程 |
| 指导行动 | 技能应用 | 操作指南 |
| 提供认知 | 技能应用 | 参考 |
| 提供认知 | 技能获取 | 解释 |

> [!question] 自我检查 | Self-Check
> 使用指南针判断以下内容属于哪种类型：
>
> 1. "Flask routing function accepts these parameters: `rule`, `options`..."
> 2. "Let's create a blog app. First, design the data model..."
> 3. "Why does Flask use context variables? Because..."
> 4. "How to add user authentication? Use Flask-Login..."
>
> <details>
> <summary>查看答案 | View Answer</summary>
>
> 1. **Reference** - 提供技术事实，服务于工作
> 2. **Tutorial** - 指导行动，服务于学习
> 3. **Explanation** - 提供认知，服务于学习
> 4. **How-to guide** - 指导行动，服务于工作
>
> </details>

---

## Working | 工作方法

> [!success] 简单工作流 | Simple Workflow
> There is a very simple workflow for Diátaxis:
>
> Diátaxis 有一个非常简单的工作流：
>
> 1. **Consider what you see** in the documentation, in front of you right now.
>    **考虑你看到的**文档内容，就在你面前。
> 2. **Ask**: *is there any way in which it could be improved?*
>    **问**：有什么方法可以改进它吗？
> 3. **Decide on one thing** you could do to it right now, however small, that would improve it.
>    **决定一件事**，你现在就可以做的，无论多小，只要能改进它。
> 4. **Do that thing.**
>    **做那件事。**
> 5. **Repeat.**
>    **重复。**

> [!quote] 哲学理念 | Philosophy
> **You can do what you like with Diátaxis.** You don't have to believe in it and there is no exam.
>
> **你可以随心所欲地使用 Diátaxis。** 你不必相信它，也没有考试。
>
> It is a wholly pragmatic approach. I think it's *true*, but what matters is that it actually helps people create better documentation.
>
> 这是一个完全实用的方法。我认为它是*正确的*，但重要的是它实际上帮助人们创建更好的文档。

---

## Get started | 开始行动

> [!tip] 行动号召 | Call to Action
> **At this point, you have read everything you need to get started with Diátaxis.**
>
> **此时此刻，你已经阅读了开始使用 Diátaxis 所需的一切。**
>
> You can read more if you want, and eventually you probably should, but **you will get the most value from the guidance in this website when you turn to it with a problem or a question**. That's when it comes alive.
>
> 如果你想，可以阅读更多，最终你可能应该读，但**当你带着问题或疑问查阅本网站时，你将从这些指导中获得最大价值**。那就是它活起来的时候。

---

## 学习练习 | Learning Exercises

> [!help] 练习 1：分类练习 | Classification Exercise

以下是四个文档片段，请判断它们属于哪个维度：

1. "Flask routing function accepts the following parameters: `rule` (string), `options` (dict), `methods` (list)..."

2. "Let's create a blog app. First, design the data model. We'll use SQLAlchemy to define a Post class with title, content, and timestamp..."

3. "Why does Flask use context variables? Because WSGI applications handle multiple concurrent requests. Without context, the application wouldn't know which request a variable belongs to..."

4. "How to add user authentication? Use Flask-Login extension. First, install it: `pip install flask-login`. Then configure it in your app..."

<details>
<summary>查看答案 | View Answer</summary>

1. **Reference | 参考** - 结构化、提供参数列表，服务于工作
2. **Tutorial | 教程** - 面向初学者、逐步学习，服务于学习
3. **Explanation | 解释** - 解释"为什么"、帮助理解，服务于学习
4. **How-to Guide | 操作指南** - 解决具体问题（添加认证），服务于工作

</details>

> [!help] 练习 2：重构练习 | Refactoring Exercise

**找出你项目中的一个文档**，分析它是否混合了多个维度。如果是，尝试将它拆分为独立的文档。

**检查清单 | Checklist**：

- [ ] 文档是否包含详细操作步骤，又包含大量背景解释？
- [ ] 文档是否既面向初学者，又面向专家？
- [ ] 读者能否快速找到需要的信息，还是要阅读全文？

> [!help] 练习 3：创建练习 | Creation Exercise

**为你最熟悉的工具或技术**，创建以下两个文档：

1. 一个简单的"快速开始"教程（5-10 分钟可完成）
2. 一个"常见问题"操作指南

**然后比较**：它们是否清晰地区分了"学习"和"解决问题"？

---

## 相关链接 | Related Links

- [[../Diataxis/00-Index|返回 Diataxis 索引 | Back to Diataxis Index]]
- [[../00-Home|返回学习中心 | Back to Learning Hub]]
- [Diataxis Original | 原始文档](https://diataxis.fr/start-here/)
- [[tutorials|教程详细说明 | Tutorials in detail]]
- [[how-to-guides|操作指南详细说明 | How-to guides in detail]]
- [[reference|参考详细说明 | Reference in detail]]
- [[explanation|解释详细说明 | Explanation in detail]]

---

## 个人笔记 | Personal Notes

> [!note] 我的学习笔记 | My Learning Notes

**关键收获 | Key Takeaways**：

- [x] Diátaxis 将文档按**目的**和**受众**分为四种类型
- [x] **混淆文档类型**是很多文档问题的根源
- [x] 使用**指南针**来判断内容应该属于哪种类型
- [x] 最好的学习方式是**立即应用**到实际问题

**下一步行动 | Next Actions**：

- [ ] 选择一个现有文档进行 Diátaxis 分析
- [ ] 尝试将混合型文档拆分为独立的文档类型
- [ ] 阅读 Tutorials 和 How-to guides 的详细章节
- [ ] 将 Diátaxis 应用到我自己的文档项目中

**疑问待解答 | Questions to Explore**：

- [ ] 如何平衡"详细解释"和"简洁实用"？
- [ ] 在敏捷开发环境中，如何维护四种类型的文档？
- [ ] 工具如何支持这种文档组织方式？

---

**最后更新 | Last Updated**: 2026-02-04
**下次复习 | Next Review**: 2026-02-11
