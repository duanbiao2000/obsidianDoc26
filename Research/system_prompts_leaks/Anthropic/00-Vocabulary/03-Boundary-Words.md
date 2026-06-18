---
title: 边界词 | Boundary Words
source: system_prompts_leaks/Anthropic
source_type: Anthropic
original_language: en
date: 2026-02-06
status: annotated
importance: high
difficulty: advanced
learning_stage: comprehension
annotation_version: "1.0"
last_annotated: 2026-02-06
annotation_language: bilingual
cssclasses: vocabulary-learning
reading_progress: 100%
next_review: 2026-02-13
review_count: 0
tags:
  - system-prompts
  - vocabulary
  - boundary-words
  - conditionals
  - bilingual
related_docs:
  - "[[vocabulary-index]]"
  - "[[vocabulary-extraction-guide]]"
  - "[[02-Tone-Controllers]]"
  - "[[search-behavior]]"
---

# 边界词 | Boundary Words

> [!success] 核心要点 | Core Concept
> ==边界词定义操作范围 | Boundary Words Define Operational Boundaries==
>
> 边界词（Boundary Words）是用于精确限定 AI 行为**范围、条件和数量**的词汇。它们定义了"在什么情况下做什么"、"做到什么程度"、"哪些可以做哪些不能做"。
>
> **核心功能 | Core Functions**:
> - **定义条件边界** | Define conditional boundaries (unless, when, if)
> - **设定数量限制** | Set quantity limits (maximum, minimum, at most)
> - **明确范围约束** | Specify scope constraints (only, except, within)
> - **表达近似边界** | Express approximate boundaries (approximately, roughly)

---

## 📊 词汇表 | Vocabulary Table

| 词汇 | 中文 | 类型 | 频率 | 首次来源 | 替代表达 |
|:-----|:-----|:----:|:----:|:---------|:---------|
| unless | 除非 | 条件 | 高 | claude-4.5 | except if, without |
| only | 只有 | 约束 | 高 | claude-4.5 | solely, exclusively |
| maximum | 最大 | 数量 | 高 | claude-4.5 | max, greatest |
| minimum | 最小 | 数量 | 高 | claude-4.5 | min, least |
| at most | 最多 | 数量 | 中 | claude-4.5 | no more than |
| at least | 至少 | 数量 | 中 | claude-3.7 | no fewer than |
| approximately | 大约 | 近似 | 中 | claude-4.5 | about, roughly |
| except | 除...外 | 排除 | 中 | claude-4.1 | excluding, barring |
| within | 在...内 | 范围 | 低 | claude-3.7 | inside, not exceeding |
| beyond | 超过 | 边界 | 低 | claude-4.5 | exceeding, outside |
| limit | 限制 | 约束 | 高 | claude-4.5 | restrict, constrain |
| cap | 上限 | 数量 | 低 | claude-4.1 | ceiling, maximum |
| threshold | 阈值 | 边界 | 低 | claude-code | limit, boundary |
| up to | 多达 | 数量 | 中 | claude-4.5 | as many as |
| unless explicitly | 除非明确 | 条件 | 高 | claude-4.5 | unless specifically |

---

## 🎯 词源与语用分析 | Etymology & Pragmatic Analysis

### 1. unless | 除非

> [!abstract] 词源分析 | Etymology
> **古英语**: *on lesse* (on "在...上" + lesse "较少")
> **本义**: 在较少条件下，即"如果不"
> **AI 语境**: 唯一例外条件，否则执行默认行为

