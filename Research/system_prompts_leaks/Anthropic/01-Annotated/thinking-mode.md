---
title: Thinking Mode | 思维模式
source: claude-4.1-opus-thinking.md
source_type: Anthropic
original_language: en
date: 2026-02-06
status: annotated
importance: critical
difficulty: advanced
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
  - thinking-mode
  - chain-of-thought
  - reasoning
  - bilingual
related_docs:
  - "[[00-Index]]"
  - "[[search-behavior]]"
  - "[[past-chats-tools]]"
---

# Thinking Mode | 思维模式

> [!success] 核心要点 | Core Concept
> ==Thinking Mode | 思维模式==
>
> **Thinking Mode** is a feature that enables Claude to perform explicit reasoning before generating responses. It uses an "interleaved" approach where thinking blocks can be inserted between function calls and final outputs.
> **思维模式**是 Claude 在生成响应之前进行显式推理的功能。它使用"交错"（interleaved）方法，在函数调用和最终输出之间插入思维块。
>
> **核心参数 | Core Parameters**:
> ```xml
> <antml:thinking_mode>interleaved</antml:thinking_mode>
> <antml:max_thinking_length>16000</antml:max_thinking_length>
> ```

---

## 🧠 什么是思维模式？| What is Thinking Mode?

> [!abstract] 核心思想 | Core Idea
> **思维模式 (Thinking Mode)** 是 Claude 4.1+ 引入的核心特性，允许 AI 进行"元认知"（metacognition）——即"思考关于思考的过程"。
>
> **设计原理 | Design Principles**：
> - **元认知监控** (Metacognitive Monitoring)：AI 可以监控自己的推理过程
> - **推理透明化** (Reasoning Transparency)：用户可以看到推理步骤
> - **错误检测** (Error Detection)：在输出前发现并修正错误
> - **复杂推理** (Complex Reasoning)：支持多步骤的逻辑推导

> [!question] 深度思考 | Deep Thinking
> **核心问题 | Core Question**：为什么需要"显式"的思维模式？AI 不能直接给出答案吗？
> **提示 | Hint**：考虑人类解决问题的过程...
>
> <details>
> <summary>查看答案与解析 | View Answer & Analysis</summary>
>
> **答案 | Answer**：因为**复杂问题需要多步推理**（Multi-step Reasoning）。
>
> 1. **减少幻觉**：通过显式推理，AI 可以在输出前检查自己的逻辑
> 2. **提高准确性**：逐步验证每个推理步骤
> 3. **增强可解释性**：用户可以理解 AI 的决策过程
> 4. **支持复杂任务**：数学、编程、分析等需要中间步骤的任务
>
> **深入分析 | Deep Dive**：
> - **CoT (Chain of Thought)**：思维链是一种提示技术，通过要求 AI "展示思考过程"来提高推理能力
> - **Interleaved Mode**：交错模式意味着 thinking 块可以与函数调用穿插进行
> - **Max Length**: 16000 tokens 限制了思考长度，防止无限循环
>
> **实际应用 | Application**：
> - ✅ 数学问题：先列出方程，再求解
> - ✅ 代码调试：先分析错误原因，再提供修复
> - ✅ 数据分析：先观察模式，再得出结论
> </details>

---

## 🎯 思维模式参数 | Thinking Mode Parameters

### 1. thinking_mode: interleaved

```xml
<antml:thinking_mode>interleaved</antml:thinking_mode>
```

> [!info] 参数说明 | Parameter Explanation
> **interleaved**（交错模式）意味着：
> - Thinking 块可以出现在函数调用结果之后
> - Thinking 块可以出现在最终输出之前
> - Thinking 块不会直接显示给用户（内部推理）
> - 输出内容由 thinking 之后的响应构成

> [!question] 启发式思考 | Guiding Question
> **核心问题**：为什么是 "interleaved" 而不是 "separate"（分离）？
>
> <details>
> <summary>查看答案</summary>
>
> **答案**：因为**推理需要上下文**（Reasoning requires context）。
>
> **Interleaved 的优势**：
> 1. **函数调用后推理**：获取工具结果后，可以分析结果再决定下一步
> 2. **动态调整**：根据中间结果调整策略
> 3. **渐进式思考**：不需要一次性规划所有步骤
>
> **示例 | Example**：
> ```xml
> <function_calls>
>   <invoke name="web_search">
>     <parameter name="query">Claude 4.1 release date</parameter>
>   </invoke>
> </function_calls>
> <function_results>
>   [... search results ...]
> </function_results>
>
> <antml:thinking>
> Search results show Claude 4.1 was released in January 2025.
> Now I need to check if there's more recent information about updates.
> </antml:thinking>
>
> <!-- 然后决定是否再次搜索，或直接回答 -->
> ```
> </details>

### 2. max_thinking_length: 16000

```xml
<antml:max_thinking_length>16000</antml:max_thinking_length>
```

