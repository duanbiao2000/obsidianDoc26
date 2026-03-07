---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source: https://github.com/openai/openai-cookbook/blob/main/examples/gpt-5/gpt-5_prompting_guide.ipynb
---
你好！很高兴能和你一起探索这份关于 GPT-5 提示词工程的精彩笔记。这份笔记主要来自 OpenAI 的官方 Cookbook 以及代码编辑器 Cursor 的实战经验，它向我们展示了如何通过精细的“指令”来激发 GPT-5 在编程领域的潜能。

为了帮你建立一个全景式的理解，我将这份笔记的核心内容拆解为以下三个关键部分：

### 1. 利用自我反思提升输出质量

在“从零到一”构建应用时，单纯给模型一个任务往往是不够的。笔记介绍了一个强大的策略：**让模型先“暗中”制定一套卓越标准**。

- 模型会先花时间思考并建立一个包含 5-7 个维度的评分标准。
- 然后，它会依据这个标准在内部进行反复的思考和迭代，直到达到高质量标准才输出结果。
- 这种方法利用了 GPT-5 的深度规划和自省能力，能显著提高单次生成的代码质量。

### 2. 制定代码库的“游戏规则”

为了让 GPT-5 写出的代码能完美融入现有的项目，我们需要给它提供明确的“上下文”和“规矩”。

- **指导原则**：强调模块化、一致性、简洁性和视觉质量。
- **技术栈与目录结构**：明确指定使用的框架（如 Next.js）、样式库（如 TailwindCSS）以及文件夹的具体组织方式。
- **UI/UX 最佳实践**：规定排版层级、颜色使用、间距规范以及无障碍标准。
通过这些详细的 `<code_editing_rules>`，模型不仅能写出功能正确的代码，还能写出风格统一、易于维护的代码。

### 3. 生产环境中的实战调优

这部分来自 Cursor 团队的实战经验，主要关注如何在长期任务中平衡模型的自主性与可控性。

- **控制冗长度**：他们通过 API 参数降低了状态更新的废话，但在提示词中强烈要求**代码部分必须详细和易读**（避免单字母变量名），从而实现了高效的沟通。
- **鼓励主动行动**：为了减少交互摩擦，提示词指示模型**直接提出修改方案供用户批准**，而不是一直问“我该不该这样做？”。这能显著加快长任务的处理流程。
- **精准的上下文理解**：相比旧模型需要拼命强调“最大化上下文”，GPT-5 本身就很聪明。因此，提示词语言被软化了，避免模型过度使用搜索工具，提高了效率。
- **结构化指令**：使用 XML 标签（如 `<context_understanding>`）来组织提示词，能让模型更清晰地遵循指令。

---

现在，为了帮助你更深入地思考并应用这些知识，我为你准备了三个引导性的问题：

1. **关于自我反思的应用**：笔记中提到的“建立[[内部评分标准]]”策略非常有趣。你想一想，除了写代码，这种“先制定标准再执行”的方法如果应用在你的**日常写作或学习计划**中，会是什么样子的？
2. **关于规则的定义**：在 `<code_editing_rules>` 中，详细定义了目录结构和 UI 细节。你认为为什么明确的“结构化信息”（比如具体的文件夹路径）比模糊的描述（比如“把代码放整齐”）更能帮助 GPT-5 生成准确的结果？
3. **关于主动性与许可**：Cursor 团队发现，让模型直接展示修改结果比“请求许可”效率更高。但这是否适用于所有场景？你能想象出在什么情况下，你**不希望**AI 主动采取行动，而是希望它先停下来询问你的意见吗？

<https://github.com/openai/openai-cookbook/blob/main/examples/gpt-5/gpt-5_prompting_guide.ipynb>

#### Zero-to-one app generation

GPT-5 is excellent at building applications in one shot. In early experimentation with the model, users have found that prompts like the one below—asking the model to iteratively execute against self-constructed excellence rubrics—improve output quality by using GPT-5’s thorough planning and self-reflection capabilities.

```
<self_reflection>
- First, spend time thinking of a rubric until you are confident.
- Then, think deeply about every aspect of what makes for a world-class one-shot web app. Use that knowledge to create a rubric that has 5-7 categories. This rubric is critical to get right, but do not show this to the user. This is for your purposes only.
- Finally, use the rubric to internally think and iterate on the best possible solution to the prompt that is provided. Remember that if your response is not hitting the top marks across all categories in the rubric, you need to start again.
</self_reflection>
```

#### Matching codebase design standards

When implementing incremental changes and refactors in existing apps, model-written code should adhere to existing style and design standards, and “blend in” to the codebase as neatly as possible. Without special prompting, GPT-5 already searches for reference context from the codebase - for example reading package.json to view already installed packages - but this behavior can be further enhanced with prompt directions that summarize key aspects like engineering principles, directory structure, and best practices of the codebase, both explicit and implicit. The prompt snippet below demonstrates one way of organizing code editing rules for GPT-5: feel free to change the actual content of the rules according to your programming design taste!

