# Agent Team Orchestration System

## 概述

Agent Team Orchestration System 是一个多Agent协作编排系统，用于将现有的agents从"被动工具"升级为"主动协作团队"。该系统支持：

- **多Agent协作编排** - 协调多个专门化agents共同完成复杂任务
- **灵活的执行模式** - 支持Pipeline（流水线）、Parallel（并行）、Hybrid（混合）模式
- **上下文管理** - Agent间的状态传递和共享
- **持久化会话** - 基于tmux的长期运行agent会话
- **研究工作流** - 专门的研究/分析任务优化

## 目录结构

```
/mnt/d/MyDocs/obsidianDoc26/
├── agents/
│   ├── definitions/          # Agent定义文件
│   │   ├── EMP_R001_research-planner.md
│   │   ├── EMP_R101_web-researcher.md
│   │   ├── EMP_R102_academic-searcher.md
│   │   ├── EMP_R103_codebase-analyzer.md
│   │   ├── EMP_S001_information-synthesizer.md
│   │   └── EMP_S003_report-generator.md
│   └── workflows/            # 工作流定义
│       ├── deep-research-analysis.md
│       └── technical-decision-analysis.md
├── scripts/
│   └── orchestration/       # 核心编排脚本
│       ├── agent-team-coordinator.py    # 主协调器
│       ├── context-bridge.py             # 上下文桥接器
│       ├── result-synthesizer.py         # 结果综合器
│       ├── research-launcher.sh          # 研究工作流启动器
│       └── test-agents.sh                # 测试脚本
├── .agent-state/            # Agent状态持久化
│   ├── context-cache/
│   ├── task-queue/
│   └── collaboration-logs/
└── Research/                # 研究输出
    ├── projects/
    ├── outputs/
    └── drafts/
```

## 快速开始

### 1. 系统要求

- Python 3.8+
- tmux (可选，用于持久化会话)
- Claude CLI (claude)

### 2. 安装tmux（如果需要）

```bash
# Ubuntu/Debian
sudo apt-get install tmux

# macOS
brew install tmux
```

### 3. 运行测试

```bash
cd /mnt/d/MyDocs/obsidianDoc26
bash scripts/orchestration/test-agents.sh
```

### 4. 启动研究工作流

```bash
# 研究Agent Orchestration框架
bash scripts/orchestration/research-launcher.sh \
  "2024年最新的Agent Orchestration框架对比"

# 指定输出目录
bash scripts/orchestration/research-launcher.sh \
  -o Research/langgraph \
  "LangGraph框架架构和使用方法"
```

## 核心组件

### 1. Agent Team Coordinator

主协调器，负责管理多Agent工作流的执行。

```bash
# 列出所有agents
python3 scripts/orchestration/agent-team-coordinator.py --list-agents

# 列出所有工作流
python3 scripts/orchestration/agent-team-coordinator.py --list-workflows

# 启动工作流
python3 scripts/orchestration/agent-team-coordinator.py \
  --workflow deep-research-analysis

# 查看agent状态
python3 scripts/orchestration/agent-team-coordinator.py --status EMP_R101
```

### 2. Context Bridge

管理Agent间的上下文传递和状态共享。

```python
from pathlib import Path
from scripts.orchestration.context_bridge import ContextBridge

# 初始化
state_dir = Path(".agent-state")
bridge = ContextBridge(state_dir)

# 更新共享状态
bridge.update_shared_state("research_topic", "Agent Orchestration", "user")

# 准备agent上下文
context = bridge.prepare_context_for_agent(
    agent_id="EMP_R101_web-researcher",
    task_description="搜索最新的agent orchestration框架"
)

# 获取agent输出
outputs = bridge.get_agent_outputs(["EMP_R101", "EMP_R102"])
```

### 3. Result Synthesizer

综合多个源的结果，应用加权策略和冲突解决。

```python
from scripts.orchestration.result_synthesizer import ResultSynthesizer

synthesizer = ResultSynthesizer(context_bridge)

# 综合结果
synthesis = synthesizer.synthesize(
    results=[...],
    strategy="weighted_confidence"
)
```

## 工作流

### 深度研究分析 (Deep Research Analysis)

适用于复杂技术主题的深入研究，采用混合式编排：

```
Phase 1: 研究规划 (research-planner)
    ↓
Phase 2: 并行调研 (web-researcher + academic-searcher + codebase-analyzer)
    ↓
Phase 3: 信息综合 (information-synthesizer)
    ↓
Phase 4: 报告生成 (report-generator)
```

### 技术决策分析 (Technical Decision Analysis)

系统化的技术决策流程：

