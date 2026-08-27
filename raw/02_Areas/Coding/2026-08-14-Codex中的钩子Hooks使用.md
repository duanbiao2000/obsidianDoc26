---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---

网上实用的 Codex 钩子（Hooks）主要集中在**自动化代码维护**、**安全检查**和**增强交互体验**这几个方面。这里有一些可以直接参考或使用的例子：

### ⚙️ 自动化工作流：告别重复劳动
这类钩子能自动执行那些繁琐、重复的任务，把精力留给更重要的事。

*   **保存后自动格式化代码**：这是最经典的用法。可以配置一个 `PostToolUse` 钩子，让 Codex 每次修改文件后自动运行格式化工具（如 `ruff format`, `prettier` 等），彻底解决“改了代码忘了格式化”的问题。
    > **配置示例**：在 `.codex/hooks.json` 或 `config.toml` 中，为 `PostToolUse` 事件添加匹配 `Edit` 工具的钩子。

*   **自动执行代码检查 (Lint)**：在 `PostToolUse` 钩子中运行 linter（如 `ruff check`, `eslint`），确保每次修改都不会引入新的代码问题。

*   **自动生成提交信息 (Commit Message)**：在任务完成或 `SessionEnd` 时，可以钩子脚本捕获对话摘要或变更内容，自动生成规范的 Git 提交信息。

### 🛡️ 安全与规范：为 AI 设置“安全护栏”
这类钩子像一个监督员，确保 AI 的操作符合规范，避免犯错。

*   **拦截危险命令**：通过 `PreToolUse` 钩子，可以实时分析 Codex 要执行的命令（如 `rm`），根据上下文判断是否危险并阻止执行。
*   **防止密钥泄露**：设置 `UserPromptSubmit` 钩子，扫描用户输入的提示词，一旦发现疑似 API 密钥（如 `sk-`、`ghp_`）的字符串，就立即阻止发送。
*   **自定义代码规范校验**：在 `Stop` 钩子中，可以对 Codex 的最终输出进行校验，确保其符合特定规范（如 JSON 格式正确）。

### ✨ 增强交互体验：让 AI 更有趣、更贴心
这类钩子主要为了提升使用体验，让 AI 助手更生动。

*   **AI 自动发表情包**：社区项目 **Codex Meme** 通过 `SessionStart`、`UserPromptSubmit` 和 `Stop` 钩子，能让 Codex 在合适的时候从你的本地素材库中挑选并发送表情包。
*   **AI 回复的“防呆”提醒**：社区钩子 **codex-516-hook** 用于检测并提醒用户，当 Codex 的推理过程在恰好 516 个 token 处被截断时，其回复可能不可靠。
*   **自定义音效/通知**：你可以在 `SessionStart`、`Stop` 等事件触发时播放特定音效，通过听觉反馈了解任务进度。
*   **生成对话摘要与持久记忆**：在 `SessionEnd` 时，可以用钩子自动总结对话并保存，为未来任务提供上下文。

### 🧩 进阶玩法：发挥无限创意
*   **日志与审计**：将所有工具调用、命令执行记录到日志系统，方便事后追踪和审计。
*   **与外部服务集成**：通过 `@codex-control/hooks` 这样的 npm 包，可以将钩子事件路由到外部服务（如一个本地 HTTP 服务器），实现更复杂的逻辑处理。
*   **根据目录定制提示词**：在不同的项目目录下，通过 `SessionStart` 钩子注入不同的提示词或规则。
*   **插件式钩子管理**：社区已有如 `@cerealbox/hooks` 这样的工具，旨在像管理 npm 包一样管理钩子，让分享和使用变得更简单。

### 💎 总结与资源
钩子的核心价值在于将“提醒”变成“强制”，将“手动”变为“自动”。它的强大之处在于：**只要你能用脚本描述一个任务，就能在 Codex 工作流的某个节点自动触发它**。

想要自己动手配置，可以查阅这些官方和社区资源：
*   **官方文档**：[OpenAI Codex Hooks](https://developers.openai.com/codex/hooks) 提供了完整的配置说明和事件列表。
*   **社区集合**：GitHub 上的 [`everything-openai-codex`](https://github.com/mturac/everything-openai-codex) 项目收集了许多钩子脚本和规则。
*   **探索发现**：在 GitHub 上搜索 “Codex hooks” 或 “codex-hook” 能找到更多有趣的社区项目。
