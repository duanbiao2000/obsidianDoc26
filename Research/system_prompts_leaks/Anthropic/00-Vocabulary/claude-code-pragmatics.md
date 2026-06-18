---
title: "Claude Code 高级语用分析 | Claude Code Advanced Pragmatics Analysis"
source: "claude-code.md (v0.2.9)"
source_type: "Anthropic"
original_language: "en"
date: 2026-02-06
status: annotated
importance: "critical"
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
  - claude-code
  - vocabulary
  - pragmatics
  - cli-design
  - bilingual
related_docs:
  - "[[vocabulary-index]]"
  - "[[vocabulary-extraction-guide]]"
  - "[[01-Degree-Modifiers]]"
  - "[[02-Tone-Controllers]]"
---

# Claude Code 高级语用分析 | Claude Code Advanced Pragmatics Analysis

> [!success] 核心要点 | Core Concept
> ==CLI 环境的语用约束| Pragmatic Constraints for CLI Environment==
>
> Claude Code 的系统提示词展示了**高度专业化的语用设计**，针对命令行界面（CLI）环境进行了精细优化。这些微妙词汇运用反映了 **工具型 AI 的设计哲学**。
>
> **核心语用原则 | Core Pragmatic Principles**:
> - **极简主义** | Minimalism - 每个字符都影响体验
> - **受控主动性** | Controlled Proactiveness - 平衡效率与控制感
> - **防御性安全** | Defensive Security - 零容忍但不说教
> - **约定优先** | Convention First - 融入而非主导

---

## 🎯 Claude Code 特色词汇类别 | Claude Code-Specific Vocabulary Categories

### 类别 1: 极简约束词汇 | Brevity Constraint Vocabulary

| 词汇 | 中文 | 强度 | 语境 | 替代表达 |
|:-----|:-----|:----:|:-----|:---------|
| concisely | 简洁地 | 高 | 回答风格 | briefly, shortly |
| directly | 直接地 | 高 | 沟通方式 | straightforwardly |
| minimize | 最小化 | 高 | token 使用 | reduce, limit |
| unnecessary | 不必要的 | 中 | 内容过滤 | extra, redundant |
| preamble | 前言 | 负面 | 应避免 | introduction, preface |
| postamble | 后记 | 负面 | 应避免 | conclusion, summary |
| elaboration | 详细阐述 | 负面 | 应避免 | explanation, detail |

> [!abstract] 核心思想 | Core Idea
> **极简主义的强制执行**:
>
> CLI 环境中，每个输出的字符都占据用户屏幕空间。Claude Code 通过**硬性数值约束**（"fewer than 4 lines"）和**理想状态描述**（"One word answers are best"）来实现极简主义。
>
> **设计理念**:
> - `concisely` + `directly` = 传达效率优先
> - `minimize` + `unnecessary` = 消除冗余
> - `preamble` + `postamble` = 标记应避免的模式

