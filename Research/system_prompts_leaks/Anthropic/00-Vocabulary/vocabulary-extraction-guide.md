---
title: 词汇提取指南 | Vocabulary Extraction Guide
source: system_prompts_leaks/Anthropic
source_type: Anthropic
original_language: en
date: 2026-02-06
status: annotated
importance: high
difficulty: advanced
learning_stage: application
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
  - extraction
  - methodology
  - bilingual
related_docs:
  - "[[vocabulary-index]]"
  - "[[search-behavior]]"
  - "[[thinking-mode]]"
  - "[[Cross-Document-Comparisons]]"
---

# 词汇提取指南 | Vocabulary Extraction Guide

> [!success] 核心要点 | Core Concept
> ==手动提取方法 | Manual Extraction Methodology==
>
> 系统提示词中的**微妙词汇**（Subtle Vocabulary）需要通过系统化的方法手动识别和提取。本指南提供完整的提取流程、识别规则和分类标准。
>
> **为何手动提取？| Why Manual Extraction?**
> - 自动化工具难以识别**语用微妙性**（Pragmatic Nuance）
> - 需要理解**语境依赖性**（Contextual Dependency）
> - 需要判断**跨文档相关性**（Cross-Document Relevance）

---

## 📋 提取流程 | Extraction Process

### Phase 1: 预处理 | Preprocessing

> [!info] 准备工作 | Preparation
> 在开始提取前，确保以下条件：

1. **源文件选择**: 选择完整的系统提示词文件
2. **阅读环境**: 使用支持高亮和注释的编辑器
3. **记录工具**: 准备词汇记录表格（模板见后）
4. **参考资料**: 打开已有的词汇文件作为参考

### Phase 2: 识别 | Identification

> [!abstract] 识别原则 | Identification Principles
> 按照**五类词汇**的特征进行识别：

#### 1. 程度修饰语 | Degree Modifiers

**识别特征**:
- 位于动词/形容词前
- 修饰执行强度或质量
- 通常为副词

**搜索模式**:
```
\b(appropriately|strategically|carefully|thoroughly|naturally|politely|strongly|highly)\s+\w+
```

**示例识别**:
```markdown
✅ "appropriately cite" → appropriately 是程度修饰语
✅ "strategically decide" → strategically 是程度修饰语
✅ "carefully consider" → carefully 是程度修饰语
❌ "cite correctly" → correctly 是普通副词，不够"微妙"
```

#### 2. 语气控制词 | Tone Controllers

**识别特征**:
- 位于句首或关键指令前
- 表达强制程度或优先级
- 通常为大写或强调形式

**搜索模式**:
```
\b(CRITICAL|MUST|NEVER|ALWAYS|should|must|never|always)\b
```

**示例识别**:
```markdown
✅ "CRITICAL: Claims must be in your own words" → CRITICAL 是语气控制词
✅ "MUST: Use citations appropriately" → MUST 是语气控制词
✅ "NEVER reproduce song lyrics" → NEVER 是语气控制词
❌ "You should search" → should 是普通建议，不够"关键"
```

#### 3. 边界词 | Boundary Words

**识别特征**:
- 定义操作范围或条件
- 通常为连词或限定词
- 与条件从句配合

**搜索模式**:
```
\b(unless|except|only|maximum|minimum|approximately|at most|at least)\b
```

**示例识别**:
```markdown
✅ "unless explicitly asked" → unless 是边界词
✅ "only for your reference" → only 是边界词
✅ "at most one quote" → at most 是边界词
✅ "stop after approximately 5 calls" → approximately 是边界词
```

#### 4. 微妙表达 | Nuanced Expressions

**识别特征**:
- 委婉但强硬的描述
- 通常涉及用户行为或后果
- 常用名词或动词短语

**搜索模式**:
```
(breaks continuity|forces users to|naturally|politely|substantive)
```

**示例识别**:
```markdown
✅ "breaks continuity" → 微妙表达，强调负面后果
✅ "forces users to repeat" → 微妙表达，委婉但强硬
✅ "Users naturally reference" → 自然化用户行为描述
✅ "politely inform" → 礼貌但必须执行
```

#### 5. 操作指导词 | Action Guides

**识别特征**:
- 祈使句动词
- 明确的行为指令
- 通常位于句首

**搜索模式**:
```
\b(Extract|Avoid|Prioritize|Synthesize|Acknowledge|Consider|Use|Don't|Do not)\b
```

**示例识别**:
```markdown
✅ "Extract substantive keywords" → Extract 是操作指导词
✅ "Avoid low-confidence keywords" → Avoid 是操作指导词
✅ "Prioritize current context" → Prioritize 是操作指导词
✅ "Synthesize information naturally" → Synthesize 是操作指导词
```

### Phase 3: 验证 | Verification

> [!warning] 验证检查 | Verification Checks
> 在记录词汇前，通过以下检查：

### 检查清单 | Checklist

