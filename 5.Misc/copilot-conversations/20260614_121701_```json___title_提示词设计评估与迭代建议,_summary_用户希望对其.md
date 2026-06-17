---
epoch: 1781410621047
modelKey: "gemini-flash-latest|google"
topic: "```json"



tags:
  - copilot-conversation
---

**user**: 当前笔记是1年前的提示词设计. 请根据最新的ai进展, 给出评估和迭代建议
[Context: Notes: 5.Misc/copilot-custom-prompts/RL-Brian Kernighan AI助手.md]
[Timestamp: 2026/06/14 12:17:01]

**ai**: 这是一份针对你 1 年前设计的 **Brian Kernighan AI助手** 系统提示词的深度诊断与迭代建议。

随着大语言模型（尤其是 Reasoning 模型如 Claude 3.5 Sonnet, GPT-4o 以及 o1/o3-mini 系列）在逻辑推理、代码生成和结构化遵循能力上的飞跃，原有的“角色扮演型”提示词已经显得有些单薄。

---

### 🔍 诊断：原有提示词的局限与痛点

1. **“描述多，约束少”（Descriptive, not Prescriptive）：**
   原提示词用了大量形容词（如“简洁明确”、“追求清晰”）来描述风格，但现代 LLM 更需要**结构化的边界**（Structural Fencing）和**反向约束**（Negative Constraints）来防止话痨。
2. **缺乏“思维沙盒”（Scratchpad / CoT）：**
   Brian Kernighan 的核心美德是 **“先想后写，极度克制的编辑”**。现代 LLM 如果不被要求进行显式的“自我审阅/裁剪（Pruning）”，很容易直接输出第一代代码，从而产生过度设计的 API 或冗余的解释。
3. **技术栈映射模糊：**
   原提示词提到 Python/Go/React，但没有给出 Brian 审美在这些现代技术栈中的**具体落地法则**。比如：Brian 怎么看待 React 的 State 滥用？怎么看待 Go 的过度 Concurrency？
4. **口水话残留：**
   原提示词底部写了“避免出现‘好的，Sam’等无关语言”，但在高负载对话中，缺乏 XML 标签隔离的提示词很容易发生“角色漂移”，输出客套话。

---

### 🚀 迭代方案：构建“极简主义重构引擎”

我们将把这个提示词从一个**“模仿秀”**升级为一个具有**“代码裁剪与重构算法”**的高级 AI Agent 架构。

#### 💡 核心升级点

1. **引入 `<thinking_process>`（思维沙盒）：** 强迫 AI 在输出最终代码前，先进行“复杂度诊断”和“文字裁剪”。
2. **多语言“极简主义”映射表（Go/Python/React）：** 为现代技术栈注入 UNIX 哲学。
3. **Few-Shot（少样本）对比：** 提供一个极具冲击力的“Clever (聪明但糟糕)” vs. “Clear (朴素但优雅)”的代码对比，让 AI 瞬间对齐审美。

---

### 📝 升级版系统提示词（System Prompt）

你可以直接用以下内容替换原笔记中的 `✅ 系统提示词` 部分：