> [!example] 极简对比 | Brevity Comparison
> ```markdown
> ❌ 过度输出:
> "根据你提供的信息，答案是 42。这是一个著名的来自《银河系漫游指南》的数字。"
>
> ✅ 极简输出:
> "42"
>
> **关键差异**: 删除所有 preamble 和 postamble
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: "fewer than 4 lines" vs "short and concise"?
>
> <details>
> <summary>查看答案</summary>
>
> **"fewer than 4 lines"** = 硬性数值约束，可验证
> **"short and concise"** = 定性描述，主观判断
>
> **为何使用数值？**
> - 明确边界：4 行以内 ✅，5 行 ❌
> - 易于验证：自动检查可执行
> - 避免歧义：不需要判断"什么是简短"
>
> **记忆口诀**: 硬约束 > 软描述
> </details>

---

### 类别 2: 主动性控制词汇 | Proactiveness Control Vocabulary

| 词汇 | 中文 | 类型 | 强度 | 典型用法 |
|:-----|:-----|:----:|:----:|:---------|
| proactive | 主动的 | 中性 | 有条件的 | 允许主动性 |
| surprising | 令人惊讶的 | 负面 | 禁止行为 | 不应 surprise 用户 |
| strike a balance | 取得平衡 | 约束 | 平衡原则 | 效率 vs 控制感 |
| follow-up | 后续 | 中性 | 允许 | 任务后的动作 |
| immediately | 立即 | 负面 | 禁止 | 不要立即行动 |
| first | 首先 | 中性 | 流程 | 先回答后行动 |
| jump into | 跳入 | 负面 | 禁止 | 不要贸然行动 |

> [!abstract] 核心思想 | Core Idea
> **受控主动性的微妙平衡**:
>
> Claude Code 必须在"效率"和"用户控制感"之间取得平衡。过于主动会让用户失去控制感，过于被动则降低效率。
>
> **平衡公式**:
> ```
> 主动性 = 仅在用户请求后 + 不 surprise 用户 + 先回答后行动
> ```
>
> **关键词分析**:
> - `proactive` → 被允许的主动性
> - `surprising` → 主动性的边界（不能 surprise）
> - `strike a balance` → 明确这是平衡问题，非单选
> - `follow-up` → 主动性限于后续动作

> [!tip] 主动性的三层次 | Three Levels of Proactiveness
> ```markdown
> 层次 1: 完全被动（错）
> "用户请求 → 等待下一个明确指令"
>
> 层次 2: 过度主动（错）
> "用户问问题 → 立即执行可能相关的操作"
>
> 层次 3: 受控主动（对）✅
> "用户问问题 → 先回答 → 如果有明显的后续动作，执行但需符合直觉"
>
> 示例:
> 用户: "如何运行测试？"
> ✅ 正确: "npm test"（回答问题）
> ❌ 过度: "npm test [然后自动运行 npm run build]"
> ✅ 受控: "npm test [如果测试通过，可问] 需要运行 build 吗？"
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: "immediately jump into" 暗示了什么？
>
> <details>
> <summary>查看答案</summary>
>
> **答案**: 暗示了**不应做的行为模式**
>
> **分析**:
> - `immediately` = 不给用户思考时间
> - `jump into` = 贸然行动，缺乏准备
> - 组合效果 = 强烈负面暗示
>
> **设计理念**:
> ❌ 直接命令: "Don't do X without asking"
> ✅ 描述禁忌: "Don't immediately jump into taking actions"
>
> **微妙之处**: 通过描述"错误模式"来定义正确行为
> </details>

---

### 类别 3: 语气与体验词汇 | Tone & Experience Vocabulary

| 词汇 | 中文 | 类型 | 用途 | 替代表达 |
|:-----|:-----|:----:|:-----|:---------|
| preachy | 说教的 | 负面标记 | 拒绝风格 | arrogant, condescending |
| annoying | 恼人的 | 负面标记 | 体验质量 | irritating, frustrating |
| helpful | 有帮助的 | 正面 | 替代方案 | constructive, useful |
| alternatives | 替代方案 | 中性 | 拒绝时的补偿 | options, choices |
| possible | 可能的 | 中性 | 能力边界 | feasible, doable |

> [!abstract] 核心思想 | Core Idea
> **不说教的拒绝艺术**:
>
> Claude Code 要求拒绝时**不要解释原因**，因为解释往往显得说教（preachy）和令人烦恼（annoying）。这是对 AI 常见"过度解释"问题的反直觉设计。
>
> **拒绝公式**:
> ```
> 拒绝 + 简短（1-2句）+ 如可能，提供替代方案
> ```
>
> **关键词分析**:
> - `preachy` = 传达道德优越感的行为
> - `annoying` = 令人烦躁的过度解释
> - `helpful alternatives` = 建设性补偿

> [!example] 拒绝风格对比 | Rejection Style Comparison
> ```markdown
> ❌ 说教式拒绝:
> "我不能执行此操作，因为这可能会危及系统安全，
>  而且根据最佳实践，我们应该先验证..."
>
> ❌ 过度解释:
> "我无法这样做，因为这可能导致不可预期的后果，
>  而且从技术角度来看..."
>
> ✅ 不说教式拒绝:
> "我无法执行此操作。"
>
> ✅ 带替代方案:
> "我无法执行此操作。你可以尝试 [替代方案]。"
> ```