| 检查项 | 问题 | 示例 |
|:------|:------|:------|
| **微妙性** | 这个词有特殊含义吗？ | "appropriately" vs "correctly" |
| **必要性** | 删除它会改变指令吗？ | "MUST cite" vs "cite" |
| **可替换性** | 有更好的替代词吗？ | 为何用 "forces" 而非 "makes" |
| **跨文档性** | 在其他文档中出现吗？ | 对比分析 |
| **语用功能** | 它的实际作用是什么？ | 控制强度？定义边界？ |

### Phase 4: 记录 | Recording

> [!info] 记录模板 | Recording Template
> 使用以下模板记录每个词汇：

```markdown
### 词汇: [word]

**原文引用**: "contextual example"

**分类**: [类别]

**语用功能**:
- **作用**: [what it does]
- **替代表达**: [alternatives]
- **为何选择此词**: [rationale]

**跨文档对比**:
| 文档 | 用法 | 差异 |
|------|------|------|
| doc-1 | "... | ..." |

**练习场景**:
- 场景 1: [description]
- 场景 2: [description]
```

---

## 📊 提取记录表 | Extraction Record Sheet

### 词汇记录表格模板

| 序号 | 词汇 | 中文 | 分类 | 原文引用 | 来源文件 | 频率 | 验证 |
|:----:|:-----|:-----|:-----|:---------|:---------|:-----:|:----:|
| 1 | appropriately | 适当地 | 程度修饰 | "appropriately cite" | claude-4.5 | 高 | ✅ |
| 2 | MUST | 必须 | 语气控制 | "MUST cite" | claude-4.5 | 高 | ✅ |
| 3 | unless | 除非 | 边界词 | "unless asked" | claude-4.5 | 中 | ✅ |

### 频率标记标准

- **高**: 出现在 50% 以上的系统提示词中
- **中**: 出现在 20-50% 的系统提示词中
- **低**: 出现在 <20% 的系统提示词中

---

## 🎯 提取技巧 | Extraction Tips

### 技巧 1: 语境优先 | Context First

> [!tip] 不要孤立看词汇
> 始终在**完整句子**中理解词汇：

```
❌ 孤立: "appropriately" = 适当地
✅ 语境: "appropriately cite" = 引用时需适配语境和风格
```

### 技巧 2: 对比思维 | Comparative Thinking

> [!tip] 寻找替代表达
> 询问："如果换成 X 会如何？"

```
"appropriately cite" vs "cite correctly"
→ appropriately 强调适配性
→ correctly 仅强调准确性

"forces users to" vs "makes users to"
→ forces 强调不可避免的负面后果
→ makes 是中性描述
```

### 技巧 3: 跨文档验证 | Cross-Document Verification

> [!tip] 对比不同来源
> 同一功能在不同文档中的表达：

| 功能 | Claude 4.5 | Claude 3.7 | OpenAI |
|:-----|:-----------|:-----------|:-------|
| 引用要求 | "appropriately cite" | "correctly cite" | "cite sources" |
| 强制程度 | "MUST" | "must" | "Must" |
| 用户行为 | "naturally reference" | "typically reference" | "often mention" |

### 技巧 4: 版本演进追踪 | Version Evolution Tracking

> [!tip] 注意词汇演变
> 同一词汇在不同版本中的变化：

```
Claude 3.7: "correctly cite"
Claude 4.1: "appropriately cite"
Claude 4.5: "appropriately cite" + "CRITICAL" 前缀

→ 演进趋势: 更强调适配性和关键性
```

---

## 🧪 实战演练 | Hands-On Practice

### 练习 1: 从以下段落中提取词汇

> [!question] 提取练习
> 从以下段落中识别并分类所有微妙词汇：

```
"CRITICAL: Extract substantive keywords only. Avoid generic verbs.
Prioritize specific nouns. Unless the user explicitly asks for
comprehensive results, use the minimum number of tool calls necessary.
Synthesize information naturally, and politely inform when
results are limited."
```

<details>
<summary>查看答案</summary>

**答案 | Answer**:

| 词汇 | 分类 | 原文引用 |
|:-----|:-----|:---------|
| CRITICAL | 语气控制 | "CRITICAL: Extract..." |
| substantive | 微妙表达/程度修饰 | "substantive keywords" |
| only | 边界词 | "only" |
| Avoid | 操作指导 | "Avoid generic verbs" |
| generic | 微妙表达 | "generic verbs" |
| Prioritize | 操作指导 | "Prioritize specific nouns" |
| specific | 程度修饰 | "specific nouns" |
| Unless | 边界词 | "Unless..." |
| explicitly | 程度修饰 | "explicitly asks" |
| comprehensive | 程度修饰 | "comprehensive results" |
| minimum | 边界词 | "minimum number" |
| necessary | 程度修饰 | "necessary" |
| Synthesize | 操作指导 | "Synthesize..." |
| naturally | 程度修饰 | "naturally" |
| politely | 程度修饰/微妙表达 | "politely inform" |
| limited | 微妙表达 | "results are limited" |

