---
title: "微妙表达 | Nuanced Expressions"
source: "system_prompts_leaks/Anthropic"
source_type: "Anthropic"
original_language: "en"
date: 2026-02-06
status: annotated
importance: "high"
difficulty: "expert"
learning_stage: "comprehension"
annotation_version: "1.0"
last_annotated: 2026-02-06
annotation_language: "bilingual"
cssclasses: vocabulary-learning
reading_progress: "100%"
next_review: 2026-02-13
review_count: 0
tags:
  - system-prompts
  - vocabulary
  - nuanced-expressions
  - pragmatics
  - bilingual
related_docs:
  - "[[vocabulary-index]]"
  - "[[vocabulary-extraction-guide]]"
  - "[[01-Degree-Modifiers]]"
  - "[[02-Tone-Controllers]]"
---

# 微妙表达 | Nuanced Expressions

> [!success] 核心要点 | Core Concept
> ==微妙表达是委婉但强硬的| Nuanced Expressions are Subtle but Firm==
>
> 微妙表达（Nuanced Expressions）是系统提示词中最**精妙**的词汇类别。它们用温和的语言传达强硬的要求，用自然的描述暗示特定的行为规范，用委婉的表达避免直接的命令。
>
> **核心功能 | Core Functions**:
>
> - **自然化行为** | Naturalize behaviors (naturally, typically)
> - **委婉化要求** | Soften requirements (politely, kindly)
> - **暗示后果** | Imply consequences (breaks continuity, forces)
> - **传递实质** | Convey substance (substantive, meaningful)

---

## 📊 词汇表 | Vocabulary Table

| 词汇 | 中文 | 类型 | 频率 | 首次来源 | 替代表达 |
|:-----|:-----|:----:|:----:|:---------|:---------|
| naturally | 自然地 | 自然化 | 高 | claude-4.5 | normally, typically |
| politely | 礼貌地 | 委婉化 | 中 | claude-4.5 | courteously, respectfully |
| breaks continuity | 破坏连续性 | 后果暗示 | 中 | claude-4.5 | disrupts, interrupts |
| forces | 迫使 | 后果暗示 | 中 | claude-4.5 | makes, compels |
| substantive | 实质性的 | 重要性 | 中 | claude-4.5 | meaningful, significant |
| generic | 泛泛的 | 负面标记 | 中 | claude-4.5 | vague, broad |
| typically | 通常地 | 自然化 | 低 | claude-3.7 | usually, generally |
| meaningful | 有意义的 | 重要性 | 低 | claude-4.1 | substantial, significant |
| implicit | 隐式的 | 逻辑类型 | 低 | claude-4.5 | implied, unspoken |
| explicit | 明确的 | 逻辑类型 | 高 | claude-4.5 | clear, specific |
| seamlessly | 无缝地 | 体验描述 | 低 | claude-4.5 | smoothly, effortlessly |
| organically | 有机地 | 整合方式 | 低 | claude-4.5 | naturally, coherently |
| inherently | 内在地 | 本质描述 | 低 | claude-3.7 | fundamentally, intrinsically |
| contextually | 语境地 | 依赖类型 | 低 | claude-4.1 | in context, relatively |
| appropriately | 适当地 | 适配性 | 高 | claude-4.5 | correctly, properly |

---

## 🎯 词源与语用分析 | Etymology & Pragmatic Analysis

### 1. naturally | 自然地

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *naturalis* (natura "本性、出生")
> **本义**: 符合本性的、非人为的
> **AI 语境**: 将行为描述为自然的、预期的