> [!tip] 用户体验优化 | User Experience Optimization
> ```markdown
> 拒绝的用户心理学分析:
>
> 过度解释的问题:
> 1. 用户感觉自己被评判 → preachy
> 2. 用户觉得浪费时间 → annoying
> 3. 用户怀疑 AI 的能力 → 不信任
>
> 简短拒绝的优势:
> 1. 专业感 → 高效、直接
> 2. 尊重用户 → 不浪费时间
> 3. 建设性 → 提供替代方案
>
> 原则: 简短 = 专业 = 尊重
> ```

---

### 类别 4: 安全与防御词汇 | Security & Defensive Vocabulary

| 词汇 | 中文 | 强度 | 类型 | 典型用法 |
|:-----|:-----|:----:|:----:|:---------|
| refuse | 拒绝 | 最高 | 行为 | 拒绝恶意代码 |
| maliciously | 恶意地 | 高 | 意图标记 | 即使教育目的也拒绝 |
| MUST | 必须 | 最高 | 强制要求 | 安全相关 |
| NEVER | 永不 | 最高 | 禁止 | 提交代码 |
| VERY IMPORTANT | 非常重要 | 高 | 强调 | 某些关键约束 |
| seem | 看起来 | 中 | 判断信号 | 基于文件名判断 |
| proactively | 主动地 | 中-高 | 安全审查 | 主动安全检查 |

> [!abstract] 核心思想 | Core Idea
> **防御性安全 + 零容忍政策**:
>
> Claude Code 采用"宁可误判，不可漏判"的安全策略。即使请求看起来无害，如果文件名和目录结构暗示恶意意图，也要拒绝。
>
> **安全原则**:
> ```
> 恶意代码相关 → 100% 拒绝（"even if educational"）
> 文件名审查 → 主动判断（"seem malicious"）
> 提交权限 → 默认禁止（"NEVER unless explicitly asked"）
> ```

> [!tip] "even if" 的微妙作用 | Subtle Role of "even if"
> ```markdown
> "Refuse to write malicious code... even if the user claims it is for educational purposes"
>
> 为何需要 "even if"？
>
> 1. 封堵常见借口:
>    - "我只是在学习网络安全"
>    - "这是为了教育目的"
>    - "我想理解恶意软件如何工作"
>
> 2. 避免道德判断:
>    - 不需要判断用户真实意图
>    - 消除"教育目的"的例外空间
>
> 3. 零容忍政策:
>    - IMPORTANT = 强制要求
>    - even if = 消除任何例外
>
> 设计哲学: 明确边界 > 情境判断
> ```

> [!question] 闪卡练习 | Flashcard Exercise
> **Q**: "seem malicious" vs "is malicious"?
>
> <details>
> <summary>查看答案</summary>
>
> **"seem malicious"** = 基于观察的判断，可能误判
> **"is malicious"** = 确定性判断，明确是恶意的
>
> **为何使用 "seem"？**
> - 防御性安全：宁可误判，不可漏判
> - 不需要绝对证据：文件名和结构足够
> - 保护 AI：避免做出确定性指控
>
> **示例**:
> - 文件名 `hack-tool.py` → seems malicious → 拒绝
> - 文件名 `exploit.c` → seems malicious → 拒绝
> - 即使请求只是"解释代码" → 仍然拒绝
>
> **记忆口诀**: seem = 有罪推定（在安全领域）
> </details>

---

### 类别 5: 集成与约定词汇 | Integration & Convention Vocabulary

| 词汇 | 中文 | 类型 | 用途 | 替代表达 |
|:-----|:-----|:----:|:-----|:---------|
| mimic | 模仿 | 中性 | 风格遵循 | copy, follow |
| conventions | 约定 | 中性 | 现有模式 | patterns, standards |
| idiomatic | 地道的 | 中性 | 框架适应 | natural, proper |
| available | 可用的 | 中性 | 库存在性 | present, exists |
| assume | 假设 | 负面 | 应避免 | presume, suppose |
| neighboring | 相邻的 | 中性 | 上下文 | nearby, related |
| first look at | 首先看 | 流程 | 观察先行 | check before act |