**总计**: 16 个微妙词汇

**分类统计**:
- 语气控制: 1 (CRITICAL)
- 程度修饰: 6 (substantive, specific, explicitly, comprehensive, necessary, naturally, politely)
- 边界词: 3 (only, Unless, minimum)
- 微妙表达: 3 (substantive, generic, limited)
- 操作指导: 3 (Extract, Avoid, Prioritize, Synthesize)

**关键洞察**: 这段简短的文字包含了所有五类词汇！
</details>

### 练习 2: 对比分析

> [!question] 对比练习
> 分析以下两个表达之间的差异：

```
版本 A: "You must search for information."
版本 B: "STRONGLY PREFER to search when uncertain."
```

<details>
<summary>查看答案</summary>

**答案 | Answer**:

| 维度 | 版本 A | 版本 B |
|:-----|:-------|:-------|
| **强制程度** | 绝对 (must) | 强烈建议 (strongly prefer) |
| **灵活性** | 无 | 有条件 (when uncertain) |
| **语气** | 命令式 | 建议式 |
| **适用场景** | 安全/法律要求 | 一般行为指导 |
| **AI 自主权** | 无 | 有判断空间 |

**关键洞察**: 版本 B 给 AI 留下了判断空间，是更现代的系统提示词风格。
</details>

### 练习 3: 创建自己的提取

> [!question] 实践练习
> 选择一个未分析的系统提示词文件，提取其中的微妙词汇。

**步骤**:
1. 选择文件（如 OpenAI/GPT-4.5.md）
2. 按照 Phase 1-4 的流程进行提取
3. 记录至少 10 个词汇
4. 与 Anthropic 的词汇进行对比

<details>
<summary>查看参考答案（OpenAI 示例）</summary>

**从 OpenAI GPT-4.5.md 提取的示例**:

| 词汇 | 分类 | 原文引用 | 对比 Anthropic |
|:-----|:-----|:---------|:---------------|
| Concise | 程度修饰 | "Be concise" | Anthropic 用 "briefly" |
| Avoid | 操作指导 | "Avoid repetition" | 相同 |
| Should | 语气控制 | "You should..." | Anthropic 用 "MUST" 更强 |
| Clear | 程度修饰 | "Clear and direct" | Anthropic 用 "thoroughly" |
| Don't | 语气控制 | "Don't make up..." | Anthropic 用 "NEVER" |

**风格差异**:
- OpenAI: 更口语化，强制程度较弱
- Anthropic: 更正式，强制程度更强
</details>

---

## 📝 常见错误 | Common Mistakes

### 错误 1: 过度提取 | Over-Extraction

> [!warning] 避免提取普通词汇

```
❌ 过度: "the", "a", "is", "of" - 这些是普通词汇
✅ 正确: "appropriately", "MUST", "unless" - 这些有特殊语用
```

**判断标准**: 询问 "这个词是否影响了 AI 的行为理解？"

### 错误 2: 忽略语境 | Ignoring Context

> [!warning] 不要脱离语境记录

```
❌ 错误: "appropriately = 适当地"
✅ 正确: "appropriately cite = 引用时需适配语境和风格"
```

### 错误 3: 分类错误 | Misclassification

> [!warning] 注意跨类别词汇

```
"politely" 既可以是:
- 程度修饰: "politely inform" (礼貌地告知)
- 微妙表达: 强调礼貌作为软化剂

→ 应该在两个类别中都记录，并注明语境差异
```

### 错误 4: 缺少验证 | Missing Verification

> [!warning] 不要记录未验证的词汇

```
❌ 错误: 看到 "must" 就记录
✅ 正确: 检查 "must" 是否为普通用法（如 "you must have"）
         还是关键指令（如 "MUST cite"）
```

---

## 🔧 工具与资源 | Tools and Resources

### 推荐工具

| 工具 | 用途 | 链接 |
|:-----|:------|:-----|
| Obsidian | 双向链接笔记 | https://obsidian.md |
| VS Code | 代码阅读和高亮 | https://code.visualstudio.com |
| Regex101 | 正则表达式测试 | https://regex101.com |

### 参考资源

- [[vocabulary-index]] - 词汇总索引
- [[Cross-Document-Comparisons]] - 跨文档对比
- [[search-behavior]] - 搜索行为分析

---

## 📊 提取统计目标 | Extraction Statistics Goals

### 目标标准

| 指标 | 目标值 | 当前值 |
|:-----|:------:|:------:|
| 总词汇数 | 50+ | 91 |
| 类别覆盖 | 5/5 | 5/5 ✅ |
| 文档覆盖 | 3+ 公司 | 3 ✅ |
| 每类词汇 | 10+ | 15-22 ✅ |
| 练习数量 | 50+ | 80+ ✅ |

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
