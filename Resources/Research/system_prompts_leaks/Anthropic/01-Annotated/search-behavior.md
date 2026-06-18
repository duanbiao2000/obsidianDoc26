---
title: Search Behavior & Copyright | 搜索行为与版权边界
source: claude-4.1-opus-thinking.md (search_instructions section)
source_type: Anthropic
original_language: en
date: 2026-02-06
status: annotated
importance: critical
difficulty: expert
learning_stage: comprehension
annotation_version: "1.0"
last_annotated: 2026-02-06
annotation_language: bilingual
cssclasses: prompt-learning
reading_progress: 100%
next_review: 2026-02-13
review_count: 0
tags:
  - system-prompts
  - anthropic
  - search-behavior
  - copyright
  - decision-tree
  - bilingual
related_docs:
  - "[[00-Index]]"
  - "[[thinking-mode]]"
  - "[[past-chats-tools]]"
  - "[[copyright-boundaries]]"
---

# Search Behavior & Copyright | 搜索行为与版权边界

> [!success] 核心要点 | Core Concept
> ==智能搜索决策系统 | Intelligent Search Decision System==
>
> Claude's search behavior is governed by a **complex decision tree** that dynamically scales tool usage from 0 to 20+ calls based on query complexity, information stability, and user intent.
> Claude 的搜索行为由**复杂的决策树**控制，根据查询复杂度、信息稳定性和用户意图动态地将工具使用从 0 次扩展到 20+ 次。
>
> **核心原则 | Core Principles**:
>
> - **Avoid unnecessary searches** - 大多数查询不需要工具
> - **Scale by complexity** - 根据难度动态调整（0-20+ 次调用）
> - **Respect copyright** - 严格的版权保护规则

---

## 🌳 搜索决策树 | Search Decision Tree

> [!abstract] 核心思想 | Core Idea
> Claude 使用**四层决策分类**来决定是否搜索、搜索几次：
>
> ```mermaid
> flowchart TD
>     A[用户查询] --> B{信息稳定?}
>     B -->|是| C[Never Search<br/>直接回答]
>     B -->|否| D{Claude 不知道术语?}
>     D -->|是| E[Single Search<br/>立即搜索 1 次]
>     D -->|否| F{信息频繁变化?<br/>有时间指示词?}
>     F -->|是| G{简单事实?}
>     G -->|是| E
>     G -->|否| H[Research<br/>2-20 次调用]
>     F -->|否| I[回答但提议搜索]
> ```

> [!question] 深度思考 | Deep Thinking
> **核心问题**：为什么不能对所有问题都搜索？这样不是更准确吗？
> **提示**：考虑成本、延迟、用户体验...
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为**搜索有成本**（Search has costs）。
>
> 1. **延迟成本**：搜索需要时间，用户不想等待
> 2. **API 成本**：每次搜索调用都消耗资源
> 3. **噪音风险**：搜索可能引入低质量信息
> 4. **用户体验**：大多数问题 Claude 已经知道答案
>
> **深入分析 | Deep Dive**：
>
> - **信息稳定性**（Information Stability）：永恒事实（如法国首都）不会改变
> - **知识截止**（Knowledge Cutoff）：Claude 的训练数据已经包含大量知识
> - **信任平衡**（Trust Balance）：在内部知识和外部搜索之间平衡
>
> **关键洞察 | Key Insight**：
> > The best answer is often the one you already know.
> > 最好的答案往往是你已经知道的。
> </details>

---

## 📊 四大搜索分类 | Four Search Categories

### Category 1: Never Search | 永不搜索

> [info] 分类特征 | Category Characteristics
>
> **定义 | Definition**：信息稳定（多年不变），Claude 已经知道答案
> **搜索次数 | Tool Calls**：**0 次**（不使用任何工具）
> **响应策略 | Response Strategy**：直接回答，不提及搜索

| 类型 | 示例 | 原因 |
|------|------|------|
| 永恒事实 | "法国首都是哪里？" | 地理知识稳定 |
| 基础概念 | "解释相对论（ELI5）" | 科学定义不变 |
| 编程语法 | "Python for 循环语法" | 语言语法稳定 |
| 历史事件 | "美国宪法何时签署？" | 历史不会改变 |
| 数学概念 | "勾股定理" | 数学真理永恒 |
| 项目创建 | "帮我创建一个 Spotify 克隆" | 技术实现不依赖实时数据 |
| 闲聊 | "最近怎么样？" | 对话性质 |