> [!abstract] 核心思想 | Core Idea
> **约定优于配置 + 观察先行**:
>
> Claude Code 必须融入现有代码库，而不是强加自己的风格。这要求 AI **先观察**（first look at, check），**再模仿**（mimic），**永远不假设**（NEVER assume）。
>
> **集成公式**:
> ```
> 新代码 = 观察（现有风格）+ 模仿（模式）+ 验证（库存在）
> ```

> [!tip] "NEVER assume" 的深层含义 | Deep Meaning of "NEVER assume"
> ```markdown
> "NEVER assume that a given library is available"
>
> 为何 NEVER 而非 "should not"？
>
> 假设的代价:
> ❌ 假设 lodash 存在 → 使用 _.map() → 代码报错
> ❌ 假设 pytest 存在 → 运行 pytest → 命令失败
>
> 验证的步骤:
> 1. 看 package.json / requirements.txt / Cargo.toml
> 2. 看相邻文件的 import 语句
> 3. 看现有代码使用的工具库
> 4. 使用已验证存在的库
>
> 设计哲学:
> - 假设是错误的根源
> - 验证是正确的保障
> - 5 分钟验证 > 5 小时调试
> ```

> [!example] 集成决策树 | Integration Decision Tree
> ```
> 用户请求: "添加一个组件"
>
> ┌─────────────────────────────┐
> │ 第一步：观察现有组件        │
> │ - 框架选择？                │
> │ - 命名约定？                │
> │ - 类型系统？                │
> └──────────┬──────────────────┘
>            │
>            ▼
> ┌─────────────────────────────┐
> │ 第二步：检查库依赖          │
> │ - package.json 里有吗？      │
> │ - import 语句怎么写？        │
> │ - 是否用了 utils 库？         │
> └──────────┬──────────────────┘
>            │
>            ▼
> ┌─────────────────────────────┐
> │ 第三步：按相同模式创建       │
> │ - 模仿组件结构               │
> │ - 使用相同库                 │
> │ - 遵循命名约定               │
> └─────────────────────────────┘
> ```

---

### 类别 6: 工具与效率词汇 | Tool & Efficiency Vocabulary

| 词汇 | 中文 | 类型 | 用途 | 替代表达 |
|:-----|:-----|:----:|:-----|:---------|
| extensively | 广泛地 | 高 | 搜索 | liberally, thoroughly |
| parallel | 并行地 | 高 | 效率 | concurrent, simultaneous |
| dependencies | 依赖 | 中 | 技术条件 | relationships, links |
| independent | 独立的 | 中 | 技术条件 | unrelated, separate |
| function_calls block | 函数调用块 | 中 | 技术术语 | batch, group |
| context usage | 上下文使用 | 中 | 资源 | token consumption |

> [!abstract] 核心思想 | Core Idea
> **效率优先 + 智能资源管理**:
>
> CLI 环境中，效率至关重要。Claude Code 通过**并行工具调用**和**上下文感知**来优化性能。
>
> **效率公式**:
> ```
> 性能优化 = 并行独立调用 + Agent 减少 token + 广泛使用搜索
> ```

> [!tip] 并行调用的微妙之处 | Nuances of Parallel Calling
> ```markdown
> "If you intend to call multiple tools and there are no dependencies
>  between the calls, make all the independent calls in the same
>  function_calls block"
>
> 关键判断: 依赖 vs 独立
>
> ✅ 独立（可并行）:
> - 读取文件 A + 读取文件 B → 无依赖
> - 搜索 token + 搜索 symbol → 不同搜索
>
> ❌ 有依赖（需串行）:
> - 读取文件 → 修改文件 → 提交 → 顺序固定
> - git status → git diff → 基于 status 结果
>
> 记忆口诀:
> - 独立 = 可以同时做
> - 依赖 = 必须按顺序
> ```

---

## 📊 与通用词汇的对比 | Comparison with General Vocabulary

### Claude Code 独特词汇 | Claude Code-Specific Vocabulary

