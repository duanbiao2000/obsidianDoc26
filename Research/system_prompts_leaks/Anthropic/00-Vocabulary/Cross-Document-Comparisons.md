---
title: "跨文档对比分析 | Cross-Document Comparisons"
source: "system_prompts_leaks"
source_type: "Multi-Company"
original_language: "en"
date: 2026-02-06
status: annotated
importance: "high"
difficulty: "expert"
learning_stage: "mastery"
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
  - cross-document
  - comparison
  - bilingual
related_docs:
  - "[[vocabulary-index]]"
  - "[[vocabulary-extraction-guide]]"
  - "[[01-Degree-Modifiers]]"
  - "[[02-Tone-Controllers]]"
---

# 跨文档对比分析 | Cross-Document Comparisons

> [!success] 核心要点 | Core Concept
> ==跨文档对比揭示设计理念差异| Cross-Document Comparison Reveals Design Philosophy Differences==
>
> 通过对比不同公司、不同版本的系统提示词，我们可以理解**设计理念的演进**和**文化差异**。这些差异反映了各公司对 AI 的不同定位和价值观。
>
> **对比维度 | Comparison Dimensions**:
>
> - **公司风格对比** | Company Style Comparison (Anthropic vs OpenAI vs Google)
> - **版本演进对比** | Version Evolution Comparison (Claude 3.7 → 4.1 → 4.5)
> - **功能模块对比** | Functional Module Comparison (Search, Memory, Copyright)

---

## 🏢 公司风格对比 | Company Style Comparison

### Anthropic vs OpenAI vs Google

> [!abstract] 核心差异 | Core Differences
> 三家公司的系统提示词反映了不同的 AI 设计理念：

| 维度 | Anthropic | OpenAI | Google |
|:-----|:----------|:-------|:-------|
| **整体风格** | 详细、温和、多层次 | 简洁、直接、人格化 | 清晰、结构化、指南式 |
| **文档长度** | 长（2000+ 行） | 中（500-800 行） | 中短（300-500 行） |
| **强制表达** | MUST/NEVER (大写强调) | Must/Don't (首字母大写) | must (全小写) |
| **语气** | 教育性、解释性 | 对话性、友好 | 指导性、功能性 |
| **重点** | 安全、版权、透明 | 用户体验、人格 | 功能准确性 |

### 词汇使用对比 | Vocabulary Usage Comparison

#### 语气控制词 | Tone Controllers

| 词汇 | Anthropic | OpenAI | Google |
|:-----|:---------:|:------:|:------:|
| MUST/NEVER | 大写，最高频 | 首字母大写 | 小写 |
| should | 中频使用 | 高频使用 | 中频使用 |
| strongly | 高频（强调建议） | 少用 | 少用 |
| can/may | 谨慎使用 | 高频使用 | 中频使用 |

> [!tip] 观察结论 | Observation
> **Anthropic**: 强调层级和强度，大写表达最高优先级
> **OpenAI**: 更平等，语气更柔和
> **Google**: 功能导向，语气最中性

#### 程度修饰语 | Degree Modifiers

| 词汇 | Anthropic | OpenAI | Google |
|:-----|:---------:|:------:|:------:|
| appropriately | 高频特色词汇 | 少用 | 少用 |
| carefully | 高频 | 中频 | 中频 |
| strategically | 高频 | 少用 | 少用 |
| naturally | 高频特色词汇 | 少用 | 少用 |

> [!tip] 观察结论 | Observation
> **Anthropic**: 更强调"适配性"和"策略性"，反映精细控制理念
> **OpenAI/Google**: 更注重"正确性"和"功能性"

#### 边界词 | Boundary Words

| 词汇 | Anthropic | OpenAI | Google |
|:-----|:---------:|:------:|:------:|
| unless | 高频 | 中频 | 中频 |
| only | 高频 | 中频 | 中频 |
| maximum/minimum | 高频 | 中频 | 高频 |
| approximately | 高频 | 少用 | 少用 |

> [!tip] 观察结论 | Observation
> **Anthropic**: 更多使用"软性边界"（approximately, unless）
> **OpenAI/Google**: 更多使用"硬性边界"（maximum, minimum）

### 设计哲学对比 | Design Philosophy Comparison

#### Anthropic: 安全与透明优先