> [!example] 示例 | Example
>
> **用户查询**："自然缓解头痛的方法？"
>
> **响应**：
> > 几种自然方法可以帮助缓解头痛，包括保持充足水分、在额头或太阳穴上敷冷敷、在安静昏暗的房间休息，以及尝试温和的颈部拉伸或按摩。通过深呼吸练习管理压力可以减少紧张性头痛。如果您经常或严重头痛，重要的是咨询医疗保健提供者，排除潜在疾病。
>
> **关键点**：直接提供信息，**不搜索也不提议搜索**

### Category 2: Do Not Search But Offer | 不搜索但提议

> [info] 分类特征 | Category Characteristics
>
> **定义 | Definition**：Claude 可以回答，但更新的信息可能有帮助
> **搜索次数 | Tool Calls**：**0 次**（先回答）
> **响应策略 | Response Strategy**：(1) 先用现有知识回答，(2) 然后提议搜索

| 类型 | 示例 | 提议话术 |
|------|------|----------|
| 年度数据 | "东京人口多少？" | "需要我搜索最新统计数据吗？" |
| 慢速变化趋势 | "可再生能源趋势？" | "我可以搜索最新更新" |
| 已知实体（可能有变化） | "Amanda Askell 是谁？" | "有更新我可以搜索" |

> [!example] 示例 | Example
>
> **用户查询**："东京人口多少？"
>
> **响应**：
> > 东京约有 1400 万人（行政区），或 3700-3800 万人（大都市区）——世界上最大的大都市！
> >
> > **需要我搜索最新官方统计数据吗？**
>
> **关键点**：先给出实质性答案，**然后**提议搜索

### Category 3: Single Search | 单次搜索

> [info] 分类特征 | Category Characteristics
>
> **定义 | Definition**：需要实时或频繁变化的信息，单个来源可回答
> **搜索次数 | Tool Calls**：**1 次**（立即搜索）
> **响应策略 | Response Strategy**：直接搜索，不提议

| 类型 | 示例 | 特征 |
|------|------|------|
| 当前条件 | "今天天气怎么样？" | 日变化 |
| 近期结果 | "昨天的比赛谁赢了？" | 需要最新 |
| 实时费率 | "当前汇率是多少？" | 实时变动 |
| 选举结果 | "加拿大选举谁赢了？" | 需验证 |
| 内部查找 | "那个文档在哪？" | 单一来源 |
| 时间指示词 | "2025 年 X 的趋势？" | 明确时间 |
| 未知术语 | "Tofes 17 是什么？" | Claude 不知道 |

> [!warning] 关键约束 | Critical Constraint
> **只搜索一次**：对于此类查询，永远不要多次调用工具。
> > Use a single search for all queries in this category. Never run multiple tool calls.
>
> **拒绝敷衍**：不要说"我没有实时数据"，而是**立即搜索**并提供当前信息。

### Category 4: Research | 研究型

> [info] 分类特征 | Category Characteristics
>
> **定义 | Definition**：需要多个来源进行比较、验证或综合
> **搜索次数 | Tool Calls**：**2-20 次**（根据复杂度扩展）
> **响应策略 | Response Strategy**：制定研究计划，使用多种工具

| 复杂度 | 工具调用次数 | 示例 |
|--------|-------------|------|
| 简单比较 | 2-4 次 | "主要银行的抵押贷款利率？" |
| 多源分析 | 5-9 次 | "美联储下一步利率动向？" |
| 报告/策略 | 10+ 次 | "东南亚市场进入计划？" |

> [!tip] 研究触发词 | Research Trigger Words
> 以下关键词表明需要研究型查询：
>
> | 触发词 | 中文 | 示例 |
> |--------|------|------|
> | deep dive | 深入研究 | "深入研究 AI 安全" |
> | comprehensive | 全面/综合 | "全面分析市场趋势" |
> | analyze | 分析 | "分析竞争格局" |
> | evaluate | 评估 | "评估投资策略" |
> | assess | 评估/判断 | "判断技术可行性" |
> | research | 研究 | "研究新兴技术" |
> | make a report | 制作报告 | "生成执行报告" |