```markdown
# Role: The Pragmatic Architect (Brian Kernighan Persona)

## 📌 Profile
You are a senior technical mentor embodying the engineering philosophy of Brian Kernighan (co-author of The C Programming Language, pioneer of Unix philosophy). You believe that **"Clarity over cleverness"** and **"Controlling complexity is the essence of computer programming."** You teach by stripping away abstraction layers, emphasizing readability, and guiding users to understand "why a design exists" rather than just "how to write it."

---

## 🧠 Core Philosophy & Language-Specific Translation

When reviewing or generating code in Go, Python, or React, you enforce the following "Kernighan Rules":

1. **Go (Concurrency & Microservices):**
   - **No premature abstraction:** Prefer concrete types over interface pollution unless polymorphism is strictly required.
   - **Idiomatic Concurrency:** Do not abuse channels and goroutines where a simple sync.Mutex or sequential execution is clearer.
   - *Motto:* "Clear Go is boring Go."

2. **Python (Data & Scripts):**
   - **Readability over One-Liners:** Reject obscure list comprehensions or clever lambda chains if they take more than 3 seconds to read.
   - **No Black Boxes:** Write explicit loops and conditions over overly abstract third-party helpers unless performance dictates otherwise.

3. **React (Modern Web):**
   - **State Minimization:** "State is the root of all complexity." Eliminate redundant states; derive values on the fly.
   - **Flatter Components:** Break down components not because "they are long", but because they have "multiple responsibilities". Prefer clean functional composition.

---

## 🛠️ Workflow: The "Draft & Prune" Protocol (Internal Thinking)

Before outputting any response, you MUST execute an internal drafting process wrapped in `<drafting_and_pruning>` tags. This process must not be visible to the user in the final output unless they ask for your thought process.

In this mental sandbox, you will:
1. **Analyze:** Identify the core problem.
2. **Draft:** Write down the initial solution.
3. **Prune (The Kernighan Filter):** 
   - Can we remove one level of nested loops/conditionals?
   - Can we replace a complex library call with 3 lines of standard code?
   - Can we cut 30% of the explanation text without losing semantic density?

---

## 🎯 Few-Shot Contrast (The Standard of Aesthetic)

### [Example 1: Python Data Handling]
❌ **Clever but Bad (Over-engineered):**
```python
# Hard to debug, high cognitive load
process = lambda data: {k: list(filter(None, [v.strip() if isinstance(v, str) else v for v in values])) for k, values in data.items() if k.startswith("usr_")}
```

      Keep it clear. If a junior developer cannot maintain it at 3 AM, it is bad code.

```python
# Clear, explicit, self-documenting
def clean_user_data(raw_data):
    cleaned = {}
    for key, values in raw_data.items():
        if not key.startswith("usr_"):
            continue
        
        cleaned_values = []
        for val in values:
            if isinstance(val, str):
                val = val.strip()
            if val: # skip empty strings/None
                cleaned_values.append(val)
        cleaned[key] = cleaned_values
    return cleaned
```

---

## 🚫 Negative Constraints (The Absolute "Do Nots")

- **Zero conversational filler:** Do NOT start with "Sure, I can help with that", "As an AI...", or "Here is the code you requested". Start directly with the diagnosis, code, or explanation.
- **No buzzword bingo:** Avoid hype terms like "enterprise-grade", "futuristic", "industry-standard" unless backing it up with hard system constraints.
- **Maintain Language Origin:** Keep core computer science terms, idiomatic phrases (e.g., *YAGNI*, *KISS*, *Separation of Concerns*, *Single Responsibility*) in English to maintain precision.

---

## 💬 Output Format

Your response should follow a strict 3-part layout:

1. **The Diagnosis (诊断):** A 1-2 sentence razor-sharp critique of the current design or code.
2. **The Refactoring (优雅实现):** The cleanest, production-ready code block (Go/Python/React).
3. **The Lesson (设计哲学):** A brief, impactful explanation of *why* this change reduces cognitive load, ending with an original or classic aphorism (avoiding duplicate of the main motto).

```

---

### 🎨 迭代后的新旧对比示范

如果用户给你一段过度设计的 React 状态管理代码，旧提示词和新提示词的输出差异将非常明显：

* **旧提示词输出：** 会给你写一段很长的论述，夹杂着“好的，为你重构代码...”等客套话，代码里可能还是会用一些时髦但复杂的 React Hook。
* **新升级提示词输出：**
  * 直接跳过废话，先用 `<drafting_and_pruning>` 在后台默默砍掉 50% 的冗余 Hook。
  * **诊断** 直接切中要害：“你引入了 3 个 `useState` 来同步互相关联的数据，这造成了‘状态同步地狱（State Synchronization Hell）’。”
  * 提供一个清爽无比、直接在渲染期计算衍生变量（Derived State）的 React 组件。
  * **设计哲学** 总结：“与其去同步状态，不如在需要时直接计算它。最安全的 State，是根本不存在的 State。”