> [!info] Anthropic 设计理念
> **核心价值观**: 安全、透明、可控
>
> **词汇特征**:
>
> - 大量使用 MUST/NEVER/CRITICAL（强调重要性）
> - 丰富的程度修饰语（appropriately, strategically, naturally）
> - 详细的微妙表达（breaks continuity, forces users）
>
> **示例**:
>
> ```markdown
> CRITICAL: Claims MUST be in your own words
> ALWAYS appropriately cite your sources
> Missing cues breaks continuity and forces users to repeat themselves
> ```
>
> **设计哲学**: 通过详细解释和层级控制，实现安全透明的 AI 行为

#### OpenAI: 用户体验与人格化优先

> [!info] OpenAI 设计理念
> **核心价值观**: 用户体验、灵活性、人格化
>
> **词汇特征**:
>
> - 更柔和的语气控制（must vs MUST）
> - 人格化表达（you, your, conversation）
> - 更多的 can/may（允许灵活性）
>
> **示例**:
>
> ```markdown
> You should be helpful and friendly
> You can use search tools when needed
> Make the user feel understood
> ```
>
> **设计哲学**: 通过人格化和灵活性，创造自然的交互体验

#### Google: 功能性与准确性优先

> [!info] Google 设计理念
> **核心价值观**: 准确性、功能性、效率
>
> **词汇特征**:
>
> - 中性语气控制（must, should）
> - 清晰的操作指令（use, include, avoid）
> - 最少的修饰语（直接明了）
>
> **示例**:
>
> ```markdown
> must use LaTeX for math
> include citations when using search results
> avoid generating harmful content
> ```
>
> **设计哲学**: 通过清晰指令和功能约束，确保准确可靠的输出

---

## 📈 版本演进对比 | Version Evolution Comparison

### Claude 3.7 → 4.1 → 4.5

> [!abstract] 演进趋势 | Evolution Trends
> Anthropic Claude 的版本演进反映了**日益精细的控制**和**更强的透明度要求**。

#### 词汇演进 | Vocabulary Evolution

| 版本 | 语气控制 | 程度修饰 | 边界词 | 微妙表达 |
|:----:|:--------:|:--------:|:------:|:--------:|
| 3.7 | must/should | correctly, properly | only, unless | typically |
| 4.1 | MUST/NEVER | carefully, appropriately | maximum, minimum | naturally |
| 4.5 | CRITICAL+MUST | strategically, thoroughly | approximately, within | politely, substantive |

> [!tip] 演进方向 | Evolution Direction
> **强制程度增强**: must → MUST → CRITICAL+MUST
> **精度提升**: correctly → appropriately → strategically
> **边界细化**: only → maximum/minimum → approximately
> **表达精细化**: typically → naturally → politely/substantive

#### 功能演进 | Functional Evolution

**Claude 3.7 Sonnet** (基础版):

```markdown
- 基础工具使用
- 简单搜索指令
- "correctly cite" 引用要求
```

**Claude 4.1 Opus** (思维模式):

```markdown
- 新增思维模式
- "carefully consider" 思考指令
- "interleaved" 思维方式
- "max_thinking_length" 参数
```

**Claude 4.5 Sonnet** (增强推理):

```markdown
- CRITICAL 前缀引入
- "strategically decide" 策略性决策
- "appropriately" 适配性强调
- "politely inform" 用户交互优化
```

> [!tip] 演进洞察 | Evolution Insight
> **从简单到复杂**: 基础指令 → 精细控制 → 策略性决策
> **从刚性到柔性**: 绝对要求 → 层级控制 → 灵活适配
> **从功能到体验**: 工具使用 → 思考质量 → 用户感受

---

## 🔍 功能模块对比 | Functional Module Comparison

### 搜索行为模块 | Search Behavior Module

#### 引用指令对比 | Citation Instruction Comparison

| 公司 | 引用要求 | 语气 | 强制程度 |
|:-----|:---------|:-----|:--------:|
| **Anthropic** | "appropriately cite" | 温和但严格 | MUST |
| **OpenAI** | "cite sources" | 直接 | must |
| **Google** | "include citations" | 功能性 | should |

> [!tip] 差异分析 | Difference Analysis
> **Anthropic**: "appropriately" = 格式 + 适配 + 风格
> **OpenAI**: "cite" = 格式正确
> **Google**: "include" = 包含即可

#### 搜索决策对比 | Search Decision Comparison