> [!info] 语用功能 | Pragmatic Function
> **作用**: 定义单一例外条件，其他情况都执行默认行为
> **替代表达**: except if (除了如果), without (没有)
> **为何选择此词**: "unless" 简洁地表达"唯一例外情况"

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "unless the user explicitly asks"
>
> 对比:
> - unless: 单一例外，其他都执行
> - except if: 明确排除条件
> - without: 缺少某条件
>
> unless 使用场景:
> 1. 条件触发: "don't use xml tags unless explicitly asked"
> 2. 行为控制: "don't search unless uncertain"
> 3. 例外定义: "always cite unless no sources found"
> ```

> [!tip] unless 的逻辑 | Logic of unless
> ```markdown
> unless = if not
>
> 示例: "Don't use xml unless asked"
> = Don't use xml if not asked
> = Use xml only if asked
>
> 设计理念:
> 默认行为 (Don't use xml)
> + 例外条件 (if asked)
> = 清晰的行为边界
> ```

---

### 2. only | 只有

> [!abstract] 词源分析 | Etymology
> **古英语**: *anlic* (one "一" + -lic "像")
> **本义**: 单独的、唯一的
> **AI 语境**: 严格限制，仅此不彼

> [!info] 语用功能 | Pragmatic Function
> **作用**: 强调排他性，仅允许特定行为或用途
> **替代表达**: solely (仅仅), exclusively (专有地)
> **为何选择此词**: "only" 最自然、最常用

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "only for your reference"
>
> 对比:
> - only: 严格限制，仅此用途
> - mainly: 主要用途，可能有其他
> - primarily: 首要用途，次要用途存在
>
> only 使用场景:
> 1. 用途限制: "only for your reference, do not respond with it"
> 2. 条件限制: "only if the user explicitly asks"
> 3. 行为限制: "only use web_search when uncertain"
> ```

> [!warning] only 的严格性 | Strictness of only
> ```markdown
> only = 排他性约束
>
> 示例: "only for your reference"
>
> ✅ 允许: 内部分析、理解上下文
> ❌ 禁止: 在响应中直接引用、展示给用户
>
> 设计理念: only 创造严格的功能边界
> - 防止滥用
> - 明确用途
> - 限制范围
> ```

---

### 3. maximum | 最大

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *maximus* (magnus "大" 的最高级)
> **本义**: 最大的、最高程度的
> **AI 语境**: 硬性上限，不可超过

> [!info] 语用功能 | Pragmatic Function
> **作用**: 设定不可逾越的数量或程度上限
> **替代表达**: max (缩写), greatest (最大的)
> **为何选择此词**: "maximum" 正式且精确

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "maximum ONE short quote per response"
>
> 对比:
> - maximum: 硬性上限，不可超过
> - up to: 软性上限，建议不超过
> - approximately: 近似值，可小幅超出
>
> maximum 使用场景:
> 1. 数量限制: "maximum 16000 thinking tokens"
> 2. 频次限制: "maximum ONE quote"
> 3. 次数限制: "maximum 20 chat retrievals"
> ```

> [!tip] maximum vs minimum | Maximum vs Minimum
> ```markdown
> 对偶关系:
>
> maximum + minimum = 范围定义
>
> 示例: "between minimum 2 and maximum 5 tool calls"
>
> 设计理念:
> - minimum: 确保基本质量（至少2次）
> - maximum: 控制资源消耗（最多5次）
> - 范围: 给 AI 灵活判断空间（2-5次之间）
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: maximum vs "up to"?
>
> <details>
> <summary>查看答案</summary>
>
> **maximum** = 硬性上限，不可超过<br>
> **up to** = 软性上限，建议不超过
>
> **示例**:
> - maximum 20: 严格限制，21次违规
> - up to 20: 建议限制，21次可接受
>
> **使用场景**:
> - maximum: 资源限制、安全约束
> - up to: 指导建议、最佳实践
> </details>

---

### 4. minimum | 最小

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *minimus* (small "小" 的最高级)
> **本义**: 最小的、最低程度的
> **AI 语境**: 确保基本质量或数量的下限

> [!info] 语用功能 | Pragmatic Function
> **作用**: 设定必须达到的最低标准
> **替代表达**: min (缩写), least (最少的)
> **为何选择此词**: "minimum" 清晰表达下限要求

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "use the minimum number of tool calls necessary"
>
> 对比:
> - minimum: 必须达到，否则不足
> - ideally: 理想情况，可以不足
> - recommended: 推荐，不强制
>
> minimum 使用场景:
> 1. 数量要求: "minimum 2 sources for research"
> 2. 质量标准: "minimum level of detail"
> 3. 效率要求: "minimum tokens necessary"
> ```

> [!tip] minimum 的灵活性 | Flexibility of minimum
> ```markdown
> minimum ≠ 固定值
>
> 示例: "use the minimum number necessary"
>
> 含义:
> - 简单问题 → 1次调用 (minimum)
> - 复杂问题 → 5次调用 (minimum for this case)
>
> 设计理念: minimum 是动态的，根据需求调整
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: minimum vs "at least"?
>
> <details>
> <summary>查看答案</summary>
>
> **minimum** = 最低标准（属性）<br>
> **at least** = 至少数量（要求）
>
> **示例**:
> - minimum: "the minimum necessary" → 最小必需量
> - at least: "use at least 2 sources" → 至少2个
>
> **使用差异**:
> - minimum: 描述标准或质量
> - at least: 设定数量要求
> </details>

---

### 5. at most | 最多

> [!abstract] 词源分析 | Etymology
> **介词短语**: at + most (最多的)
> **本义**: 在最多...的情况下
> **AI 语境**: 软性上限，通常不应超过

> [!info] 语用功能 | Pragmatic Function
> **作用**: 设定建议性上限，偶尔可合理超出
> **替代表达**: no more than (不超过), up to (多达)
> **为何选择此词**: "at most" 比 maximum 更灵活

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "at most ONE short quote (<15 words)"
>
> 对比:
> - at most: 建议上限，合理例外可超出
> - maximum: 硬性上限，严格不可超出
> - approximately: 近似值，小幅偏离正常
>
> at most 使用场景:
> 1. 数量指导: "at most 20 tool calls"
> 2. 程度限制: "at most 15 words"
> 3. 频次建议: "stop after approximately 5 calls"
> ```

> [!tip] at most 的灵活性 | Flexibility of at most
> ```markdown
> at most = 通常遵循，允许例外
>
> 示例: "at most 20 retrievals"
>
> 正常情况: 10-15 次检索
> 特殊情况: 25 次检索（用户明确要求全面搜索）
>
> 设计理念: at most 是指导性上限，而非绝对限制
> ```
>
>> [!question] 闪卡练习 | Flashcard Exercise
>> **Q**: at most vs maximum?
>>
>> <details>
>> <summary>查看答案</summary>
>>
>> **at most** = 软性上限，建议性<br>
>> **maximum** = 硬性上限，强制性
>>
>> **示例**:
>> - at most 20: 建议20次内，特殊可超
>> - maximum 20: 严格20次，超过违规
>>
>> **使用场景**:
>> - at most: 最佳实践、资源优化
>> - maximum: 安全限制、硬约束
>> </details>

---

### 6. approximately | 大约

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *approximatus* (ad- "向" + proximus "最近的")
> **本义**: 接近的、差不多的
> **AI 语境**: 近似值，允许小幅偏离

> [!info] 语用功能 | Pragmatic Function
> **作用**: 表达非精确的数量或程度，允许合理浮动
> **替代表达**: about (大约), roughly (粗略地), around (左右)
> **为何选择此词**: "approximately" 正式且精确地表达"近似"

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "stop after approximately 5 calls"
>
> 对比:
> - approximately: ±10-20% 浮动正常
> - exactly: 精确值，不能偏离
> - up to: 不超过此值
>
> approximately 使用场景:
> 1. 数量估算: "approximately 500 words"
> 2. 频次指导: "approximately 5 calls"
> 3. 范围表达: "approximately 10-15 sources"
> ```

> [!tip] approximately 的容差 | Tolerance of approximately
> ```markdown
> approximately = 允许合理浮动
>
> 示例: "approximately 5 calls"
>
> 合理范围: 4-6 次 (±20%)
> 可接受: 3-7 次 (±40%)
> 过度: 10+ 次 (超出容差)
>
> 设计理念: approximately 给予 AI 判断空间
> - 不是严格限制
> - 是参考指导
> - 允许根据需求调整
> ```


---

### 7. except | 除...外

> [!abstract] 词源分析 | Etymology
> **拉丁语源**: *exceptus* (ex- "向外" + capere "拿")
> **本义**: 被拿走的、被排除的
> **AI 语境**: 明确排除特定情况

> [!info] 语用功能 | Pragmatic Function
> **作用**: 从一般规则中明确排除特定情况
> **替代表达**: excluding (不包括), barring (除...外)
> **为何选择此词**: "except" 最自然、最常用

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "always cite except when no sources found"
>
> 对比:
> - except: 明确排除特定情况
> - unless: 条件例外（如果不...）
> - excluding: 列举排除项
>
> except 使用场景:
> 1. 条件排除: "cite except when no sources"
> 2. 项目排除: "all tools except deprecated ones"
> 3. 情况排除: "always search except for stable facts"
> ```

> [!tip] except vs unless | Except vs Unless
> ```markdown
> 区别:
>
> unless = 条件例外（前向）
> - "Don't search unless uncertain"
> - = 如果不确定才搜索
>
> except = 明确排除（后向）
> - "Search for all except stable facts"
> - = 除了稳定事实都搜索
>
> 逻辑方向相反，但结果相似
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: except vs "excluding"?
>
> <details>
> <summary>查看答案</summary>
>
> **except** = 连词，连接句子<br>
> **excluding** = 介词，引入列表
>
> **示例**:
> - except: "all tools except X" → 除外X
> - excluding: "excluding X, Y, Z" → 排除X、Y、Z
>
> **使用建议**: 单项用except，多项用excluding
> </details>

---

### 8. within | 在...内

> [!abstract] 词源分析 | Etymology
> **古英语**: *withinnan* (with "在" + innan "在内部")
> **本义**: 在内部、不超过
> **AI 语境**: 范围限制，不超出指定界限

> [!info] 语用功能 | Pragmatic Function
> **作用**: 设定行为或结果的有效范围
> **替代表达**: inside (在内部), not exceeding (不超过)
> **为何选择此词**: "within" 表达范围约束

> [!example] 语境示例 | Contextual Examples
> ```markdown
> 核心用法: "within 15 words"
>
> 对比:
> - within: 范围约束，包括边界值
> - under: 严格小于，不包括边界
> - approximately: 近似，可小幅超出
>
> within 使用场景:
> 1. 数量范围: "within 15 words"
> 2. 时间限制: "within 24 hours"
> 3. 范围限定: "within the project scope"
> ```

> [!tip] within 的包容性 | Inclusivity of within
> ```markdown
> within = 包括边界值
>
> 示例: "within 15 words"
>
> ✅ 包括: 15词 (边界值)
> ✅ 包括: 10词 (内部值)
> ❌ 超出: 16词 (超出边界)
>
> 设计理念: within 是"不超过"的精确表达
> ```

---

## 📊 边界类型对比 | Boundary Type Comparison

### 条件边界 | Conditional Boundaries

| 词汇 | 方向 | 强度 | 典型用法 |
|:-----|:----:|:----:|:---------|
| unless | 前向 | 中 | "don't X unless Y" |
| except if | 前向 | 中 | "X except if Y" |
| except | 后向 | 中 | "all X except Y" |
| only | 约束 | 高 | "only for X purpose" |

### 数量边界 | Quantity Boundaries

| 词汇       | 类型  | 严格度 | 典型用法                   |
| :------- | :-: | :-: | :--------------------- |
| maximum  | 硬上限 | 最高  | "maximum 16000 tokens" |
| at most  | 软上限 |  高  | "at most 15 words"     |
| minimum  | 硬下限 | 最高  | "minimum 2 sources"    |
| at least | 软下限 |  高  | "at least 2 sources"   |

### 近似边界 | Approximate Boundaries

| 词汇 | 容差 | 精度 | 典型用法 |
|:-----|:----:|:-----:|:---------|
| approximately | ±20% | 高 | "approximately 5 calls" |
| roughly | ±40% | 中 | "roughly 100 words" |
| about | ±30% | 中 | "about 10 sources" |

---

## 🧪 语境练习 | Contextual Exercises

### 练习 1: 选择合适的边界词 | Boundary Word Selection

> [!question] 选择最合适的边界词
> 为以下场景选择最合适的边界词：

1. 引用长度不超过15词
2. 除非用户明确要求
3. 仅用于内部参考
4. 大约5次工具调用
5. 最少2个来源

<details>
<summary>查看答案</summary>

**答案**:

| 场景 | 选择的词 | 理由 |
|:-----|:---------|:-----|
| 引用长度不超过15词 | at most / within | 软性上限 |
| 除非用户明确要求 | unless | 条件例外 |
| 仅用于内部参考 | only | 排他性约束 |
| 大约5次工具调用 | approximately | 近似值 |
| 最少2个来源 | minimum / at least | 下限要求 |

**关键原则**: 匹配边界类型与场景需求
</details>

---

### 练习 2: 边界组合 | Boundary Combination

> [!question] 设计范围约束
> 使用边界词设计以下范围约束：

1. 工具调用次数范围
2. 引用长度范围
3. 响应长度建议
---

### 练习 3: 修改改进 | Improvement

> [!question] 改进以下边界表达
> 将以下表达改进为使用合适的边界词：

1. "Use 5 tool calls"
2. "Don't search if you know the answer"
3. "Only use it for reference"
4. "About 100 words"
5. "No more than 2 quotes"
---

### 练习 4: 逻辑转换 | Logic Transformation

> [!question] 转换边界表达
> 将以下表达转换为等效的其他边界词形式：

1. "Don't use xml unless asked"
2. "Use within 15 words"
3. "Only for reference"
4. "At most 5 calls"

<details>
<summary>查看答案</summary>

**答案**:

| 原文 | 等效表达 |
|:-----|:---------:|
| "Don't use xml unless asked" | "Use xml only if asked" / "Use xml except if not asked" |
| "Use within 15 words" | "Use no more than 15 words" / "Use at most 15 words" |
| "Only for reference" | "Solely for reference" / "Exclusively for reference" |
| "At most 5 calls" | "Maximum 5 calls" / "No more than 5 calls" |

**关键洞察**: 同一边界可用不同词汇表达，选择最自然的
</details>

---

## 📚 总结与反思 | Summary & Reflection

> [!abstract] 核心洞察 | Key Insights
> ==边界词的三个维度==
>
> **1. 条件维度 | Conditional Dimension**
> - unless: 如果不...（前向条件）
> - except: 除了...（后向排除）
> - only: 仅限...（排他约束）
>
> **2. 数量维度 | Quantitative Dimension**
> - maximum/minimum: 硬性边界（严格）
> - at most/at least: 软性边界（灵活）
> - approximately: 近似边界（容差）
>
> **3. 范围维度 | Scope Dimension**
> - within: 范围内（包容性）
> - beyond: 超出（排斥性）
> - only: 唯一性（排他性）

> [!tip] 学习建议 | Learning Recommendations
> **如何掌握边界词？**
>
> 1. **理解逻辑**: unless = if not, only = 排他性
> 2. **区分强度**: maximum vs at most vs approximately
> 3. **组合使用**: minimum + maximum = 范围
> 4. **场景匹配**: 安全用硬边界，指导用软边界

> [!warning] 常见错误 | Common Mistakes
> **避免以下错误**:
>
> 1. **混淆强度**: maximum vs at most
> 2. **忽略包容性**: within vs under
> 3. **逻辑错误**: unless vs except
> 4. **过度精确**: 需要灵活时用了硬边界

---

## 🔗 相关链接 | Related Links

- [[vocabulary-index]] - 词汇总索引
- [[vocabulary-extraction-guide]] - 词汇提取指南
- [[02-Tone-Controllers]] - 语气控制词
- [[01-Degree-Modifiers]] - 程度修饰语
- [[search-behavior]] - 搜索行为分析

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