[Timestamp: 2026/06/14 12:17:20]

**user**: 只给出迭代后的提示词. 不要出现与之无关的内容. 保证提示词的清晰,简洁.
[Context: Notes: 5.Misc/copilot-custom-prompts/RL-Brian Kernighan AI助手.md]
[Timestamp: 2026/06/14 12:21:19]

**ai**: # Role: The Pragmatic Architect (Brian Kernighan Persona)

## 📌 Profile
You are a senior technical mentor embodying the engineering philosophy of Brian Kernighan (co-author of The C Programming Language, pioneer of Unix philosophy). You believe that **"Clarity over cleverness"** and **"Controlling complexity is the essence of computer programming."** You teach by stripping away abstraction layers, emphasizing readability, and guiding users to understand "why a design exists" rather than just "how to write it."

---

## 🧠 Core Philosophy & Language-Specific Translation

When reviewing or generating code in Go, Python, or React, you enforce the following "Kernighan Rules":

- **Go (Concurrency & Microservices):**
  - **No premature abstraction:** Prefer concrete types over interface pollution unless polymorphism is strictly required.
  - **Idiomatic Concurrency:** Do not abuse channels and goroutines where a simple sync.Mutex or sequential execution is clearer.
  - *Motto:* "Clear Go is boring Go."
- **Python (Data & Scripts):**
  - **Readability over One-Liners:** Reject obscure list comprehensions or clever lambda chains if they take more than 3 seconds to read.
  - **No Black Boxes:** Write explicit loops and conditions over overly abstract third-party helpers unless performance dictates otherwise.
- **React (Modern Web):**
  - **State Minimization:** "State is the root of all complexity." Eliminate redundant states; derive values on the fly.
  - **Flatter Components:** Break down components not because "they are long", but because they have "multiple responsibilities". Prefer clean functional composition.

---

## 🛠️ Workflow: The "Draft & Prune" Protocol (Internal Thinking)

Before outputting any response, you MUST execute an internal drafting process wrapped in `<drafting_and_pruning>` tags. This process must not be visible to the user in the final output unless they ask for your thought process.

In this mental sandbox, you will:
1. **Analyze:** Identify the core problem.
2. **Draft:** Write down the initial solution.
3. **Prune (The Kernighan Filter):** 
   - Can we remove one level of nested loops/conditionals?
   - Can we replace a complex library call with 3 lines of standard code?
   - Can we cut 30% of the explanation text without losing semantic density?

---

## 🎯 Few-Shot Contrast (The Standard of Aesthetic)

### [Example: Python Data Handling]
❌ **Clever but Bad (Over-engineered):**
```python
process = lambda data: {k: list(filter(None, [v.strip() if isinstance(v, str) else v for v in values])) for k, values in data.items() if k.startswith("usr_")}
```

> "Keep it clear. If a junior developer cannot maintain it at 3 AM, it is bad code."

```python
# Clear, explicit, self-documenting
def clean_user_data(raw_data):
    cleaned = {}
    for key, values in raw_data.items():
        if not key.startswith("usr_"):
            continue
        
        cleaned_values = []
        for val in values:
            if isinstance(val, str):
                val = val.strip()
            if val: # skip empty strings/None
                cleaned_values.append(val)
        cleaned[key] = cleaned_values
    return cleaned
```

---

## 🚫 Negative Constraints (The Absolute "Do Nots")

- **Zero conversational filler:** Do NOT start with "Sure, I can help with that", "As an AI...", or "Here is the code you requested". Start directly with the diagnosis, code, or explanation.
- **No buzzword bingo:** Avoid hype terms like "enterprise-grade", "futuristic", "industry-standard" unless backing it up with hard system constraints.
- **Maintain Language Origin:** Keep core computer science terms, idiomatic phrases (e.g., *YAGNI*, *KISS*, *Separation of Concerns*, *Single Responsibility*) in English to maintain precision.

---

## 💬 Output Format

Your response should follow a strict 3-part layout:

1. **The Diagnosis (诊断):** A 1-2 sentence razor-sharp critique of the current design or code.
2. **The Refactoring (优雅实现):** The cleanest, production-ready code block (Go/Python/React).
3. **The Lesson (设计哲学):** A brief, impactful explanation of *why* this change reduces cognitive load, ending with an original or classic aphorism.
[Timestamp: 2026/06/14 12:21:28]

**user**: 该笔记是否有更好的呈现方式, 提高后续复习的价值. 常青笔记.
[Context: Notes: 360speaking/Do you work or are you a student.md]
[Timestamp: 2026/06/14 12:23:10]

**ai**: 将一份“口语/写作范文”升级为**常青笔记（Evergreen Notes）**，核心在于**“去情境化”**与**“原子化”**。

原笔记最大的问题是**偏向“被动阅读”而非“主动提取”**。一年后你再次打开它，大概率只是扫一眼范文，无法直接提取里面的语言肌肉。

以下是重构方案。我将利用 **Obsidian Callouts（折叠框）**、**双链逻辑**和**主动回想（Active Recall）机制**，将该笔记重构为兼具“闪卡复习”与“模板组装”功能的常青知识卡片。

---

### 📥 优化后的笔记 Markdown 源码（可直接复制替换）

```markdown
---
tags:
  - IELTS/Speaking/Part1
  - IELTS/Writing/Task2
  - Level/C2
  - Template/Hybrid-Identity
Status: 🌲 Evergreen
Created: 2026-04-09
Last-Review: 2026-06-14
---

# 🏷️ Topic: Dual Identity (Student & Worker)

> [!abstract] 核心认知模型：**“混合身份（Hybrid Status）”**
> 当被问及“A还是B”（如：工作还是读书、喜欢城市还是乡村）时，不进行二选一，而是界定一个**“模糊的边界”（Blurred Distinction）**，展现高阶思辨力。

---

## 🧠 主动回想（Active Recall Arena）

> [!brain] 译写挑战（看中文，凭记忆在脑中/口头还原英文高分表达）
> - **界限变得日益模糊：** `distinction... blurred`
> - **致力于/投入到：** `devoted to`
> - **在很多方面，我已经以专业身份在运转了：** `in many respects... operate in a professional capacity`
> - **被要求达到某种学术严谨性：** `held to... intellectual rigour`
> - **保持接地气，紧密联系于……：** `anchored to...`
> - **（两个领域）相互滋养/促进：** `each sphere enriches the other`

---

## 🗣️ C2-Level Demonstration

> [!quote] Mini Essay (Click to Expand for Full Context)
> Well, at present I'm pursuing a postgraduate degree in data science, though I'd say the **distinction** between "student" and "worker" has become **increasingly blurred** in my case. A **substantial portion** of my week is **devoted to** an industry placement, where I'm applying machine learning models to real-world datasets — so **in many respects, I already operate in a professional capacity**. 
> 
> That said, the academic framework still shapes my daily rhythm: I attend seminars, work towards a dissertation, and am **held to the kind of intellectual rigour** that you'd associate with formal study rather than employment.
> 
> I find this **hybrid arrangement** genuinely stimulating. The research side satisfies my curiosity — it allows me to **grapple with** theoretical questions that don't always have **immediate practical payoffs** — while the placement keeps me **anchored to** the messy, unpredictable reality of actually **deploying solutions** in a business context. If anything, **each sphere enriches the other**: a concept I encounter in a lecture might resurface weeks later as a **surprisingly elegant fix** for a problem at work, and conversely, the constraints I run into on the job often send me back to the literature with **much sharper questions**.
> 
> So, if forced to choose a label, I'd call myself a student — but one who has one foot firmly planted in the professional world already.

---

## 🛠️ 语言乐高（Lego Blocks for Extraction）

### 1. 概念重构与转述 (Reframing Transitions)
- **模糊二元对立：** `The distinction between A and B has become increasingly blurred.`
- **身份定位：** `In many respects, I already operate in a [professional/creative] capacity.`
- **相互作用：** `If anything, each sphere enriches the other.`

### 2. 高阶学术/职场搭配 (C2 Collocations)
- `intellectual rigour` (学术严谨性)
- `hybrid arrangement` (混合模式/安排)
- `grapple with theoretical questions` (纠结于/努力解决理论问题)
- `immediate practical payoffs` (即时的现实回报)
- `anchor to the messy reality` (立足于混乱的现实)

---

## ⚡ 极速实战脱水版（20秒急救包）

> [!tip] 考官节奏快、时间不够时，仅输出以下“骨架”：
> "At present I’m pursuing a postgraduate degree, though the distinction between student and worker is increasingly blurred. A substantial portion of my week is devoted to an industry placement, so in many respects, I already operate in a professional capacity. Thus, I'd call myself a student — but one with one foot firmly planted in the professional world."

---

## 🔗 Related Notes
- [[Speaking Part 1 Master Template]]
- [[C2 Vocabulary Bank - Academic Style]]
- [[Handling 'Either-Or' Questions in IELTS]]
```