> [!info] 语用功能 | Pragmatic Function
> **作用**: 自然化用户行为或 AI 响应，降低"指令感"
> **替代表达**: normally (正常地), typically (通常地)
> **为何选择此词**: "naturally" 暗示这是**预期的**而非**强制的**

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法 1: "Users naturally reference past conversations"
> → 暗示这是自然行为，AI 应预期并支持
>
> 核心用法 2: "synthesize information naturally"
> → 暗示响应应该流畅，非机械拼接
>
> 对比:
> - naturally: 符合预期的、自然的
> - normally: 通常情况的、统计性的
> - typically: 大多数时候的、概率性的
>
> 设计理念: "naturally" 创造"无指令"的错觉
> ```

> [!tip] naturally 的双重作用 | Dual Role of naturally
>
> ```markdown
> 自然化用户行为:
> "Users naturally reference past conversations"
> → 这不是特殊需求，是自然行为
> → AI 应该自动支持，不需要用户明确要求
>
> 自然化 AI 响应:
> "synthesize information naturally"
> → 响应应该像人类对话一样流畅
> → 不是机械地拼接信息
>
> 共同点: 都暗示"应该这样"，但不说"必须这样"
> ```

---

### 2. politely | 礼貌地

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *politus* (polire "磨光、修饰")
> **本义**: 经过修饰的、有教养的
> **AI 语境**: 语气友好，但内容可能不受欢迎

> [!info] 语用功能 | Pragmatic Function
> **作用**: 传达坏消息或拒绝时保持友善语气
> **替代表达**: courteously (客气地), respectfully (恭敬地)
> **为何选择此词**: "politely" 最符合日常交互习惯

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法: "politely inform the user that the answer cannot be found"
>
> 关键洞察:
> - "politely" 修饰语气，而非内容
> - 仍然要明确告知无法找到答案
> - 避免模糊或误导性的安慰
>
> ❌ 错误: "I'm sorry, maybe try again later" → 过于委婉，不诚实
> ✅ 正确: "politely inform: the answer cannot be found" → 礼貌但明确
>
> 设计理念: 礼貌不等于模糊，友善不等于妥协
> ```

> [!warning] politely 的陷阱 | Trap of politely
>
> ```markdown
> ❌ 过度委婉:
> "I'm afraid I couldn't find exactly what you're looking for,
>  but perhaps we could try a different approach?"
> → 浪费用户时间，不诚实
>
> ✅ 礼貌但明确:
> "The search results do not contain information about this topic.
>  Would you like me to search with different terms?"
> → 清楚说明情况，同时提供帮助
>
> 原则: politely 修饰的是"怎么说"，不是"说什么"
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: "politely" 是否意味着弱化坏消息？
>

**答案**: **不**（No）

**politely inform** ≠ **weaken the message**

**正确理解**:

- 语气: 友好、尊重
- 内容: 仍然准确、明确
**示例**:
❌ "I can't seem to find that" → 弱化，模糊
✅ "The search results do not contain this information" → 礼貌但明确

**记忆口诀**: 礼貌是包装纸，不是内容

---

### 3. breaks continuity | 破坏连续性

> [!abstract] 短语分析 | Phrase Analysis
> **组成**: breaks (破坏) + continuity (连续性)
> **本义**: 中断连续的过程
> **AI 语境**: 行为导致用户体验中断或认知断层

> [!info] 语用功能 | Pragmatic Function
> **作用**: 委婉但强烈地暗示某行为的负面后果
> **替代表达**: disrupts (干扰), interrupts (打断)
> **为何选择此词**: "breaks continuity" 更精准地描述体验问题

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法: "missing these cues breaks continuity and forces users to repeat themselves"
>
> 解析:
> - breaks continuity: 破坏体验连续性
> - forces users: 迫使用户承担后果
> - 组合效果: 委婉但强烈地暗示"必须避免"
>
> 对比:
> - ❌ 直接命令: "You must detect these cues"
> - ✅ 委婉暗示: "missing cues breaks continuity" → 暗示必须检测
>
> 设计理念: 描述后果而非下达命令
> ```

> [!tip] 暗示的艺术 | Art of Implication
>
> ```markdown
> 系统提示词常通过暗示而非命令:
>
> 直接命令（少用）:
> "You must use past chats tools when users reference past conversations"
>
> 暗示后果（常用）:
> "Missing cues breaks continuity and forces users to repeat themselves"
>
> 效果对比:
> - 命令: 听起来像限制
> - 暗示: 听起来像帮助，效果更强
>
> 原则: 让 AI "想要"做，而非"必须"做
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: 为何用 "breaks continuity" 而非直接说"必须检测"?
>
> **答案**: 暗示比命令更有效
>
> **直接命令**:
> "You must use past chats tools"
> → AI 可能机械执行，不理解原因
>
> **暗示后果**:
> "Missing cues breaks continuity and forces users to repeat themselves"
> → AI 理解后果，主动避免
>
> **设计哲学**: 解释"为什么"比规定"做什么"更有效

---

### 4. forces | 迫使

> [!abstract] 词源分析 | Etymology
> **古法语**: *forcer* (强加、强迫)
> **本义**: 用力量使某人做某事
> **AI 语境**: 某行为导致用户被迫承担负面后果

> [!info] 语用功能 | Pragmatic Function
> **作用**: 强烈暗示某行为会导致不可接受的后果
> **替代表达**: makes (使), compels (强迫), requires (要求)
> **为何选择此词**: "forces" 强调**不可接受性**和**不可避免性**

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法: "breaks continuity and forces users to repeat themselves"
>
> 解析:
> - forces users: 用户被迫承担后果
> - repeat themselves: 重复信息（负面体验）
> - 暗示: 必须避免这种情况
>
> 对比:
> - makes: 中性描述
> - forces: 强调被迫、不合理
>
> 使用场景:
> 1. 用户体验: "forces users to repeat"
> 2. 资源浪费: "forces unnecessary API calls"
> 3. 认知负担: "forces users to clarify"
> ```