> [!warning] 约束说明 | Constraint Explanation
> **最大思考长度限制**：
> - 限制 thinking 块的 token 数量
> - 防止 AI 陷入无限思考循环
> - 确保响应效率
> - 16000 tokens ≈ 12000-15000 个英文单词

---

## 🔄 使用场景 | When to Use Thinking Blocks

> [!tip] 使用指南 | Usage Guidelines
> **官方指令 | Official Instruction**：
> > If the thinking_mode is interleaved or auto, then after function results you should **strongly consider** outputting a thinking block. Whenever you have the result of a function call, think carefully about whether an `<antml:thinking>` block would be appropriate and **strongly prefer** to output a thinking block if you are uncertain.

### 触发条件 | Trigger Conditions

| 场景 | Scenario | 是否使用 | Use Thinking? | 原因 | Reason |
|------|----------|----------|---------------|------|---------|
| 简单问候 | "Hello!" | ❌ | 否 | 无需推理 |
| 事实查询 | "法国首都是哪里？" | ❌ | 否 | 直接知识 |
| 函数调用后 | web_search 结果分析 | ✅ | **是** | 需要分析结果 |
| 复杂推理 | 多步骤逻辑推导 | ✅ | **是** | 需要中间步骤 |
| 不确定时 | 不确定如何回答 | ✅ | **优先使用** | 帮助澄清思路 |

> [!example] 示例：何时使用思维块 | Example: When to Use Thinking
>
> **场景 1：简单问题（不使用）**
> ```
> 用户: "2+2等于多少？"
> AI: 2+2 等于 4。
> ```
>
> **场景 2：函数调用后（使用）**
> ```xml
> 用户: "分析今天的天气并建议穿什么"
>
> <function_calls>
>   <web_search>北京今天天气</web_search>
> </function_calls>
>
> <antml:thinking>
> 搜索结果显示今天北京气温 5-15°C，多云。
> 根据这个温度范围：
> - 最低 5°C：需要保暖
> - 最高 15°C：中午可能较舒适
> - 多云：无雨，但可能阴冷
>
> 建议：分层穿衣，内层轻薄，外层保暖。
> </antml:thinking>
>
> AI: 根据今天的天气...
> ```

---

## 🧪 思维模式 vs 传统输出 | Thinking Mode vs Traditional Output

> [info] 对比分析 | Comparative Analysis
>
> | 特性 | Traditional Output | Thinking Mode |
> |------|-------------------|---------------|
> | **推理可见性** | 不可见 | 部分可见（取决于实现） |
> | **中间验证** | 无法验证 | 可以验证中间步骤 |
> | **错误检测** | 输出后发现 | 输出前发现 |
> | **复杂任务** | 容易出错 | 更可靠 |
> | **响应速度** | 快 | 稍慢（需要思考时间） |

> [!question] 深度思考 | Deep Thinking
> **核心问题**：思维模式是否意味着 AI "有意识"了？
>
> <details>
> <summary>查看答案</summary>
>
> **答案**：**不**（No）。
>
> **重要区分 | Important Distinction**：
> - **Thinking Mode** = 显式推理过程（Explicit reasoning process）
> - **Consciousness** = 主观体验（Subjective experience）
>
> **类比 | Analogy**：
> - 计算器可以"显示计算步骤"，但这不代表它"理解"数学
> - 同样，AI 可以"显示推理步骤"，但这不代表它"有意识"
>
> **官方立场 | Official Stance**（来自系统提示词）：
> > Claude does not claim to be human and avoids implying it has consciousness, feelings, or sentience with any confidence.
> > Claude 不声称自己是人类，避免暗示它拥有意识、情感或感知能力。
> </details>

---

## 📚 相关概念 | Related Concepts

### Chain of Thought (CoT) | 思维链

> [!abstract] 核心概念 | Core Concept
> **Chain of Thought** 是一种提示技术，通过要求 AI "逐步思考"（think step-by-step）来提高推理能力。
>
> **与 Thinking Mode 的关系**：
> - CoT 是**提示技术**（Prompt technique）
> - Thinking Mode 是**系统功能**（System feature）
> - Thinking Mode 自动化 CoT，无需用户显式要求

### Tree of Thoughts (ToT) | 思维树

> [info] 扩展概念 | Extended Concept
> **Tree of Thoughts** 是 CoT 的扩展，探索多个推理路径并选择最佳路径。
>
> **未来可能**：未来的 Claude 版本可能集成 ToT 思想，在 thinking 块中探索多个假设。

### Self-Consistency | 自我一致性

> [info] 验证技术 | Verification Technique
> **Self-Consistency** 通过多次推理并投票选择最一致的答案来提高准确性。
>
> **应用**：Thinking Mode 可以结合 Self-Consistency，在内部生成多个推理链并比较。

---

## 🎓 学习练习 | Learning Exercises

