# Agent Team Orchestration - 快速参考指南 (Cheat Sheet)

> 快速查找常用命令、模式和代码片段

---

## 🚀 快速开始

```bash
# 验证系统
bash scripts/orchestration/test-agents.sh

# 启动研究
bash scripts/orchestration/research-launcher.sh "你的研究问题"

# 查看状态
python3 scripts/orchestration/agent-team-coordinator.py --list-agents
```

---

## 📋 常用命令

### 系统管理

| 命令 | 说明 |
|------|------|
| `bash scripts/orchestration/test-agents.sh` | 运行系统测试 |
| `python3 scripts/orchestration/agent-team-coordinator.py --list-agents` | 列出所有agents |
| `python3 scripts/orchestration/agent-team-coordinator.py --list-workflows` | 列出所有工作流 |
| `python3 scripts/orchestration/agent-team-coordinator.py --status AGENT_ID` | 查看agent状态 |

### 工作流执行

```bash
# 方法1: 使用启动脚本
bash scripts/orchestration/research-launcher.sh "研究问题"

# 方法2: 直接使用协调器
python3 scripts/orchestration/agent-team-coordinator.py \
  --workflow deep-research-analysis \
  --context '{"research_question": "Docker vs Podman"}'

# 方法3: 自定义输出目录
bash scripts/orchestration/research-launcher.sh \
  -o Research/my-project \
  "研究问题"
```

### tmux会话管理

```bash
# 列出所有会话
tmux ls

# 连接到会话
tmux attach-session -t obsidian-agents-EMP_R101

# 分离会话（保持运行）
# Ctrl+B, 然后按 D

# 杀死会话
tmux kill-session -t obsidian-agents-EMP_R101

# 查看会话日志
tmux capture-pane -t SESSION_NAME -p
```

### 日志查看

```bash
# 实时查看协调器日志
tail -f .agent-state/collaboration-logs/coordinator.log

# 查看最近的错误
grep ERROR .agent-state/collaboration-logs/coordinator.log | tail -20

# 查看工作流执行历史
cat .agent-state/collaboration-logs/workflow-executions.jsonl | jq -r | tail -10

# 查看协作日志
cat .agent-state/collaboration-logs/collaboration-log.jsonl | jq | tail -20
```

---

## 🔧 Python API速查

### 初始化协调器

```python
from pathlib import Path
from scripts.orchestration.agent_team_coordinator import AgentTeamCoordinator

coordinator = AgentTeamCoordinator(Path("/path/to/workspace"))
```

### 启动工作流

```python
result = coordinator.start_agent_team(
    workflow_id="deep-research-analysis",
    context={
        "research_question": "你的问题",
        "max_sources": 10
    }
)

# 检查结果
if result["success"]:
    print("成功!")
    print(result["final_context"])
else:
    print(f"失败: {result['error']}")
```

### Context Bridge

```python
from scripts.orchestration.context_bridge import ContextBridge

bridge = ContextBridge(Path(".agent-state"))

# 更新共享状态
bridge.update_shared_state("key", "value", "agent_id")

# 准备agent上下文
context = bridge.prepare_context_for_agent(
    agent_id="agent_1",
    task_description="任务描述"
)

# 更新agent输出
bridge.update_agent_output(
    agent_id="agent_1",
    output={"results": [...]},
    extract_to_shared=["key_findings"]
)
```

---

## 📝 Agent模板

### 基础模板

```markdown
---
name: my-agent
description: 简短描述
model: claude-sonnet-4-5
capabilities:
  - 能力1
  - 能力2
timeout: 600
tools:
  - Tool1
dependencies: []
---

# My Agent

## Purpose
[agent目的]

## Core Capabilities
[详细能力]

## Output Format
\`\`\`yaml
output:
  key_findings: [...]
  sources: [...]
  confidence: 0.8
\`\`\`

## Example
**输入**: "示例请求"
**输出**: 示例结果
```

### 研究类Agent模板

```markdown
---
name: EMP_R1XX_my-researcher
description: XXX研究专家，擅长XXX
model: claude-sonnet-4-5
capabilities:
  - 信息收集
  - 源评估
  - 快速阅读
timeout: 900
tools:
  - mcp__web-search-prime__webSearchPrime
dependencies: []
---

# XXX Researcher

## Purpose
专门进行XXX领域的信息收集和分析

## Core Capabilities
### 1. 搜索策略
- 查询优化
- 多源搜索

### 2. 信息评估
- 可信度评分
- 相关性判断

## Output Format
\`\`\`yaml
research_output:
  findings:
    - title: "发现标题"
      confidence: 0.9
      evidence: [...]
  sources:
    - url: "..."
      type: "official"
      credibility: 5
  output_context:
    key_insight: "关键洞察"
\`\`\`
```

---

## 🔄 工作流模板

### Pipeline工作流

```markdown
---
workflow_id: my-pipeline-workflow
name: My Pipeline Workflow
pattern: pipeline
agents:
  - agent_1
  - agent_2
  - agent_3
---

# Pipeline Workflow

Agent按顺序执行，每个等待前一个完成。

```

### Parallel工作流