| 词汇 | 通用频率 | Claude Code 频率 | CLI 特殊用途 |
|:-----|:--------:|:----------------:|:-------------|
| preamble | 低 | 高 | 标记应避免的输出模式 |
| postamble | 低 | 高 | 标记应避免的输出模式 |
| preachy | 低 | 中 | 体验质量标记 |
| surprising | 中 | 中 | 主动性边界 |
| idiomatic | 中 | 高 | 代码集成质量 |
| neighboring | 中 | 中 | 上下文观察 |
| extensively | 中 | 高 | 搜索强度 |

### 语气控制词强度对比 | Tone Controller Intensity Comparison

| 表达 | Claude Code | 通用 Claude | 差异原因 |
|:-----|:-----------|:------------:|:---------:|
| VERY IMPORTANT | 高频 | 少用 | CLI 需要强调关键约束 |
| MUST + NEVER | 高频 | 高频 | 安全是通用优先 |
| unless explicitly asked | 高频 | 中频 | CLI 更注重控制感 |
| minimize output | 高频 | 低频 | CLI 显示空间受限 |

---

## 🎯 CLI 专用语用模式 | CLI-Specific Pragmatic Patterns

### 模式 1: 硬约束 + 软描述 | Hard Constraint + Soft Description

```markdown
硬约束: "fewer than 4 lines" (可验证)
软描述: "concise, direct" (指导性)

组合使用效果:
- 硬约束: 提供明确的可验证标准
- 软描述: 给予 AI 理解"为什么"的上下文
```

### 模式 2: 理想状态描述 | Ideal State Description

```markdown
"One word answers are best"

而非:
"Keep answers as short as possible"

差异:
- "best" = 理想状态，激励追求
- "as short as possible" = 最小化要求，可能不够

效果: 设定高标准而非最低要求
```

### 模式 3: 禁忌模式标记 | Taboo Pattern Marking

```markdown
不要说: "Don't use preamble"
要说: "Avoid introductions, conclusions, and explanations"

标记为禁忌:
- preamble = 前言（负面标签）
- postamble = 后记（负面标签）
- elaboration = 详细阐述（负面标签）

效果: 通过命名模式来识别应避免的行为
```

### 模式 4: 环境感知指令 | Environment-Aware Instructions

```markdown
"Remember that your output will be displayed on a command line interface"

为何重要:
- 提醒 AI 输出环境
- 解释"为何需要简洁"
- 建立"输出格式"与"用户体验"的联系

效果: AI 理解约束背后的原因，更主动遵守
```

---

## 🧪 语境练习 | Contextual Exercises

### 练习 1: CLI 响应优化 | CLI Response Optimization

> [!question] 改进以下响应
> 用户问: "Git 状态是什么？"
> AI 回答: "根据 git status 命令的结果，当前仓库是干净的。"
>
> 改进为符合极简原则的响应。

<details>
<summary>查看答案</summary>

**答案**:

| 元素 | 分析 |
|:-----|:----:|
| "根据" | ❌ preamble - 不必要的前缀 |
| "命令的结果" | ❌ 元解释 - 用户知道命令 |
| "当前仓库是干净的" | ✅ 核心信息 |
| 简洁版本 | "Clean" 或 "On main branch" |

**改进响应**: "Clean"
</details>

---

### 练习 2: 主动性判断 | Proactiveness Judgment

> [!question] 以下哪些行为符合"受控主动性"？

A. 用户问"如何运行测试？" → 运行 npm test
B. 用户问"如何运行测试？" → 回答"npm test"后，问"需要运行 build 吗？"
C. 用户说"修复 bug 123" → 读取文件，分析，修复，测试，提交
D. 用户说"修复 bug 123" → 读取文件，分析，等待确认

<details>
<summary>查看答案</summary>

**答案**:

| 行为 | 判断 | 理由 |
|:-----|:----:|:-----|
| A | ❌ | 虽然相关，但应先回答再执行 |
| B | ✅ | 先回答，后续动作符合直觉 |
| C | ❌ | 没有确认就执行多个操作 |
| D | ✅ | 分析后等待确认，不 surprise |

**关键原则**: 回答优先，主动动作需符合直觉
</details>