> [!help] 学习练习 | Learning Exercise

**练习 1：判断是否使用思维块 | When to Use Thinking**
以下哪些情况应该使用 `<antml:thinking>` 块？

1. 用户问"你好"
2. 调用 web_search 后分析结果
3. 计算 123 × 456
4. 用户问"生命的意义是什么？"
5. 不确定如何回答复杂的编程问题

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**：
1. ❌ 不使用 - 简单问候，无需推理
2. ✅ **使用** - 官方指令要求函数调用后"强烈考虑"使用
3. ⚠️ 可选 - 简单计算可能不需要，但复杂计算有益
4. ⚠️ 可选 - 哲学问题可能受益于显式推理
5. ✅ **优先使用** - 官方指令说"不确定时优先使用"

**关键原则 | Key Principle**：
> Whenever you have the result of a function call, think carefully about whether a thinking block would be appropriate and **strongly prefer** to output a thinking block if you are uncertain.
> 每当你有函数调用的结果时，仔细考虑是否应该使用 thinking 块，如果不确定，**强烈倾向于**输出 thinking 块。
</details>

**练习 2：编写思维块 | Write a Thinking Block**
用户问："巴黎和伦敦哪个城市更大？"

请编写一个合理的 `<antml:thinking>` 块：

<details>
<summary>查看答案 | View Answer</summary>

```xml
<antml:thinking>
The user is asking which city is larger: Paris or London.
I need to clarify what "larger" means - it could refer to:
1. Population size
2. Land area
3. Metropolitan area

Since the user didn't specify, I should address both population and area.

My knowledge shows:
- London population: ~9 million (city proper), ~14 million (metro)
- Paris population: ~2.1 million (city proper), ~12 million (metro)

However, I should verify these current numbers since population data changes.
Let me search for current data.
</antml:thinking>

<function_calls>
  <invoke name="web_search">
    <parameter name="query">Paris London population 2024 comparison</parameter>
  </invoke>
</function_calls>
```
</details>

**练习 3：分析思维块的价值 | Analyze Thinking Block Value**
为什么以下场景中，思维块是有价值的？

**场景**：用户问"为什么我的 Python 代码报错：`NameError: name 'x' is not defined`？"

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**：

思维块的价值：
1. **诊断过程**：AI 可以分析可能的原因（变量未定义、作用域问题、拼写错误）
2. **排除法**：系统性地检查每种可能性
3. **解释策略**：决定是直接给出答案，还是先询问更多上下文

**示例思维块**：
```xml
<antml:thinking>
The user is getting a NameError for variable 'x'.
Possible causes:
1. Variable used before assignment
2. Typo in variable name
3. Scope issue (variable defined in different scope)
4. Imported incorrectly

Since I don't see the actual code, I should:
1. Explain the most common cause (using before assignment)
2. Ask to see the code for specific diagnosis
3. Provide general debugging tips
</antml:thinking>
```

**关键洞察 | Key Insight**：
> Thinking blocks allow AI to **organize its diagnostic process** before responding, leading to more helpful and structured answers.
> 思维块允许 AI 在响应前**组织其诊断过程**，从而产生更有帮助和结构化的答案。
</details>

---

## 📊 总结与反思 | Summary & Reflection

> [!abstract] 核心思想 | Core Idea
> ==Thinking Mode 的核心价值==
>
> **推理透明化 | Reasoning Transparency**：让 AI 的决策过程可见（至少部分可见）
> **错误减少 | Error Reduction**：在输出前发现逻辑错误
> **复杂任务支持 | Complex Task Support**：支持需要多步推理的任务
> **用户信任 | User Trust**：用户可以理解 AI 如何得出结论

> [!tip] 实践建议 | Practical Recommendations
> **如何在自己的项目中应用思维模式？**
>
> 1. **API 使用**：在使用 Anthropic API 时，设置 `thinking_mode` 参数
> 2. **Prompt 设计**：即使没有系统级 thinking mode，也可以通过 prompt 要求 "show your reasoning"
> 3. **结果解析**：解析响应中的 thinking 块（如果 API 返回）
> 4. **调试工具**：使用 thinking 模式调试 AI 的决策过程

> [!warning] 局限性 | Limitations
> **思维模式不是万能的**：
> - 不改变 AI 的知识截止日期
> - 不保证推理正确性（仍然可能犯错）
> - 不等同于意识或理解
> - 增加 token 使用和延迟

---

## 🔗 相关链接 | Related Links

- [[00-Index]] - Anthropic 系统提示词学习索引
- [[search-behavior]] - 搜索行为与决策树
- [[past-chats-tools]] - 对话检索工具
- [[../03-Evolution/claude-4.1-opus-thinking]] - Claude 4.1 Opus Thinking 完整注释

---

**最后更新 | Last Updated**: 2026-02-06
**下一计划 | Next Review**: 2026-02-13