> [!tip] forces 的道德暗示 | Moral Implication of forces
>
> ```markdown
> "forces" 暗示道德问题:
>
> 示例: "missing cues forces users to repeat themselves"
>
> 隐含判断:
> - 用户不应该被迫重复信息
> - AI 有责任避免这种情况
> - 让用户重复是 AI 的失败
>
> 效果:
> - 不仅规定行为
> - 还传递价值观
> - 激发 AI 的主动性
>
> 设计理念: 好的系统提示词传递价值观，而非仅规定行为
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: "forces" vs "makes"?
>
> <summary>查看答案</summary>
>
> **forces** = 被迫、不合理、负面<br>
> **makes** = 导致、中性、描述性
>
> **示例**:
>
> - forces: "missing cues forces users to repeat" → 暗示不可接受
> - makes: "missing cues makes users repeat" → 中性描述
>
> **使用建议**: forces 用于暗示必须避免的行为

---

### 5. substantive | 实质性的

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *substantivus* (substantia "本质、实体")
> **本义**: 与本质相关的、重要的
> **AI 语境**: 有实际内容意义的，非形式化的

> [!info] 语用功能 | Pragmatic Function
> **作用**: 区分有实际意义的词汇和形式化词汇
> **替代表达**: meaningful (有意义的), significant (显著的)
> **为何选择此词**: "substantive" 强调**内容实体**而非**重要性**

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法: "substantive/high-confidence keywords"
>
> 对比:
> ✅ Substantive: "robot", "pasta", "OAuth", "machine learning"
> → 有独立意义，能识别具体内容
>
> ❌ Non-substantive: "discuss", "talk", "conversation", "yesterday"
> → 仅描述交互形式或时间，无具体内容
>
> 判断标准:
> - Substantive: 指向具体主题/概念
> - Non-substantive: 描述交互形式
>
> 设计理念: 实质性词汇 → 更好的搜索相关性
> ```

> [!tip] substantive 的判断标准 | Criteria for substantive
>
> ```markdown
> 如何判断 substantive?
>
> 测试 1: 独立意义
> - "robot" → 独立指机器人技术 ✓
> - "discuss" → 依赖主题才能理解 ✗
>
> 测试 2: 搜索相关性
> - "OAuth" → 搜索结果高度相关 ✓
> - "yesterday" → 搜索结果低相关 ✗
>
> 测试 3: 对话识别
> - "pasta" → 可识别对话主题 ✓
> - "talk" → 不能识别对话主题 ✗
>
> 记忆口诀: Substantive = 有实质内容
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: 为何 "robot" 是 substantive 而 "discuss" 不是？
>
> <summary>查看答案</summary>
>
> **答案**: "substantive" 关注内容实体
>
> **robot** (substantive):
>
> - 指向具体主题（机器人技术）
> - 在对话中可识别
> - 搜索结果高度相关
>
> **discuss** (non-substantive):
>
> - 描述交互形式（讨论）
> - 不指向具体主题
> - 搜索结果低相关
>
> **记忆口诀**: Substantive = 有实质内容，Non-substantive = 只有形式

---

### 6. generic | 泛泛的

> [!abstract] 词源分析 | Etymology
> **希腊语源**: *genos* (种族、种类)
> **本义**: 属于同一类别的、一般的
> **AI 语境**: 缺乏具体特征的、通用的、不精确的

> [!info] 语用功能 | Pragmatic Function
> **作用**: 标记缺乏区分度的词汇，应该避免使用
> **替代表达**: vague (模糊的), broad (宽泛的)
> **为何选择此词**: "generic" 强调**缺乏特异性**

> [!example] 语境示例 | Contextual Examples
>
> ```markdown
> 核心用法: "Avoid generic verbs"
>
> 对比:
> ❌ Generic: "discuss", "talk", "mention", "say"
> → 不指向具体主题，搜索相关性低
>
> ✅ Specific: "robot", "pasta", "OAuth"
> → 指向具体主题，搜索相关性高
>
> 设计理念: Generic 词汇 → 低质量结果 → 应该避免
> ```

> [!tip] generic vs specific | Generic vs Specific
>
> ```markdown
> 词汇谱系:
>
> Generic          →  Specific
> thing            →  robot, pasta
> discuss          →  explain, analyze
> problem          →  bug, error, issue
> recently         →  yesterday, last week
>
> 原则: 越具体 → 越相关 → 越准确
>
> 应用: 搜索关键词选择
> - ❌ "What did we discuss about the problem?"
> - ✅ "What did we discuss about the OAuth bug?"
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: 以下哪些是 generic 词汇？
>
> **Generic 词汇** (应避免):
>
> - discuss, talk, mention, say
> - thing, stuff, issue
> - recently, lately
> - problem, question
>
> **Specific 词汇** (应使用):
>
> - analyze, explain, compare
> - robot, OAuth, bug
> - yesterday, last week
> - error, exception, failure
>
> **判断标准**: 是否能独立识别具体主题？