| 公司 | 决策风格 | 触发条件 | 灵活性 |
|:-----|:---------|:---------:|:------:|
| **Anthropic** | 复杂决策树 | 信息稳定性 + 复杂度 | 高 |
| **OpenAI** | 简单规则 | 用户明确请求 | 中 |
| **Google** | 功能判断 | 工具可用性 | 低 |

> [!example] Anthropic 的搜索决策树
>
> ```
> 信息稳定？→ 是 → 不搜索
>    ↓ 否
> Claude 不知道术语？→ 是 → 单次搜索
>    ↓ 否
> 复杂多方面？→ 是 → 研究型（多次搜索）
>    ↓ 否
> 回答但提议搜索
> ```

### 对话管理模块 | Conversation Management Module

#### 过去对话检索对比 | Past Conversation Retrieval Comparison

| 公司 | 工具名称 | 关键词策略 | 触发方式 |
|:-----|:---------|:-----------|:---------|
| **Anthropic** | conversation_search | substantive keywords only | naturally reference |
| **OpenAI** | memory_search | broad keywords | explicit request |
| **Google** | context_search | all terms | implicit |

> [!tip] 差异分析 | Difference Analysis
> **Anthropic**: 精确匹配 + 自然触发
> **OpenAI**: 广泛匹配 + 明确请求
> **Google**: 全面搜索 + 隐式触发

#### 记忆策略对比 | Memory Strategy Comparison

| 公司 | 记忆范围 | 记忆优先级 | 记忆透明度 |
|:-----|:---------|:-----------|:-----------:|
| **Anthropic** | 项目内 + 项目外 | 当前 > 过去 | 高 (acknowledge) |
| **OpenAI** | 全局对话 | 累计权重 | 中 (mention) |
| **Google** | 当前会话 | 无优先 | 低 (无提及) |

---

## 📊 词汇强度跨公司对比 | Cross-Company Vocabulary Intensity Comparison

### 强制程度金字塔对比 | Mandatory Pyramid Comparison

```
Anthropic:              OpenAI:                Google:
   CRITICAL                 MUST                   must
   /     \                 /     \                /    \
MUST   NEVER            must   don't           should  avoid
 |       |                |       |               |      |
strongly  should        can    should          may     can
should    may           may     optional        optional

观察: Anthropic 层级最多，强制表达最丰富
      Google 层级最少，强制表达最简化
```

### 修饰语频率对比 | Modifier Frequency Comparison

| 修饰语类型 | Anthropic | OpenAI | Google |
|:----------|:---------:|:------:|:------:|
| 程度修饰 | 高 (15+) | 中 (8) | 低 (5) |
| 语气控制 | 高 (18) | 中 (12) | 中 (10) |
| 边界词 | 高 (20) | 中 (12) | 中 (10) |
| 微妙表达 | 高 (16) | 低 (6) | 低 (4) |
| 操作指导 | 高 (22) | 中 (15) | 中 (12) |

> [!tip] 结论 | Conclusion
> **Anthropic**: 最详细的词汇使用，反映精细控制理念
> **OpenAI**: 平衡的词汇使用，注重用户体验
> **Google**: 简化的词汇使用，注重功能效率

---

## 🎯 学习应用 | Learning Applications

### 应用 1: 理解设计哲学 | Understanding Design Philosophy

> [!question] 分析练习
> 以下表达反映了哪种设计哲学？

1. "CRITICAL: NEVER reproduce song lyrics"
2. "You can search when you think it's helpful"
3. "must use LaTeX for mathematical expressions"

<details>
<summary>查看答案</summary>

**答案**:

| 表达 | 公司类型 | 设计哲学 |
|:-----|:---------|:---------|
| "CRITICAL: NEVER..." | Anthropic | 安全优先，层级控制 |
| "You can search..." | OpenAI | 用户自主，灵活性 |
| "must use LaTeX..." | Google | 功能规范，准确性 |

**关键洞察**: 词汇选择反映核心价值观
</details>

---

### 应用 2: 风格适配练习 | Style Adaptation Exercise

> [!question] 风格转换
> 将以下 Anthropic 风格的表达转换为 OpenAI 和 Google 风格：

**Anthropic**: "CRITICAL: Extract substantive keywords only, avoiding generic verbs."

<details>
<summary>查看答案</summary>

