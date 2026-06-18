---
title: AI编程高阶提示词实操手册
type: playbook
playbook_id: P06
tags: [Cursor, GPT-5, 提示词模板, 编程工作流]
related: [[concept_22_implicit_standard_reflection], [concept_23_explicit_codebase_rules], [concept_24_proactive_proposal], [concept_25_structured_density_control]]
---

# AI编程高阶提示词实操手册

## 目标
运用最新的提示词工程技巧（如隐性反思、XML结构化、行动提案），将大语言模型（如 GPT-5）从普通聊天机器人改造为完美适配本地代码库的高级研发工程师。

## 执行步骤与动作

### 场景一：从零到一构建新模块 (Zero-to-One)
**核心动作：制定规则与触发深度思考**

1. **注入 `<code_editing_rules>` (应用 [[concept_23_explicit_codebase_rules]])**
   - 动作：在系统提示词或 Cursor 的 `rules` 文件中明确写入：
     - 使用的框架（如 Next.js App Router）。
     - 样式库（如 TailwindCSS）。
     - UI/UX 规则（如排版层级、无障碍标准）。
2. **触发内部自审机制 (应用 [[concept_22_implicit_standard_reflection]])**
   - 动作：在用户提示词末尾添加要求：“在输出代码前，请先建立 5 个代码质量评估维度，并在内部对你的草稿进行打分和优化，直到达到最高标准再输出最终代码。”

### 场景二：生产环境长周期协作 (Bug修复与迭代)
**核心动作：降噪、提效与放权**

1. **切断废话，强化代码 (应用 [[concept_25_structured_density_control]])**
   - 动作：在指令中声明：“不要使用如‘好的，这是代码’等过渡性语言。但生成的代码必须详细，严禁使用单字母变量名。”
2. **使用 XML 结构化上下文**
   - 动作：使用 `<context_understanding>` 标签包裹背景信息，让模型更清晰地知道当前在做什么。
3. **鼓励主动提案模式 (应用 [[concept_24_proactive_proposal]])**
   - 动作：在修复 Bug 时，指示模型：“分析错误日志后，直接提出具体的修改方案和代码块供我 Approve，不要停下来问我‘是否需要帮你修复’。”
4. **软化搜索指令**
   - 动作：信任新模型的智商，避免使用诸如“你必须搜索所有相关文件”的极端字眼，改为“如确有必要，可查阅相关文件”，以避免过度消耗 token 与时间。

## ⚡ 开发者快速起步 (今天就加进你的 Prompt 里)
复制以下这句“神仙指令”加到你下一次的编程任务末尾：
> *"Please act proactively. Directly provide the final code diffs for me to approve without asking for permission. Keep your explanation extremely brief, but ensure the code variables are highly readable. Follow the implicit codebase rules strictly."*