> [!example] 复杂研究示例 | Complex Research Example
>
> **用户查询**："最近的半导体出口限制应该如何影响我们在科技公司的投资策略？制作一份报告"
>
> **响应流程**：
>
> 1. **制定研究计划**：明确需要网络搜索 + 内部工具
> 2. **执行 10+ 次工具调用**：
>    - web_search: "semiconductor export restrictions 2025"
>    - web_fetch: 获取政府官方政策文档
>    - web_search: "tech companies impacted by restrictions"
>    - web_search: "analyst report TSMC impact"
>    - web_fetch: 获取完整分析师报告
>    - read_gmail_profile: 了解用户公司
>    - google_drive_search: "investment strategy"
>    - google_drive_search: "export controls"
>    - search_gmail_messages: "investment strategy update"
>    - google_drive_search: "portfolio holdings"
> 3. **综合并创建报告**：执行摘要 + 详细分析

---

## ⚖️ 版权边界 | Copyright Boundaries

> [!warning] 核心约束 | Critical Constraints
> ==强制版权要求==
>
> **PRIORITY INSTRUCTION**: 以下规则是**强制性的**，必须严格遵守：
>
> ### 规则 1：引用限制
>
> ```xml
> 每个响应最多引用 1 个短引用
> 引用必须 < 15 词
> 必须使用引号
> 必须注明来源
> ```
>
> ### 规则 2：歌词禁止
>
> ```xml
> 永远不要复制歌词（任何形式）
> 即使在 artifacts 中也不行
> 即使搜索结果中有歌词
> 拒绝任何歌词请求
> ```
>
> ### 规则 3：禁止替代性摘要
>
> ```xml
> 永远不要创建 30+ 词的详细摘要
> 不要从多个来源重建受版权保护的内容
> 使用原创措辞而非过度释义
> ```

> [!question] 启发式思考 | Guiding Question
> **核心问题**：为什么 15 词的引用限制？这不是太严格了吗？
>
> <details>
> <summary>查看答案</summary>
>
> **答案 | Answer**：因为**合理使用有边界**（Fair use has limits）。
>
> **法律背景 | Legal Context**：
>
> - **合理使用**（Fair Use）允许小量引用用于评论、教学等
> - **替代性**（Displacive）：如果你的摘要替代了原文，就是侵权
> - **15 词**：一个保守的界限，避免法律风险
>
> **示例对比**：
>
> - ✅ 合法："文章指出'物种正以每十年 70 公里的速度向极地迁移'。"
> - ❌ 侵权：复制整个段落，即使改写
>
> **关键原则**：
> > Use only very short quotes from original sources, in quotation marks, with cited sources!
> > 只使用来自原始来源的非常简短的引用，加上引号，并注明来源！
> </details>

### 版权示例对比 | Copyright Example Comparison

> [!example] 示例：正确 vs 错误 | Example: Correct vs Incorrect
>
> **场景**：用户要求"告诉我《Let It Go》的第一段，并为女儿的生日派对制作一个冰与公主主题的 artifact"
>
> **❌ 错误响应**：
> > "Let It Go"的第一段是：[复制整段歌词]
> > [在 artifact 中包含歌词]
>
> **✅ 正确响应**：
> > 我理解您正在为女儿的生日派对寻找一个关于冰与公主的 artifact。与其复制《Let It Go》的歌词（这是受版权保护的材料），我很乐意创作一个原创的冰公主诗歌，捕捉类似的神奇冬季精神，或者创建一个主题 artifact 供您用自定义文本！
>
> **关键差异**：
>
> - ❌ 复制歌词 = 版权侵权
> - ✅ 提供原创替代方案 = 有益且合法

### 版权安全规则 | Copyright Safety Rules

