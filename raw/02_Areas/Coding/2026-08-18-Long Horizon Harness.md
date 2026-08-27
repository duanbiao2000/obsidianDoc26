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


直接回答：**目前没有一个完全叫 “StateM” 的开源项目，能直接一键安装就得到论文里那套完整的 “YAML + CLI + hooks + agent-owned DIY control layer + state as context-and-contract boundary” 的 harness。** [github](https://github.com/AMAP-ML/LongHorizon-Harness)

但你可以用几类开源项目 **拼出几乎相同的设计思路**，并且已经在生产环境里被不少人实际使用。

***

## 1）最接近你描述的现成项目

### LongHorizon-Harness（lh-harness）

- GitHub：`AMAP-ML/LongHorizon-Harness`  
- 定位：给现有 CLI agent（Claude Code、Codex CLI、OpenClaw 等）套一层 **执行 + 状态管理 + 验证** 的外壳，专门用于长程任务。 [github](https://github.com/AMAP-ML/LongHorizon-Harness)
- 关键特性：
  - **CLI 驱动**：`lh-harness run --task @task.md --agent claude_code ...`
  - 支持 **MCP server** 作为工具层（GUI / 桌面 / 终端等）。
  - 强调 **状态外置**（不靠模型上下文隐式记）、**持续推进任务**、**结果验证**。
  - 文档里明确说它不训练新模型，而是 “run on top of systems such as Codex and Claude Code”。 [github](https://github.com/AMAP-ML/LongHorizon-Harness)
- 与你描述的 StateM 设计对应关系：
  - “YAML/Markdown 任务描述” → `task.md` 或类似任务文件；
  - “CLI + hooks” → 有 CLI 入口，内部有 manage–execute–audit 循环，可视为一种 hook 机制；
  - “State as context-and-contract boundary” → 把任务状态放在外部数据结构中，只在验证通过时才写入；
  - “Keep agent on track until finish” → 通过持续审计和验证，防止过早停止或跑偏。 [github](https://github.com/AMAP-ML/LongHorizon-Harness)

如果你想要一个 **已经能跑、文档完整、社区有一定使用量** 的 long-horizon harness，这是目前最接近“开箱即用”的选择。

***

## 2）“YAML + CLI + hooks”风格的 agent 控制层项目

这些项目不一定自称 long-horizon，但架构理念非常接近你写的那一行：

### agent-runbook

- GitHub：`agent-runbook`（在 `bradAGI/awesome-cli-coding-agents` 里被收录）  
- 核心思路：用 **contract-based YAML runbook** 描述任务/流程，然后编译成 `SKILL.md` 给 Claude Code / Codex 使用。 [github](https://github.com/bradagi/awesome-cli-coding-agents)
- 对应点：
  - **YAML 作为契约**：定义步骤、条件、检查点；
  - **CLI 工具**：把 YAML 编译成 agent 可读的技能文档；
  - 可以视作一种 “DIY control layer”，让 agent 按预定流程执行。

适合你想自己设计“任务契约 + 流程控制”的场景。

***

### sd0x-dev-flow

- GitHub：`sd0x-dev-flow`（在 `Picrew/awesome-agent-harness` 列表中被标注为：hooks, state-machine, claude-code） [github](https://github.com/Picrew/awesome-agent-harness)
- 特性：
  - 为 Claude Code 增加一层 **hook-enforced dual review**；
  - 使用 **durable state-machine gates** 控制流程；
  - 有 **context-compaction recovery** 和 **fail-closed safety**。
- 对应点：
  - “hooks + state-machine” 非常贴近你说的 “agent-owned DIY control layer”；
  - 强调状态机门控和安全策略，适合对风险控制要求高的场景。

***

### hankweave

- GitHub：`hankweave`（在 `Picrew/awesome-agent-harness` 中标注为：long-horizon, runtime, checkpoints） [github](https://github.com/Picrew/awesome-agent-harness)
- 定位：**headless-first long-horizon runtime**，编排现有 agent harness。
- 特性：
  - 使用 **sentinels, loops, checkpoints, event journals**；
  - 更像是一个“上层编排器”，可以挂在多个 agent 上面。
- 对应点：
  - “checkpoint + event journal” 就是显式状态和审计日志；
  - 适合你想把多个 agent / 多个 harness 统一成长程工作流。

***

### DeerFlow / deepagents / holaOS 等

在 `Picrew/awesome-agent-harness` 列表里还有一批项目，都围绕 long-horizon 设计： [github](https://github.com/Picrew/awesome-agent-harness)

- **DeerFlow**：long-horizon super-agent harness，集成 memory、tools、subagents、sandboxes。
- **deepagents**：long-running、tool-using agents，带 planning 和 subagent 模式。
- **holaOS**：desktop-first long-horizon agent environment，强调 durable state。

如果你更偏向“桌面/本地环境里的长程 agent”，可以重点看 holaOS 这类。

***

## 3）如果你想要“StateM 风格”的 DIY harness，可以怎么搭？

结合论文里的描述和现有开源生态，一个实用的组合方案是：

1. **任务契约层（YAML/Markdown）**  
   - 用 `agent-runbook` 或自建 YAML schema，定义：
     - 任务目标、成功条件；
     - 阶段划分（phase）；
     - 每个阶段的输入/输出、检查点；
     - 允许/禁止的操作列表。
2. **执行层（CLI agent + hooks）**  
   - 选一个 CLI agent：Claude Code / Codex CLI / OpenCode 等；
   - 用 `sd0x-dev-flow` 或自写 hook 系统，在以下位置插桩：
     - before/after model call；
     - before/after tool call；
     - task start/stop；
   - 在 hook 里做：
     - 状态快照；
     - 权限/策略检查；
     - 日志与审计。
3. **状态与验证层（state as contract boundary）**  
   - 参考 `LongHorizon-Harness` 的设计：
     - 外部状态存储（JSON/SQLite/简单 KV）；
     - 只在验证通过时才更新状态；
     - 使用独立检查脚本/测试来验证阶段性成果。
4. **编排与恢复（runbook + checkpoint）**  
   - 用 `hankweave` 或自建简单调度器：
     - 按 runbook 推进阶段；
     - 失败时回滚到最近 checkpoint；
     - 记录 event journal，便于事后审计和复用。

这样搭出来的系统，本质上就是“StateM 思路的工程实现版”，只是名字不叫 StateM。

***

## 4）从哪里开始最省事？

如果你想 **尽快在实际项目里用起来**，建议顺序：

1. 先试 **LongHorizon-Harness**：  
   - 已有 CLI、文档和示例任务；  
   - 直接跑在 Claude Code / Codex 上，体验长程任务的状态管理和验证。 [github](https://github.com/AMAP-ML/LongHorizon-Harness)
2. 再看 **sd0x-dev-flow** 或 **agent-runbook**：  
   - 如果你特别在意 “YAML 契约 + hooks + state-machine” 这一层，可以在这两个项目上做二次开发。 [github](https://github.com/Picrew/awesome-agent-harness)
3. 需要多 agent / 多 harness 编排时，再引入 **hankweave / DeerFlow** 等。 [github](https://github.com/Picrew/awesome-agent-harness)

如果你愿意，我可以根据你当前的技术栈（WSL/Python/Node、常用 agent CLI）帮你画一个最小可行 harness 的目录结构和示例 YAML/CLI/hook 代码骨架，方便你直接开干。