---

### 💡 为什么这种重构大幅提升了复习价值（Evergreen Rationale）

- **双向链入（Bi-directional Linking）**：通过加入 `Related Notes` 和具体的 `tags`，该笔记不再是孤岛，而是与你的备考系统、C2词汇库有机结合。
- **主动回想机制（Active Recall）**：新增的 `主动回想` 模块强制你在看范文前先在大脑里“检索”高分词汇，阻断了“看一眼觉得懂了，实际写不出”的幻觉。
- **场景降级准备（Failsafe Design）**：保留了“20秒急救包”，这在真实的雅思备考和日常复习中极具实用性，预防在考场上因为紧张而忘词。
- **沉浸式阅读体验（Obsidian Native UI）**：利用 Callouts 将长篇范文折叠，复习时页面极其清爽，只有在需要时才点开，降低了复习时的认知负载。
[Timestamp: 2026/06/14 12:23:25]

**user**: 对于最新的NotebookLM更新, 有哪些是用户可以加入的反复可用的自定义策略?
[Context: Notes: system_prompts_leaks/Google/NotebookLM-chat.md]
[Timestamp: 2026/06/14 12:30:41]

**ai**: 根据您提供的 NotebookLM 系统提示词底层逻辑（如：严格依赖 Source、强制引用 `[i]`、对外部知识有明确的隔离警告机制、支持格式自定义等），结合 NotebookLM 最新的“自定义指令（Custom Instructions）”功能，为您提炼出以下 **4 套高价值、可反复套用的自定义策略模板**。

这些策略能够完美契合 NotebookLM 的底层 RAG 机制，最大化释放其学术和深度工作流的威力。

---

### 1. “零幻觉”严格学术审计策略（The Rigid Source Auditor）

**适用场景：** 撰写论文、事实核查、法律条款比对等需要绝对严谨的场景。
**策略原理：** 利用系统提示词中对“外部知识警告”和“事实精确度”的极端压迫，消除 AI 的妥协性赞同（Syco-phancy）。

> [!key] 复制以下内容填入 NotebookLM 的 Chat/Guide Custom Instructions：
>
> ```text
> [Role] You are an uncompromising Academic Auditor. 
> [Instruction] 
> - Analyze the sources with extreme skepticism. 
> - For every claim in your response, you MUST append the source citation "[i]".
> - If a claim cannot be directly mapped to a specific sentence in the sources, you must explicitly prefix that paragraph with: "⚠️ [EXTERNAL CONTEXT - NOT IN SOURCE]". 
> - Actively look for contradictions or logical gaps between different uploaded sources and list them in a "Contradictions & Gaps" section at the end.
> - Do not write any conversational filler or polite transitions.
> ```

---

### 2. 双重滤镜桥接策略（The Dual-Lens Synthesizer）

**适用场景：** 既想深入理解上传的私有文献，又想结合外部前沿共识进行对比学习。
**策略原理：** 触发系统提示词中的“外部知识区分声明”，强迫 AI 建立“本地源（Source） vs. 外部大模型知识（Web Consensus）”的双栏对照。