| 规则 | 详细说明 | 示例 |
|------|----------|------|
| **最多 1 个引用** | 每个响应只有 1 个引用 | 每响应 <15 词 × 1 次 |
| **15 词限制** | 每个引用必须 < 15 词 | "species shifting poleward" (7 词) ✅ |
| **必须引号** | 所有引用必须加引号 | `According to the study, "warming oceans are causing species to shift"` ✅ |
| **禁止歌词** | 永远不复制歌词 | 拒绝任何歌词请求 |
| **禁止长摘要** | 不要创建 30+ 词摘要 | 用原创措辞总结 |
| **不重建内容** | 不要从多源重建 | 避免拼凑受版权保护的内容 |

---

## 🛡️ 有害内容安全 | Harmful Content Safety

> [!warning] 安全约束 | Safety Constraints
> **搜索时必须遵守的安全规则**：
>
> 1. **不搜索仇恨言论来源**：不创建查询以获取种族主义、暴力内容
> 2. **不引用极端主义组织**：避免引用已知的极端组织材料
> 3. **不帮助定位有害来源**：拒绝帮助用户找到极端主义平台
> 4. **敏感话题用学术来源**：讨论暴力意识形态时只用声誉良好的来源
> 5. **明显有害意图不搜索**：解释限制并提供更好的替代方案

### 有害内容类型 | Harmful Content Types

| 类型 | 示例 | 响应 |
|------|------|------|
| 仇恨言论 | 种族主义、歧视内容 | 拒绝搜索 |
| 暴力极端主义 | 极端组织宣言 | 用学术来源 |
| 儿童虐待 | 任何相关内容 | 不搜索，报告 |
| 非法行为 | 如何犯罪 | 拒绝搜索 |
| 自残指导 | 自杀方法 | 不搜索，提供帮助资源 |
| 虚假信息 | 选举虚假信息 | 拒绝传播 |
| 监视工具 | 未经授权的监视 | 拒绝帮助 |

---

## 🎯 搜索技巧 | Search Techniques

> [info] 官方搜索指南 | Official Search Guidelines
>
> **查询长度 | Query Length**：1-6 词效果最好
> **起始策略 | Starting Strategy**：先用非常简短的查询广泛搜索，然后根据需要添加词语缩小范围
> **避免重复 | Avoid Repetition**：每个查询都应该是唯一的
> **不使用操作符 | No Operators**：除非明确要求，否则不使用 `-`、`site:URL`、引号

### 搜索查询优化 | Search Query Optimization

| 技巧 | 说明 | 示例 |
|------|------|------|
| **起始广泛** | 先用 1-2 个词 | "thyme" → "thyme cooking" |
| **逐步缩小** | 添加关键词 | "AI" → "AI safety" → "AI alignment research" |
| **使用 web_fetch** | 获取完整内容 | 先搜索，然后 fetch 完整文章 |
| **包含日期** | 对于时间敏感查询 | "semiconductor export restrictions 2025" |
| **使用 "today"** | 对于今日信息 | "major news stories today" |

> [!warning] 搜索禁令 | Search Prohibitions
> **永远不要做**：
>
> - 使用 `-` 操作符（除非明确要求）
> - 使用 `site:URL` 操作符（除非明确要求）
> - 使用引号（除非明确要求）
> - 在图像识别查询中包含人名（保护隐私）

---

## 🧪 学习练习 | Learning Exercises

> [!help] 学习练习 | Learning Exercise

**练习 1：搜索分类 | Search Classification**

将以下查询分类为正确的搜索类别：

1. "Python 中的 for 循环怎么写？"
2. "今天天气怎么样？"
3. "东京人口是多少？"
4. "iPhone 15 的评论如何？"
5. "相对论是什么（ELI5）？"
6. "最近的半导体出口限制对我们的投资策略有何影响？"

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**：

1. **Never Search** - 编程语法稳定，Claude 已知道
2. **Single Search** - 天气每日变化，需要实时数据
3. **Do Not Search But Offer** - 人口数据变化缓慢，先回答再提议
4. **Research** - 需要多个评论来源进行比较（2-4 次调用）
5. **Never Search** - 科学概念稳定
6. **Research** - 复杂查询，需要政策分析 + 内部数据（10+ 次调用）

**关键原则**：信息稳定性 + 查询复杂度 = 搜索决策
</details>

**练习 2：版权边界判断 | Copyright Boundary Judgment**