**答案**:

| 风格 | 转换后表达 |
|:-----|:----------:|
| **Anthropic** | "CRITICAL: Extract substantive keywords only, avoiding generic verbs." |
| **OpenAI** | "Focus on specific keywords and avoid generic ones." |
| **Google** | "Use specific terms for search queries." |

**转换原则**:

- Anthropic → OpenAI: 简化语气，降低强制
- Anthropic → Google: 精简表达，功能导向

</details>

---

### 应用 3: 版本演进预测 | Version Evolution Prediction

> [!question] 预测下一个版本
> 基于 Claude 3.7 → 4.1 → 4.5 的演进趋势，预测 Claude 5.0 的词汇特征：

<details>
<summary>查看答案</summary>

**预测答案**:

**Claude 5.0 可能的特征**:

1. **更精细的强度表达**
   - 新词汇: "highly prioritize", "critically consider"
   - 理由: 强度层级继续细化

2. **更多主动性词汇**
   - 新词汇: "proactively", "anticipate", "preempt"
   - 理由: 从响应式到主动式

3. **更强的透明度要求**
   - 新表达: "explicitly disclose reasoning"
   - 理由: 用户对 AI 决策过程要求更高透明度

4. **更丰富的微妙表达**
   - 新词汇: "gracefully", "tactfully", "thoughtfully"
   - 理由: 用户体验精细化

**演进方向**: 从"控制行为"到"优化体验"
</details>

---

### 应用 4: 跨公司词汇映射 | Cross-Company Vocabulary Mapping

> [!question] 词汇映射表
> 创建 Anthropic → OpenAI → Google 的词汇映射：

<details>
<summary>查看答案</summary>

**答案**:

| 功能 | Anthropic | OpenAI | Google |
|:-----|:----------|:-------|:-------|
| **最高强制** | CRITICAL + MUST | MUST | must |
| **禁止** | NEVER | do not | avoid / must not |
| **强烈建议** | strongly prefer | should | should |
| **一般建议** | should | can | may |
| **精确提取** | Extract | get | use |
| **主动避免** | Avoid | don't | avoid |
| **综合整合** | Synthesize | combine | integrate |
| **策略决策** | strategically decide | choose wisely | decide |
| **适配执行** | appropriately | correctly | properly |
| **自然流畅** | naturally | smoothly | seamlessly |

**关键洞察**: 同一功能的不同表达反映不同的设计理念
</details>

---

## 📚 总结与反思 | Summary & Reflection

> [!abstract] 核心洞察 | Key Insights
> ==跨文档对比的三个核心价值==
>
> **1. 理解设计哲学 | Understanding Design Philosophy**
>
> - Anthropic: 安全、透明、层级控制
> - OpenAI: 用户、体验、灵活性
> - Google: 功能、准确、效率
>
> **2. 预测演进趋势 | Predicting Evolution Trends**
>
> - 强制程度: 从简单到精细
> - 表达精度: 从刚性到柔性
> - 关注重点: 从功能到体验
>
> **3. 指导实践应用 | Guiding Practical Application**
>
> - 选择合适的风格适配目标用户
> - 理解词汇选择的影响
> - 设计更有效的系统提示词

> [!tip] 学习建议 | Learning Recommendations
> **如何利用跨文档对比学习？**
>
> 1. **对比分析**: 定期对比不同公司的表达
> 2. **风格适配**: 根据目标选择合适的风格
> 3. **演进跟踪**: 关注版本变化趋势
> 4. **实践应用**: 将学到的模式应用到自己的提示词设计

> [!warning] 常见错误 | Common Mistakes
> **避免以下错误**:
>
> 1. **盲目模仿**: 不理解原因直接复制
> 2. **忽略语境**: 不同语境需要不同风格
> 3. **过度复杂**: 简单场景不需要复杂表达
> 4. **文化偏见**: 不同用户群体偏好不同风格

---

## 🔗 相关链接 | Related Links

- [[vocabulary-index]] - 词汇总索引
- [[vocabulary-extraction-guide]] - 词汇提取指南
- [[01-Degree-Modifiers]] - 程度修饰语
- [[02-Tone-Controllers]] - 语气控制词
- [[03-Boundary-Words]] - 边界词
- [[04-Nuanced-Expressions]] - 微妙表达
- [[05-Action-Guides]] - 操作指导词

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
