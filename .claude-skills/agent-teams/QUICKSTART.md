# Agent Teams - 快速入门指南

## 技能已就绪！

📍 **位置**：`~/.agents/skills/agent-teams/`
📦 **打包**：`/tmp/agent-teams.skill`
✅ **状态**：已验证，立即可用

---

## 30 秒上手

### 方式 1：交互式创建（最简）

直接告诉 Claude 您需要什么：

```
您："创建一个 6 人团队做产品调研"

Claude 会自动：
1. 理解：需要产品架构师、技术负责人、批判者、改进者、决策者
2. 配置：按照 5-7 人黄金法则分配角色
3. 启动：创建对应的 agent 子进程
4. 协作：让 agent 间通过假设竞争对话协作
```

### 方式 2：声明式配置（更灵活）

创建 `.team.yaml` 文件：

```yaml
name: product-research-team
description: 产品调研团队（6 人）
team_size: 6

mode: dag

agents:
  # 构建者（2 人）
  - name: product-architect
    role: 产品架构师
    tasks:
      - research: "竞品功能分析"
        output: research/competitive.md

  - name: tech-lead
    role: 技术负责人
    tasks:
      - assess: "技术可行性评估"
        output: research/feasibility.md

  # 批判者（2 人）
  - name: devils-critic
    role: 魔鬼式批判者
    critical_thinking_style:
      skepticism: 0.9
    tasks:
      - challenge: "质疑方案假设"
        input: [research/competitive.md, research/feasibility.md]

  - name: risk-analyst
    role: 风险分析师
    tasks:
      - analyze: "风险评估"
        input: [research/competitive.md]

  # 改进者（1 人）
  - name: issue-improver
    role: 问题改进专员
    tasks:
      - improve: "流程优化建议"
        output: improvements/workflow.md

  # 整合者（1 人）
  - name: result-synthesizer
    role: 结果综合者
    depends_on: [product-architect, tech-lead, devils-critic, risk-analyst]
    tasks:
      - synthesize: "综合调研报告"
        output: FINAL_REPORT.md
```

然后运行：
```bash
/team-launch product-research-team
```

---

## 常见使用场景

### 场景 1：快速原型开发（5 人）

```
您："我要 5 个人快速开发一个 MVP"

→ Claude 创建：
  - 2 名全栈开发者（构建者）
  - 1 名快速批判者（批判者）
  - 1 名流程改进者（改进者）
  - 1 名敏捷决策者（整合者）
```

### 场景 2：技术调研（7 人上限）

```
您："深入调研 React 19、Vue 4、Svelte 5"

→ Claude 创建：
  - 2 名领域研究员（前端+后端）
  - 2 名批判者（技术+方法论）
  - 2 名改进者（实践+探索）
  - 1 名综合者
```

### 场景 3：代码审查（5 人）

```
您："5 人审查 PR，关注安全、性能、架构、测试"

→ Claude 创建：
  - 4 名审查专家（各维度）
  - 1 名报告汇总者
```

---

## 团队规模速查表

| 人数 | 适用场景 | 角色分配 |
|------|---------|---------|
| **5 人** | 快速交付、单一领域 | 2 构建 + 1 批判 + 1 改进 + 1 整合 |
| **6 人** ⭐ | 平衡创新和执行 | 2 构建 + 2 批判 + 1 改进 + 1 整合 |
| **7 人** | 跨域深度探索 | 2 构建 + 2 批判 + 2 改进 + 1 整合 |

**超过 7 人？** 考虑拆分为多个子团队（Team of Teams）

---

## 角色速查表

### 构建者（Builders）
- **Solution Architect**：架构设计
- **Feature Developer**：功能实现
- **Domain Researcher**：领域研究

### 批判者（Critics）
- **Devil's Critic**：技术批判（what-if 场景）
- **Risk Analyst**：风险分析

### 改进者（Improvers）
- **Issue Improver**：流程优化
- **New Feature Specialist**：创新探索

### 整合者（Synthesizers）
- **Decision Facilitator**：促进决策
- **Result Synthesizer**：综合结果

---

## 下一步

1. **尝试交互式**：直接告诉 Claude 您的团队需求
2. **查看示例**：`references/examples.md` 包含 10+ 完整示例
3. **理解模式**：`references/patterns.md` 深入讲解协作模式
4. **定制配置**：`references/schema.md` 完整配置参考

---

## 故障排查

**问题：技能未触发**
- 检查 `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true`
- 确认技能路径正确

**问题：Agent 启动失贩**
- 使用 `/team-status` 查看状态
- 使用 `/team-logs` 查看日志

**问题：沟通效率低**
- 检查团队规模（建议 5-7 人）
- 确认角色配置平衡（避免过多同类角色）

---

## 高级技巧

### 启用假设竞争

```yaml
team_dynamics:
  assumption_competition:
    enabled: true
    trigger_conditions:
      - on_proposal
      - on_decision
    competition_formats:
      - direct_dialogue
      - structured_debate
```

### 自定义角色特性

```yaml
agents:
  - name: custom-agent
    personality:
      visionary: 0.8        # 见性
      pragmatic: 0.6        # 实用
      skepticism: 0.9        # 批判态度
      risk_averse: 0.7       # 风险厌恶
```

### 调整批判强度

```yaml
- name: devils-critic
    critical_thinking_style:
      skepticism: 0.9        # 0-1，越高越批判
      constructive: 0.7       # 0-1，建设性
      scenarios: what_if      # what_if | why_not | how_might
```

---

**需要更多帮助？** 查看主文档 `SKILL.md` 或参考文档！