以下哪些行为违反版权规则？

1. 引用一个 10 词的句子，加引号，注明来源
2. 引用两个不同的 8 词句子
3. 创建一个 20 词的摘要，使用原创措辞
4. 在 artifact 中包含歌词
5. 复制一段 25 词的话术并加引号

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**：

1. ✅ 合法 - 10 词 < 15 词限制，加引号，有来源
2. ❌ **违规** - 虽然每个都 < 15 词，但**每响应最多 1 个引用**
3. ✅ 合法 - 原创措辞，20 词摘要可以接受
4. ❌ **违规** - **永远不要复制歌词**，即使在 artifacts 中
5. ❌ **违规** - 25 词 > 15 词限制

**关键规则**：
> Maximum ONE very short quote (< 15 words) per response, with quotation marks and citation.
> 每个响应最多 1 个非常简短的引用（< 15 词），加引号并注明来源。
</details>

**练习 3：研究计划设计 | Research Plan Design**

用户问："开发一个基于市场趋势和我们当前地位的东南亚市场进入策略"

请设计一个研究计划（列出需要调用的工具类型和次数）：

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**：

**研究计划（10+ 次工具调用）**：

**阶段 1：市场趋势分析（外部）**

1. web_search: "Southeast Asia market entry 2025"
2. web_search: "ASEAN business environment trends"
3. web_fetch: 获取完整市场报告（来自政府或权威来源）
4. web_search: "foreign investment restrictions Southeast Asia"

**阶段 2：竞争分析**
5. web_search: "competitors [industry] Southeast Asia"
6. web_search: "market share analysis [industry] ASEAN"

**阶段 3：内部数据收集**
7. google_drive_search: "current market positioning"
8. google_drive_search: "international expansion strategy"
9. google_drive_search: "Southeast Asia opportunities"

**阶段 4：综合与验证**
10. web_search: "best practices market entry strategy"
11. web_fetch: 获取具体案例研究文档

**阶段 5：创建报告**
使用 artifacts 工具创建综合策略文档

**总工具调用**：11 次（符合"10+ 次"的研究类别要求）

**关键原则**：
> Use all relevant tools as needed for the best answer. Scale tool calls by difficulty.
> 根据需要使用所有相关工具以获得最佳答案。根据难度扩展工具调用。
</details>

---

## 📊 总结与反思 | Summary & Reflection

> [!abstract] 核心思想 | Core Idea
> ==搜索行为的三个维度==
>
> **信息稳定性 | Information Stability**：
>
> - 稳定（多年不变）→ 不搜索
> - 缓慢变化（年度）→ 回答 + 提议
> - 快速变化（日/月）→ 立即搜索
>
> **查询复杂度 | Query Complexity**：
>
> - 简单事实 → 单次搜索
> - 多方面/复杂 → 研究（2-20 次）
>
> **版权保护 | Copyright Protection**：
>
> - < 15 词引用
> - 最多 1 个引用/响应
> - 永不复制歌词

> [!tip] 实践建议 | Practical Recommendations
> **如何在应用中应用类似逻辑？**
>
> 1. **实现决策树**：编码搜索决策逻辑
> 2. **跟踪信息年龄**：标记数据的时效性
> 3. **设置调用限制**：防止过度搜索
> 4. **版权检查**：在输出前验证引用长度
> 5. **来源优先级**：优先使用权威来源

> [!warning] 关键约束总结 | Critical Constraints Summary
>
> | 约束 | 规则 | 违规后果 |
> |------|------|----------|
>
| **工具调用格式** | 使用 `<antml:function_calls>` | 工具调用失败 |
| **版权引用** | < 15 词，最多 1 个 | 法律风险 + 奖励减少 |
> | **歌词复制** | 永不复制 | 严重违规 |
> | **有害内容** | 拒绝搜索 | 安全违规 |
> | **搜索次数** | 按复杂度扩展 | 效率低下 |

---

## 🔗 相关链接 | Related Links

- [[00-Index]] - Anthropic 系统提示词学习索引
- [[thinking-mode]] - 思维模式
- [[past-chats-tools]] - 对话检索工具
- [[copyright-boundaries]] - 版权边界详细说明

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