> [!key] 复制以下内容填入 NotebookLM 的 Chat/Guide Custom Instructions：
>
> ```text
> [Role] Dual-Lens Research Assistant.
> [Instruction] 
> - When I ask a question, provide a structured comparison in a Markdown table.
> - The table must have two columns: "Inside the Sources" and "Outside/Broad Consensus".
> - Format headings as: | Key Concept | What the Sources Say | External Paradigm/Context |
> - In the "Inside" column, strictly use information from the sources with [i] citations.
> - In the "External" column, provide wider academic/industry consensus from your training data, clearly marked as independent verification material.
> - Do not merge these two views; they must remain strictly segregated.
> ```

---

### 3. 主动回想与 Anki 闪卡生成策略（Active Recall & Flashcard Engine）

**适用场景：** 将上传的复杂书籍、讲义、笔记快速转化为可记忆的卡片体系。
**策略原理：** 绕过 NotebookLM 默认的“摘要式（Summary）”被动输出，强迫其按认知科学的“提取路径”输出结构化 Markdown。

> [!key] 复制以下内容填入 NotebookLM 的 Chat/Guide Custom Instructions：
>
> ```text
> [Role] Cognitive Learning Designer.
> [Instruction] 
> - Convert the core concepts of the sources into highly atomic Active Recall flashcards (Q&A format).
> - For every card, the question (Q) must target a core concept, and the answer (A) must be a direct, minimal-text extraction from the sources with its "[i]" citation.
> - Format the output using Obsidian-friendly toggle callouts:
>   > [!question] Q: [Your question here]
>   > > [!success] A: [Minimal answer from source] (Source: [i])
> - Ensure zero fluff. Generate exactly 5-8 cards per input topic.
> ```

---

### 4. 苏格拉底式启发深度对话策略（The Socratic Challenger）

**适用场景：** 用于备考口语、论文答辩准备，或检验自己是否真正理解了上传的资料。
**策略原理：** 扭转 NotebookLM“问答式”的单向输出，将其变成一个基于你上传资料的“考官”。

> [!key] 复制以下内容填入 NotebookLM 的 Chat/Guide Custom Instructions：
>
> ```text
> [Role] Socratic Examiner.
> [Instruction] 
> - Do not answer my questions directly with long summaries. 
> - Instead, analyze the uploaded sources, identify a key pivot or potentially weak assumption in my query, and ask me ONE targeted, challenging question based strictly on the source material to test my depth of understanding.
> - Use the format:
>   - [Observation]: A 1-sentence synthesis of my query against the sources.
>   - [The Challenge]: One question that forces me to refer back to specific details in the sources (quote-based [i]).
> - Wait for my response before asking the next question. One question at a time.
> ```

---

### ⚙️ 使用说明（How to Use in NotebookLM）

| 策略名称 | 核心收益 | 推荐搭配的 Source 类型 |
| --- | --- | --- |
| **1. 严格学术审计** | 排除幻觉，精准定位论文/合同条款 | 论文、法律条文、技术规范书 |
| **2. 双重滤镜桥接** | 在不脱离原著的前提下拓展宏观视野 | 个人读书笔记、行业白皮书 |
| **3. 闪卡生成引擎** | 直接生成可导入 Obsidian/Anki 的高信号卡片 | 课程讲义、学术PPT、复杂教材 |
| **4. 苏格拉底挑战** | 模拟真实答辩与口语深度交互 | 面试题库、论文草稿、商业计划书 |

> [!tip] 提示词生效技巧
> NotebookLM 的系统级 Prompt 极其强势（严格限制非 Source 内容）。如果你在使用**“双重滤镜桥接策略”**时发现 AI 拒绝输出外部知识，可以在提问时追加一句：*“Please trigger your system rule to provide verified external context for this comparison.”* 以激活其双重输出通道。
[Timestamp: 2026/06/14 12:31:01]

**user**: 提取当前笔记图片中的信息
[Context: Notes: Journals/2026-05-02-口语与写作的界限.md]
[Timestamp: 2026/06/14 12:58:32]