```markdown
---
workflow_id: my-parallel-workflow
name: My Parallel Workflow
pattern: parallel
agents:
  - agent_1
  - agent_2
  - agent_3
---

# Parallel Workflow

Agents同时执行，完成后综合结果。
```

### Hybrid工作流

```markdown
---
workflow_id: my-hybrid-workflow
name: My Hybrid Workflow
pattern: hybrid
phases:
  - phase: phase1
    agents: [agent_1]
    sequential: true
  - phase: phase2
    agents: [agent_2, agent_3]
    parallel: true
  - phase: phase3
    agents: [agent_4]
    sequential: true
---

# Hybrid Workflow

结合顺序和并行执行。
```

---

## 🎯 常见模式

### 模式1: 研究模式

```python
# Planning → Research → Synthesis
workflow = "deep-research-analysis"
context = {"research_question": "..."}
```

### 模式2: 决策模式

```python
# Problem → Options → Analysis → Decision
workflow = "technical-decision-analysis"
context = {
    "decision_topic": "...",
    "options": ["A", "B", "C"]
}
```

### 模式3: 自定义模式

```python
# 手动编排
agents = ["agent_1", "agent_2", "agent_3"]
context = {}

for agent_id in agents:
    result = coordinator._run_agent_in_tmux(
        agent_id,
        context=context,
        wait=True
    )
    context.update(result["output_context"])
```

---

## 🐛 调试技巧

### 启用调试日志

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### 检查Agent状态

```bash
# 查看特定agent
python3 scripts/orchestration/agent-team-coordinator.py --status EMP_R101

# 查看所有agent
coordinator.get_status()
```

### 查看上下文

```bash
# 共享上下文
cat .agent-state/context-cache/shared-context.json | jq

# 特定agent上下文
cat .agent-state/context-cache/EMP_R101-context.json | jq
```

### 手动测试Agent

```bash
# 单独运行agent
claude agent agents/definitions/EMP_R101_web-researcher.md
```

---

## ⚙️ 配置

### 超时配置

```yaml
# 在agent定义中
timeout: 600  # 秒

# 在代码中
coordinator._run_agent_in_tmux(
    agent_id,
    context=context,
    wait=True
)
# 内部使用agent.timeout
```

### 源权重配置

```python
SOURCE_WEIGHTS = {
    "peer_reviewed_paper": 1.0,
    "official_documentation": 0.95,
    "academic_searcher": 0.9,
    "web_researcher": 0.75
}
```

### tmux配置

```python
coordinator = AgentTeamCoordinator(
    workspace=Path("."),
    tmux_base_session="custom-session-name"
)
```

---

## 📊 输出格式

### 研究报告结构

```markdown
# 研究报告

## 执行摘要
[2-3段话]

## 核心发现
### 1. 发现标题
**置信度**: ⭐⭐⭐⭐⭐
**详细说明**: ...

## 对比分析
| 维度 | 选项A | 选项B |
|------|-------|-------|

## 建议和结论
### 短期建议
- [建议]

### 后续研究
- [研究方向]
```

### ADR结构

```markdown
# ADR-XXX: 决策标题

## Status
accepted

## Context
[上下文]

## Decision
我们选择 [选项]

## Consequences
### 正面影响
- ✅ 影响

### 风险
- ⚠️ 风险 - 缓解措施
```

---

## 🔍 故障排除

| 问题 | 命令/解决方案 |
|------|-------------|
| Agent无法启动 | `tmux -V` 检查安装 |
| 上下文丢失 | 检查 `.agent-state/` 权限 |
| 工作流卡住 | `tmux kill-session -t SESSION` |
| 测试失败 | 运行 `bash scripts/orchestration/test-agents.sh` |
| 找不到模块 | 使用 `importlib.util.spec_from_file_location` |

---

## 📚 文档链接

- [完整开发指南](./DEVELOPER_GUIDE.md)
- [系统README](./README.md)
- [实施总结](../IMPLEMENTATION_SUMMARY.md)

---

## 🎨 颜色和图标

```bash
# 日志级别
INFO  - 蓝色
WARN  - 黄色
ERROR - 红色
SUCCESS - 绿色

# Agent状态
✓ PASS
✗ FAIL
⊘ SKIP
⚠ WARNING
🚀 Running
📊 Reporting
```

---

## 💡 提示和技巧

### 性能优化

- 并行执行独立agents
- 使用 `max_history_entries` 限制历史
- 为临时数据设置TTL
- 定期清理过期上下文

### 最佳实践

- Agent保持单一职责
- 明确定义输入输出格式
- 使用文档字符串
- 添加适当的日志
- 测试你的agents

### 常见陷阱

- ❌ Agent职责过多
- ❌ 上下文传递混乱
- ❌ 忘记提取到共享状态
- ❌ 超时设置过短
- ❌ 缺少错误处理

---

## 🔄 版本控制

```bash
# 查看更改
git status

# 提交
git add agents/ scripts/orchestration/
git commit -m "feat: add new agent/workflow"

# 推送
git push
```

---

**更新**: 2025-02-13
**版本**: 1.0.0