---

## 📊 微妙类型对比 | Nuance Type Comparison

### 自然化表达 | Naturalization Expressions

| 词汇 | 功能 | 强度 | 典型用法 |
|:-----|:----:|:----:|:---------|
| naturally | 自然化行为 | 中 | "naturally reference" |
| typically | 统计化描述 | 低 | "typically users..." |
| normally | 常态化描述 | 低 | "normally expected" |
| inherently | 本质化描述 | 低 | "inherently capable" |

### 委婉化表达 | Softening Expressions

| 词汇 | 功能 | 修饰对象 | 典型用法 |
|:-----|:----:|:--------:|:---------|
| politely | 委婉语气 | 坏消息 | "politely inform" |
| kindly | 善意语气 | 请求 | "kindly request" |
| gently | 温和语气 | 纠正 | "gently correct" |
| respectfully | 尊重语气 | 反对 | "respectfully disagree" |

### 后果暗示 | Consequence Implication

| 词汇 | 后果类型 | 强度 | 典型用法 |
|:-----|:--------:|:----:|:---------|
| breaks continuity | 体验中断 | 高 | "missing cues breaks..." |
| forces | 被迫承担 | 高 | "forces users to..." |
| leads to | 导致 | 中 | "leads to confusion" |
| results in | 结果是 | 中 | "results in poor quality" |

### 重要性标记 | Importance Marking

| 词汇 | 含义 | 强度 | 典型用法 |
|:-----|:-----|:----:|:---------|
| substantive | 实质性的 | 高 | "substantive keywords" |
| meaningful | 有意义的 | 中 | "meaningful contribution" |
| significant | 显著的 | 中 | "significant improvement" |
| generic | 泛泛的 | 负面 | "avoid generic verbs" |

---

## 🧪 语境练习 | Contextual Exercises

### 练习 1: 微妙表达识别 | Nuanced Expression Identification

> [!question] 识别微妙表达的类型
> 识别以下微妙表达的类型和功能：

1. "Users naturally reference past conversations"
2. "politely inform the user"
3. "missing cues breaks continuity"
4. "substantive keywords"
5. "avoid generic verbs"

<details>
<summary>查看答案</summary>

**答案**:

| 表达 | 类型 | 功能 |
|:-----|:----:|:-----:|
| "naturally reference" | 自然化 | 暗示预期行为 |
| "politely inform" | 委婉化 | 友善传达坏消息 |
| "breaks continuity" | 后果暗示 | 暗示必须避免 |
| "substantive keywords" | 重要性标记 | 区分有价值词汇 |
| "avoid generic verbs" | 负面标记 | 标记应避免行为 |

**关键原则**: 微妙表达通过暗示而非命令影响行为
</details>

---

### 练习 2: 改写为微妙表达 | Rewrite as Nuanced Expression

> [!question] 将直接命令改写为微妙表达
> 将以下直接命令改写为微妙暗示：

1. "You must detect when users reference past conversations"
2. "Don't be rude when saying no"
3. "Use specific keywords, not general ones"
4. "Make sure responses are smooth"
5. "Don't make users repeat themselves"