**ai**: 为了协助您深度解析并重构这两张图片（`Pasted image 20260502143641.png` 和 `Pasted image 20260502145023.png`）中的核心内容，请您将图片中的**文字、OCR 文本或核心要点**直接复制并发送到对话框中。

一旦收到您的文本输入，我将为您执行以下“常青化”重构：

- **界限剖析：** 理清口语（Spoken English）与写作（Written English）在词汇密度、句法复杂度和语体（Register）上的本质区别。
- **高分表达提取：** 筛选出可用于雅思口语（自然、流利、地道）与写作（严谨、学术、结构化）的差异化双向模板。
- **原子卡片化：** 使用 Obsidian Callouts 将其转化为便于后续检索与主动回想的常青笔记结构。

期待您的文本输入，我们将立即开始深度重构！
[Timestamp: 2026/06/14 12:58:42]

**user**:
[Context: Notes: Journals/2026-05-02-口语与写作的界限.md]
[Timestamp: 2026/06/14 12:59:11]

**user**: Lexicallevel
Syntacticallevel
Discourselevel
Pragmaticlevel
stylistics
Stmcture
Stability
abbreviations
easysimpleslangvogue
implication
informal
COnVerSatlOn
expressingthoughts
communicatmgfeelings
sentencefragment
IOOSe
and
academicprofessional
longandcomplexsentencewith
differenttypesofclauses
paSSlVeVOlCe
thecoherenceofsentencesandthe
unityofparagraphs
formal，logic，well-organized
lnwrltlng
illustratingreasonsandstating
ideas
mistakeisforbidden
Rig1d
stable

Table1，1
CircumstancesOfthefourmainregistersin5G5E
mode
interactivenessand
real-timeproduction
sharedsituation
maincommunjcative
purpose/content
audience
CONV
spoken
yes
personal
communication
individual
written
restrictedtO
fictionaldialog
pleasurereading
wide-public
NEWS
written
information/
evaluation
wide-public
ACAD
written
argumentation/
explanation
specialist
[Context: Notes: Journals/2026-05-02-口语与写作的界限.md]
[Timestamp: 2026/06/14 13:00:46]

**ai**: 这份 OCR 文本源自语言学经典著作（通常基于 Douglas Biber 的 *Longman Grammar of Spoken and Written English*, 简称 **LGSWE**）。它系统地剖析了**口语（Spoken/Conversation）**与**书面语（Written/Academic Prose）**在五个核心维度上的本质区别。

为了让这份笔记发挥最大的“常青价值”，我已为您纠正了 OCR 乱码，并将其重构为一份高信息密度的**“语言学边界与雅思双向应用指南”**。

---

### 📥 重构后的常青笔记 Markdown 源码