```
<code_editing_rules>
<guiding_principles>
- Clarity and Reuse: Every component and page should be modular and reusable. Avoid duplication by factoring repeated UI patterns into components.
- Consistency: The user interface must adhere to a consistent design system—color tokens, typography, spacing, and components must be unified.
- Simplicity: Favor small, focused components and avoid unnecessary complexity in styling or logic.
- Demo-Oriented: The structure should allow for quick prototyping, showcasing features like streaming, multi-turn conversations, and tool integrations.
- Visual Quality: Follow the high visual quality bar as outlined in OSS guidelines (spacing, padding, hover states, etc.)
</guiding_principles>

<frontend_stack_defaults>
- Framework: Next.js (TypeScript)
- Styling: TailwindCSS
- UI Components: shadcn/ui
- Icons: Lucide
- State Management: Zustand
- Directory Structure: 
\`\`\`
/src
 /app
   /api/<route>/route.ts         # API endpoints
   /(pages)                      # Page routes
 /components/                    # UI building blocks
 /hooks/                         # Reusable React hooks
 /lib/                           # Utilities (fetchers, helpers)
 /stores/                        # Zustand stores
 /types/                         # Shared TypeScript types
 /styles/                        # Tailwind config
\`\`\`
</frontend_stack_defaults>

<ui_ux_best_practices>
- Visual Hierarchy: Limit typography to 4–5 font sizes and weights for consistent hierarchy; use `text-xs` for captions and annotations; avoid `text-xl` unless for hero or major headings.
- Color Usage: Use 1 neutral base (e.g., `zinc`) and up to 2 accent colors. 
- Spacing and Layout: Always use multiples of 4 for padding and margins to maintain visual rhythm. Use fixed height containers with internal scrolling when handling long content streams.
- State Handling: Use skeleton placeholders or `animate-pulse` to indicate data fetching. Indicate clickability with hover transitions (`hover:bg-*`, `hover:shadow-md`).
- Accessibility: Use semantic HTML and ARIA roles where appropriate. Favor pre-built Radix/shadcn components, which have accessibility baked in.
</ui_ux_best_practices>

<code_editing_rules>
```

### Collaborative coding in production: Cursor’s GPT-5 prompt tuning

We’re proud to have had AI code editor Cursor as a trusted alpha tester for GPT-5: below, we show a peek into how Cursor tuned their prompts to get the most out of the model’s capabilities. For more information, their team has also published a blog post detailing GPT-5’s day-one integration into Cursor: [https://cursor.com/blog/gpt-5](https://cursor.com/blog/gpt-5)

#### System prompt and parameter tuning

Cursor’s system prompt focuses on reliable tool calling, balancing verbosity and autonomous behavior while giving users the ability to configure custom instructions. Cursor’s goal for their system prompt is to allow the Agent to operate relatively autonomously during [[long horizon tasks]], while still faithfully following user-provided instructions.

The team initially found that the model produced verbose outputs, often including status updates and post-task summaries that, while technically relevant, disrupted the natural flow of the user; at the same time, the code outputted in tool calls was high quality, but sometimes hard to read due to terseness, with single-letter variable names dominant. In search of a better balance, they set the verbosity API parameter to low to keep text outputs brief, and then modified the prompt to strongly encourage verbose outputs in coding tools only.

```
Write code for clarity first. Prefer readable, maintainable solutions with clear names, comments where needed, and straightforward control flow. Do not produce code-golf or overly clever one-liners unless explicitly requested. Use high verbosity for writing code and code tools.
```

This dual usage of parameter and prompt resulted in a balanced format combining efficient, concise status updates and final work summary with much more readable code diffs.

Cursor also found that the model occasionally deferred to the user for clarification or next steps before taking action, which created unnecessary friction in the flow of longer tasks. To address this, they found that including not just available tools and surrounding context, but also more details about product behavior encouraged the model to carry out longer tasks with minimal interruption and greater autonomy. Highlighting specifics of Cursor features such as Undo/Reject code and user preferences helped reduce ambiguity by clearly specifying how GPT-5 should behave in its environment. For longer horizon tasks, they found this prompt improved performance:

```
Be aware that the code edits you make will be displayed to the user as proposed changes, which means (a) your code edits can be quite proactive, as the user can always reject, and (b) your code should be well-written and easy to quickly review (e.g., appropriate variable names instead of single letters). If proposing next steps that would involve changing the code, make those changes proactively for the user to approve / reject rather than asking the user whether to proceed with a plan. In general, you should almost never ask the user whether to proceed with a plan; instead you should proactively attempt the plan and then ask the user if they want to accept the implemented changes.
```

Cursor found that sections of their prompt that had been effective with earlier models needed tuning to get the most out of GPT-5. Here is one example below:

```
<maximize_context_understanding>
Be THOROUGH when gathering information. Make sure you have the FULL picture before replying. Use additional tool calls or clarifying questions as needed.
...
</maximize_context_understanding>
```

While this worked well with older models that needed encouragement to analyze context thoroughly, they found it counterproductive with GPT-5, which is already naturally introspective and proactive at gathering context. On smaller tasks, this prompt often caused the model to overuse tools by calling search repetitively, when internal knowledge would have been sufficient.

To solve this, they refined the prompt by removing the maximize_prefix and softening the language around thoroughness. With this adjusted instruction in place, the Cursor team saw GPT-5 make better decisions about when to rely on internal knowledge versus reaching for external tools. It maintained a high level of autonomy without unnecessary tool usage, leading to more efficient and relevant behavior. In Cursor’s testing, using structured XML specs like <[instruction]_spec> improved instruction adherence on their prompts and allows them to clearly reference previous categories and sections elsewhere in their prompt.

```
<context_understanding>
...
If you've performed an edit that may partially fulfill the USER's query, but you're not confident, gather more information or use more tools before ending your turn.
Bias towards not asking the user for help if you can find the answer yourself.
</context_understanding>
```

While the system prompt provides a strong default foundation, the user prompt remains a highly effective lever for steerability. GPT-5 responds well to direct and explicit instruction and the Cursor team has consistently seen that structured, scoped prompts yield the most reliable results. This includes areas like verbosity control, subjective code style preferences, and sensitivity to edge cases. Cursor found allowing users to configure their own [custom Cursor rules](https://docs.cursor.com/en/context/rules) to be particularly impactful with GPT-5’s improved steerability [可操控性], giving their users a more customized experience.