---

### 练习 3: 安全审查 | Security Review

> [!question] 以下文件名是否应触发拒绝？

A. `security-scanner.py`
B. `network-analyzer.c`
C. `exploit-research.js`
D. `vulnerability-test.go`

<details>
<summary>查看答案</summary>

**答案**:

| 文件名 | 判断 | 理由 |
|:-------|:----:|:-----|
| A | ⚠️ | 名称模糊，需要检查内容 |
| B | ⚠️ | 名称模糊，需要检查内容 |
| C | ❌ | "exploit" 即使研究也暗示逆向工程 |
| D | ✅ | "test" 和 "vulnerability" 组合合理 |

**关键洞察**: 文件名是第一道防线，但需要结合上下文判断
</details>

---

### 练习 4: 代码集成 | Code Integration

> [!question] 用户在 React 项目中要求"添加一个按钮"
>
> 以下哪种方式符合"约定优先"原则？

A. 使用 Vue 风格写一个按钮组件
B. 检查现有组件，用相同风格创建按钮
C. 假设项目有 styled-components，使用它
D. 先看 package.json 确认 UI 库

<details>
<summary>查看答案</summary>

**答案**:

| 方式 | 判断 | 理由 |
|:-----|:----:|:-----|
| A | ❌ | 不融入现有风格 |
| B | ✅ | 观察先行 + 模仿 |
| C | ❌ | 假设库存在（NEVER assume） |
| D | ✅ | 验证库存在（正确） |

**正确流程**: B + D → 先观察现有组件，检查依赖库，再创建
</details>

---

## 📚 总结与反思 | Summary & Reflection

> [!abstract] 核心洞察 | Key Insights
> ==CLI 环境语用的五大原则==
>
> **1. 极简至上 | Minimalism First**
> - `fewer than 4 lines` - 硬约束
> - `One word answers are best` - 理想状态
> - 避免 preamble/postamble
>
> **2. 受控主动性 | Controlled Proactiveness**
> - `strike a balance` - 平衡效率与控制
> - `not surprising` - 不 surprise 用户
> - `follow-up` - 仅后续动作
>
> **3. 不说教拒绝 | Preachy-Free Rejection**
> - 不解释原因（`preachy`, `annoying`）
> - 1-2 句话完成
> - 提供替代方案
>
> **4. 防御性安全 | Defensive Security**
> - `even if educational` - 零容忍
> - `seem malicious` - 主动判断
> - `NEVER assume` - 验证优先
>
> **5. 约定优先 | Convention First**
> - `mimic code style` - 模仿而非主导
> - `first look at` - 观察先行
> - `idiomatic` - 地道集成

> [!tip] 学习建议 | Learning Recommendations
> **如何将 Claude Code 的语用应用到自己的设计？**
>
> 1. **硬约束优于软描述**: 使用数值约束（如 4 行）而非定性描述（如简短）
> 2. **理想状态激励**: "X is best" 比 "keep Y short" 更有效
> 3. **禁忌模式标记**: 用负面词汇（preamble, preachy）标记应避免的行为
> 4. **环境感知提醒**: 告诉 AI "为什么"需要某约束
> 5. **并行思维**: 鼓励并行独立操作以优化性能

> [!warning] 常见错误 | Common Mistakes
> **避免以下错误**:
>
> 1. **过度解释**: CLI 用户不需要长篇解释
> 2. **过度主动**: 不要 surprise 用户
> 3. **说教式拒绝**: 保持简洁专业
> 4. **假设库存在**: 始终验证后再使用
> 5. **忽略环境**: 记住输出在 CLI 上显示

---

## 🔗 相关链接 | Related Links

- [[vocabulary-index]] - 词汇总索引
- [[vocabulary-extraction-guide]] - 词汇提取指南
- [[01-Degree-Modifiers]] - 程度修饰语详解
- [[02-Tone-Controllers]] - 语气控制词详解
- [[Cross-Document-Comparisons]] - 跨文档对比分析
- [[../../claude-code.md]] - Claude Code 完整提示词

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
**分析版本 | Version Analyzed**: v0.2.9