```
Stage 1: 问题定义
    ↓
Stage 2: 选项生成
    ↓
Stage 3: 并行评估 (成本 + 性能 + 可维护性 + 风险)
    ↓
Stage 4: 推荐决策
    ↓
Stage 5: ADR撰写
```

## Agent定义

### 研究类Agents

| Agent ID | 名称 | 职责 |
|----------|------|------|
| EMP_R001 | research-planner | 制定研究计划和策略 |
| EMP_R101 | web-researcher | Web搜索和信息收集 |
| EMP_R102 | academic-searcher | 学术文献搜索和分析 |
| EMP_R103 | codebase-analyzer | 代码库结构分析 |

### 综合类Agents

| Agent ID | 名称 | 职责 |
|----------|------|------|
| EMP_S001 | information-synthesizer | 多源信息综合和洞察提取 |
| EMP_S003 | report-generator | 生成结构化研究报告 |

## 创建自定义Agent

### 1. 创建Agent定义文件

在 `agents/definitions/` 下创建新的 `.md` 文件：

```markdown
---
name: my-custom-agent
description: 我的自定义agent描述
model: claude-sonnet-4-5
capabilities:
  - 能力1
  - 能力2
timeout: 600
tools:
  - Tool1
  - Tool2
dependencies: []
---

# Agent名称

## Purpose
[这个agent的目的]

## Core Capabilities
[详细描述能力]

## Workflow
[工作流程描述]

## Output Format
[输出格式规范]
```

### 2. 在工作流中使用

在工作流定义文件中添加你的agent：

```yaml
agents:
  - EMP_R001_research-planner
  - my-custom-agent  # 添加你的agent
  - EMP_S001_information-synthesizer
```

## 监控和调试

### 查看tmux会话

```bash
# 列出所有会话
tmux ls

# 连接到会话
tmux attach-session -t obsidian-agents-EMP_R101

# 杀死会话
tmux kill-session -t obsidian-agents-EMP_R101
```

### 查看日志

```bash
# 协调器日志
cat .agent-state/collaboration-logs/coordinator.log

# 工作流执行日志
cat .agent-state/collaboration-logs/workflow-executions.jsonl

# 协作日志
cat .agent-state/collaboration-logs/collaboration-log.jsonl
```

### 查看上下文状态

```bash
# 共享上下文
cat .agent-state/context-cache/shared-context.json

# 特定agent上下文
cat .agent-state/context-cache/EMP_R101-context.json
```

## 配置

### tmux会话配置

在 `agent-team-coordinator.py` 中修改：

```python
coordinator = AgentTeamCoordinator(
    workspace=Path("."),
    tmux_base_session="obsidian-agents"  # 修改基础会话名
)
```

### Agent超时配置

在agent定义的frontmatter中修改：

```yaml
timeout: 1200  # 超时时间（秒）
```

## 高级用法

### Loki Mode集成

将RARV循环应用于agent团队的自我改进：

```yaml
rarv_loop:
  reason: 分析研究需求，规划最佳路径
  act: 执行多维度并行研究
  reflect: 评估研究质量和覆盖度
  verify: 验证结论的可靠性
  learn: 提炼改进策略，更新研究框架
```

### 定时任务调度

结合cron或task-scheduler.py实现定时研究任务：

```bash
# 每日知识同步
0 9 * * * cd /mnt/d/MyDocs/obsidianDoc26 && bash scripts/orchestration/research-launcher.sh "每日技术动态"
```

## 故障排除

### 问题：Agent无法启动

1. 检查agent定义文件语法是否正确
2. 检查所需的tools是否可用
3. 查看coordinator日志

### 问题：tmux会话失败

1. 确认tmux已安装：`tmux -V`
2. 检查会话是否已存在：`tmux ls`
3. 手动清理会话：`tmux kill-session -t session-name`

### 问题：上下文传递失败

1. 检查 `.agent-state/` 目录权限
2. 确认context-cache目录存在
3. 查看collaboration-log.jsonl中的错误

## 扩展计划

- [ ] 添加更多研究agents（如专利搜索、案例研究）
- [ ] 实现分布式agent执行（多机器）
- [ ] 添加Web UI监控界面
- [ ] 集成更多数据源（数据库、API）
- [ ] 实现agent性能分析工具

## 相关资源

- [Loki Mode自动化开发模式](Journals/Loki-mode自动化开发模式.md)
- [Claude Code文档](https://code.anthropic.com)
- [agents-main插件生态](agents-main/)

## 许可

本系统是个人知识管理平台的一部分，仅供个人使用。

---

*最后更新: 2025年1月*