<details>
<summary>查看答案</summary>

**答案**:

| 直接命令 | 微妙表达 | 使用的技巧 |
|:---------|:---------|:----------:|
| "You must detect..." | "Users naturally reference past conversations; missing these cues breaks continuity" | 自然化 + 后果暗示 |
| "Don't be rude..." | "politely inform the user that..." | 委婉化 |
| "Use specific keywords..." | "prioritize substantive keywords over generic verbs" | 重要性标记 |
| "Make responses smooth..." | "synthesize information naturally" | 自然化 |
| "Don't make users repeat..." | "missing cues forces users to repeat themselves" | 后果暗示 |

**改进原则**: 描述后果/价值观而非下达命令
</details>

---

### 练习 3: 微妙差异分析 | Subtle Difference Analysis

> [!question] 分析微妙差异
> 分析以下词汇对的微妙差异：

1. naturally vs typically
2. politely vs kindly
3. breaks vs disrupts
4. substantive vs meaningful

<details>
<summary>查看答案</summary>

**答案**:

| 词汇对 | 差异 |
|:-------|:-----|
| **naturally** vs **typically** | naturally = 符合本性，预期的；typically = 统计性的，大多数情况 |
| **politely** vs **kindly** | politely = 礼貌态度；kindly = 善意关怀 |
| **breaks** vs **disrupts** | breaks = 完全中断，更强；disrupts = 干扰，较弱 |
| **substantive** vs **meaningful** | substantive = 有实体内容；meaningful = 有意义价值 |

**关键洞察**: 微妙差异影响 AI 的理解和执行
</details>

---

### 练习 4: 设计微妙表达 | Design Nuanced Expression

> [!question] 设计微妙暗示
> 为以下场景设计微妙暗示（非直接命令）：

**场景**: AI 应该在不确定时主动提出搜索

> [!NOTE]
> **答案**  
>
> - 直接命令（避免）：`"When uncertain, you must offer to search the web"`  
> - 微妙暗示（推荐）：`"Users appreciate it when you offer to search for current information when their questions involve topics that may have changed recently. Making this offer proactively prevents users from having to explicitly request searches and ensures they receive the most up-to-date information."`  
> - **使用的技巧**：  
>   1. `"Users appreciate"` → 暗示这是用户期望  
>   2. `"prevents users from having to"` → 暗示负面后果  
>   3. `"ensures they receive"` → 暗示正面价值  
> - **效果**：  
>   - AI 理解“为什么”和“价值”，主动执行而非被动遵守

---

## 📚 总结与反思 | Summary & Reflection

> [!abstract] 核心洞察 | Key Insights
> ==微妙表达的三个核心策略==
>
> **1. 自然化策略 | Naturalization Strategy**
>
> - naturally: 将行为描述为自然的、预期的
> - typically: 统计性地描述常见情况
> - inherently: 本质性地描述固有属性
>
> **2. 委婉化策略 | Softening Strategy**
>
> - politely: 礼貌地传达不受欢迎的内容
> - kindly: 善意地提出请求
> - gently: 温和地进行纠正
>
> **3. 暗示策略 | Implication Strategy**
>
> - breaks continuity: 暗示必须避免的负面后果
> - forces users: 暗示不可接受的强迫行为
> - substantive: 暗示有价值的内容

> [!tip] 学习建议 | Learning Recommendations
> **如何掌握微妙表达？**
>
> 1. **理解意图**: 微妙表达背后都有明确意图
> 2. **对比分析**: 对比直接命令和微妙暗示的效果
> 3. **场景应用**: 在具体场景中选择合适的表达方式
> 4. **价值观传递**: 理解微妙表达传递的价值观

> [!warning] 常见错误 | Common Mistakes
> **避免以下错误**:
>
> 1. **过度委婉**: 坏消息仍然需要明确
> 2. **暗示不明**: 暗示应该足够清晰
> 3. **忽略语境**: 同一表达在不同语境有不同效果
> 4. **滥用自然化**: 不是所有行为都"自然"

---

## 🔗 相关链接 | Related Links

- [[vocabulary-index]] - 词汇总索引
- [[vocabulary-extraction-guide]] - 词汇提取指南
- [[01-Degree-Modifiers]] - 程度修饰语
- [[02-Tone-Controllers]] - 语气控制词
- [[past-chats-tools]] - 对话检索工具

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