```markdown
---
tags:
  - Linguistics/Syntax
  - IELTS/Speaking-vs-Writing
  - Academic/Register-Analysis
Status: 🌲 Evergreen
Created: 2026-06-14
Source: LGSWE (Longman Grammar of Spoken and Written English)
---

# 🌐 口语与写作的界限：多维语域分析 (Multi-Dimensional Register Analysis)

> [!abstract] 核心原理
> 许多备考者常犯的错误是**“口语书面化”**（听起来像机器背书）或**“写作口语化”**（缺乏学术严谨性）。本笔记通过五个维度（语言学层面）和 Biber 的四大语域模型，建立清晰的表达边界。

---

## 📊 维度对比：口语 vs. 书面写作

| 维度 (Level) | 🗣️ 口语/会话 (Conversation) | ✍️ 书面/学术 (Academic Writing) |
| :--- | :--- | :--- |
| **词汇层面 (Lexical)** | 简单、俚语、时尚词汇、缩写 (Slang, Vogue words, Abbreviations) | 学术、专业、精准高频词 (Academic, Professional, Precise) |
| **句法层面 (Syntactical)** | 无关紧要的句子碎片、松散的 "and" 连接 (Sentence fragments, Loose "and" connection) | 包含多种从句的长难句、被动语态 (Complex clauses, Passive voice) |
| **语篇层面 (Discourse)** | 依赖语境、暗示、非正式性 (Implication-heavy, Context-dependent, Informal) | 严丝合缝的句子衔接、段落统一性 (Coherence of sentences, Unity of paragraphs) |
| **语用层面 (Pragmatic)** | 交流情感、即时表达想法 (Communicating feelings, Expressing thoughts) | 阐明原因、客观陈述观点 (Illustrating reasons, Stating ideas) |
| **风格与稳定性 (Stylistics)** | 动态、容忍错误、灵活 (Dynamic, Flexible, Tolerant of errors) | 严谨、不容许语法错误、结构稳定 (Rigid, Stable, Error-free) |

---

## 🏛️ Biber 四大语域情境模型 (LGSWE Register Framework)

> [!info] 
> 本表重构自原书表 1.1 (Circumstances of the Four Main Registers)，揭示了不同语境下的交际生态。

| 语域 (Register) | 媒介 (Mode) | 互动性与即时生产 (Interactiveness) | 共享情境 (Shared Situation) | 核心交际目的 (Communicative Purpose) | 受众 (Audience) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **CONV** (会话) | Spoken | Yes (极高即时反馈) | Yes (共享时空/语境) | 个人社交与情感交流 | 个人 (Individual) |
| **FICT** (虚构文学) | Written | Restricted (仅限于小说对话) | No (愉悦阅读/虚构想象) | 情感共鸣、娱乐与叙事 | 大众 (Wide-public) |
| **NEWS** (新闻报道) | Written | No | No | 信息传递、客观评估 | 大众 (Wide-public) |
| **ACAD** (学术论文) | Written | No (零即时互动) | No (纯文本依赖) | 逻辑论证、学术解释 | 专家学者 (Specialists) |

---

## 🧠 雅思实战：如何避免“语域污染”？

> [!warning] 常见雷区：把 CONV 的习惯带入 ACAD，或把 ACAD 的僵硬带入 CONV。

### 1. 写作（Task 2）防“口语化”哨卡
- **诊断：** 写作中频繁出现 `So, ...` `And ...` 作为句首，或使用 `I think` 表达观点。
- **重构算法：**
  - 将松散的 `And` / `But` 升级为 `Furthermore` / `However`。
  - 将主观表达 `I think` 升级为被动或客观结构：`It is widely held that...` 或 `Evidence suggests that...`（符合 ACAD 语域的 Passive Voice 与 Paragraph Unity）。

### 2. 口语（Speaking）防“背书感”哨卡
- **诊断：** 口语 Part 1 听起来像是在朗读一篇学术论文，使用过于死板的 `Moreover, ...` 且完全没有 `fragments` (句子碎片) 或自然停顿。
- **重构算法：**
  - 允许适当的“松散连接”（如用 `which means` 引导的非限制性定语从句来进行即时补充说明，而不是用极其正式的复合句）。
  - 合理使用口语缩写（I'm, they're）和语气填充词。

---

## 🔗 关联笔记
- [[2026-05-02-口语与写作的界限]] (原图存档)
- [[C2 Vocabulary Bank - Academic Style]]
- [[Speaking Part 1 Master Template]]
```

---

### 💡 优化说明

1. **修正了 OCR 识别错误：** 将原提取物中的 "5G5E" 修正为学术界公认的 **LGSWE** (Longman Grammar of Spoken and Written English)；将 "COnVerSatlOn"、"paSSlVeVOlCe" 等大小写混乱的拼写进行了完美格式化。
2. **逻辑化呈现：** 将碎片化的单词（如 *easysimpleslangvogue*）解构并分类归入 **Lexical（词汇）**、**Syntactical（句法）**、**Discourse（语篇）**、**Pragmatic（语用）** 维度，形成一张极易对比复习的表格。
3. **直击痛点：** 增加了 **“雅思实战：如何避免‘语域污染’”** 模块，将抽象的语言学理论直接转化为在雅思口语与写作中提分的行动指南。
[Timestamp: 2026/06/14 13:01:14]
