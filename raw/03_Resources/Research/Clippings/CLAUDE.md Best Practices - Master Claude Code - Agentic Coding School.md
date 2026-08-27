---
title: "CLAUDE.md Best Practices - Master Claude Code - Agentic Coding School"
source: "https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70"
author:
published:
created: 2026-08-18
description:
tags:
  - "clippings"
---
已按 Paul Graham 的文风完成总结，见 prompt_1 的内容。

### 结构化内容识别结果：

1. **核心概念**：`CLAUDE.md` 是编码智能体的核心杠杆；受限于指令跟随能力（Instruction Limit），过长的文件会导致 AI 性能下降。
2. **关键优化策略**：
   - **指令预算控制**：严格控制行数，移除冗余的“最佳实践”（因为模型已内置）。
   - **层级化（Hierarchical）架构**：将 `CLAUDE.md` 分散到特定子目录，利用读取工具在特定流程中动态注入上下文。
   - **技术替代**：使用编程化的 Hook（钩子）替代单纯的文本说明，以强制执行安全与操作限制。
3. **最佳实践路线图**：
   - 从极简开始，仅在发生错误后补充指令。
   - 定期执行代码库审计（Auditing），移除与模型能力提升后冲突的过时限制。
   - 保持根目录文件轻量化，将领域特定逻辑下沉至嵌套文件。

Published公布 Feb 13, 2026•Updated Feb 22, 2026


这是关于 CLAUDE.md 最佳实践的视频内容，核心信息可以按优先级拆解为核心原则、常见误区和可立即执行的操作。

## 核心原则（最高优先级）

- CLAUDE.md 是你在使用 Claude Code 时杠杆最大的单一文件：一行错误的 CLAUDE.md 指令会级联放大成大量错误的研究、错误的计划，最终导致成百上千行错误代码，其影响力高于研究、计划、代码本身。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
- 模型存在"指令预算"：研究显示 Claude Opus 4.1 在约150条指令后准确率开始下降，而 Claude Code 系统提示本身就占用约50条指令，留给 CLAUDE.md、计划和提示词的空间有限。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
- 随着模型能力提升，许多最佳实践已经内化到模型本身，你应该"每次模型升级时想的是删除什么，而不是添加什么"。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)

## 常见误区（需要警惕）

- 很多人把 CLAUDE.md 当作项目变更历史来堆砌，文件动辄超过1000行，作者分析了1000多个公开 GitHub 仓库的 CLAUDE.md 文件，发现约10%超过500行。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
- Anthropic 官方在系统提示中特意加了"这些上下文可能与任务无关，除非高度相关否则不要响应"，正是因为大多数用户的 CLAUDE.md 文件质量太差、干扰了模型判断。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
- Vercel 的案例证明：给 Agent 做过度的提示工程约束（帮模型思考边缘情况）成功率只有80%；精简到2个工具、放手让模型自主推理后成功率达到100%，且更快、token更少。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
- 不要用 init 命令自动生成或抄网上的 CLAUDE.md 模板，这类文件通常过于冗长。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)

## 可落地 Action（按执行顺序）

1. 从最小化开始：新项目的 CLAUDE.md 起初只写项目描述和几条无法从代码库推断的关键命令（如"用 npm 而非 pnpm"）。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
2. 仅在发现模型犯错时才增量添加规则，且每次修改都要 commit 到 Git，方便回溯是哪一行指令导致性能下降。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
3. 注意文件结构位置：项目描述和关键命令放在最前面，因为 LLM 对开头和结尾的内容权重更高，中间内容容易被忽略。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
4. 采用分层/嵌套 CLAUDE.md 结构：根目录文件保持轻量，具体子系统（如 Supabase 迁移流程）的详细规则放进对应子文件夹的 CLAUDE.md 中，模型读取该文件夹文件时会自动"懒加载"注入相关上下文，避免根文件臃肿且能在正确时机注入正确上下文。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
5. 对于必须严格执行、不能有例外的约束（如"禁止直接执行 db push"），不要只写在 CLAUDE.md 里（模型仍有1/30到1/50概率忽略），而应改用 pre-tool-use hook 脚本强制拦截危险命令，这比纯文字约束更可靠。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)
6. 定期审计 CLAUDE.md：尤其是团队协作场景，随着模型升级或规则冲突累积，要主动删除过时或已被模型内化的指令，防止文件再次膨胀到数百行。 [agenticcoding](https://www.agenticcoding.school/member/class/claude-code?videoId=21032db5-dbb1-4202-a4d4-a00dbc8f2f70)