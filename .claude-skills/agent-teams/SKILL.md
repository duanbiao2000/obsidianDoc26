---
name: agent-teams
description: Claude Code Agent Teams 协同编排系统。支持多 Agent 协同工作、并行任务调度、团队状态监控和预定义模板。使用场景：(1) 用户请求启动多个 agent 并行工作，(2) 需要编排复杂的 agent 工作流程，(3) 创建可复用的 agent 团队配置，(4) 监控和管理多个 agent 的执行状态，(5) 通过交互式或声明式配置 agent 团队结构
---

# Agent Teams

## Overview

Agent Teams 是 Claude Code 的多 Agent 协同编排系统，通过实验性功能 `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS` 启用。本技能提供完整的团队管理能力：从交互式快速创建到声明式复杂配置，从并行调度到流水线编排，从实时监控到模板复用。

## Team Size Guidelines（团队规模指南）

### 黄金法则：5-7 人团队

**核心理念：** 对于中型以下项目，团队规模应维持在 **5-7 个 agent**。这是基于以下理论和实践验证的最佳实践：

**理论依据：**

- **亚马逊"两个披萨"原则**：一个团队不应该大于两个披萨能喂饱的人数（约 6-8 人）
- **邓巴数理论**：5±2 规则是最优的社交协作规模
- **沟通复杂度**：n 人团队的沟通渠道是 n(n-1)/2，超过 7 人时沟通开销激增

**实践优势：**
✅ **沟通效率**：无需复杂的分层结构，信息传递快
✅ **协作紧密**：每个人都了解其他人的工作，易于形成共识
✅ **决策迅速**：减少协调成本，快速迭代
✅ **灵活性高**：易于根据项目需求调整角色和职责
✅ **问责清晰**：每个人的贡献可见可衡量

**规模上限原因：**
❌ **超过 7 人**：

- 需要引入管理层次（Team Lead → Subteams）
- 沟通成本显著上升（会议、文档、对齐）
- 出现"社交怠惰"（Social Loafing）
- 角色边界模糊，责任分散

**典型 5-7 人团队配置见 [Optimal Team Configs](patterns.md#最佳团队配置)**

## Quick Start

### 交互式创建团队

最快的启动方式，适合简单场景：

```
用户: "创建一个 3 人团队：一个研究前端框架，一个分析性能，一个写文档"
```

Claude 会自动：

1. 理解任务需求
2. 识别可并行/串行的任务
3. 启动相应的 agent 子进程
4. 监控执行状态
5. 汇总结果

### 声明式配置

适合复杂或可复用的团队结构。创建 `.team.yaml` 文件：

```yaml
name: fullstack-research
description: 全栈技术调研团队

agents:
  - name: frontend-researcher
    role: 前端技术调研
    tasks:
      - research: "React 19 新特性"
        output: docs/react19-features.md
      - compare: "React vs Vue vs Svelte"
        output: docs/framework-comparison.md

  - name: performance-analzer
    role: 性能分析专家
    depends_on: frontend-researcher
    tasks:
      - analyze: "各框架性能基准测试"
        input: docs/framework-comparison.md
        output: docs/performance-benchmarks.md

  - name: doc-writer
    role: 技术文档撰写
    depends_on: [frontend-researcher, performance-analzer]
    tasks:
      - compile: "整合调研报告"
        input: [docs/react19-features.md, docs/performance-benchmarks.md]
        output: FINAL_REPORT.md
```

然后运行：`/team-launch fullstack-research.team.yaml`

详细配置模式见 [Team Schema](schema.md)。

## Core Capabilities

### 1. Agent 协同编排

#### 团队角色哲学

**核心理念：** Agent Teams 采用**对等协作 + 角色多元化**的团队模式，而非传统的中心化指挥模式。每个 agent 都有独特的个性和领域视角，团队通过**假设竞争**和**批判性对话**达成更优决策。

**团队角色分类：**

| 角色类别 | 代表角色 | 核心价值 | 思维方式 |
|---------|---------|---------|---------|
| **构建者** | Solution Architect, Feature Developer | 创造和实现方案 | 如何做？有什么可能性？ |
| **批判者** | Devil's Critic, Risk Analyst | 质疑和挑战假设 | 如果假设错误会怎样？有什么风险？ |
| **改进者** | Issue Improver, New Feature Specialist | 优化和增强 | 怎样做得更好？有什么创新空间？ |
| **整合者** | Decision Facilitator, Result Synthesizer | 聚合和协调 | 如何整合不同观点？ |

**假设竞争机制：**

```
┌─────────────────────────────────────────┐
│         假设竞争对话                      │
├─────────────────────────────────────────┤
│                                         │
│  Solution Architect: "我建议用 React 19"    │
│  ↓                                       │
│  Devil's Critic: "如果 Server Components   │
│                    集成困难怎么办？"            │
│  ↓                                       │
│  Issue Improver: "是否可以分阶段迁移？    │
│                    先用 Class Components?"      │
│  ↓                                       │
│  Risk Analyst: "分阶段会增加什么风险？"  │
│  ↓                                       │
│  Result Synthesizer: "综合各方观点，我   │
│                     提出混合方案..."        │
│                                         │
├─────────────────────────────────────────┘
```

**详细角色配置：**

```yaml
agents:
  # 构建者角色
  - name: solution-architect
    role: 方案架构师
    responsibilities:
      - design_solution
      - propose_architecture
      - identify_opportunities
    personality:
      visionary: 0.8          # 愿见性评分（0-1）
      pragmatic: 0.6          # 实用性评分
      risk_tolerance: 0.5     # 风险容忍度

  - name: feature-developer
    role: 特性开发者
    responsibilities:
      - implement_features
      - technical_feasibility_check
    personality:
      detail_oriented: 0.9    # 细节导向
      creative: 0.7           # 创造性
      quality_focused: 0.8     # 质量导向

  # 批判者角色
  - name: devils-critic
    role: 魔鬼式批判者
    responsibilities:
      - challenge_assumptions
      - stress_test_solution
      - identify_failure_modes
    critical_thinking_style:
      skepticism: 0.9         # 怀疑态度（0-1）
      constructive: 0.6         # 建设性（而非纯否定）
      scenarios: what_if         # What-If 场景式批判

  - name: risk-analyst
    role: 风险分析师
    responsibilities:
      - identify_technical_risks
      - assess_impact
      - propose_mitigation
    critical_thinking_style:
      risk_averse: 0.8        # 风险厌恶
      data_driven: 0.7         # 数据驱动
      defensive: 0.6            # 防御性思维

  # 改进者角色
  - name: issue-improver
    role: 问题改进专员
    responsibilities:
      - identify_improvement_ops
      - propose_enhancements
      - optimize_existing_solution
    improvement_thinking_style:
      incremental: 0.7         # 增量式改进
      innovative: 0.6           # 创新性改进
      user_focused: 0.9        # 用户导向

  - name: new-feature-specialist
    role: 新特性专员
    responsibilities:
      - propose_new_features
      - identify_innovation_ops
      - explore_emerging_techs
    innovation_thinking_style:
      trend_aware: 0.8         # 趋势感知
      experimental: 0.7          # 实验性
      value_focused: 0.8         # 价值导向

  # 整合者角色
  - name: decision-facilitator
    role: 决策促进者
    responsibilities:
      - facilitate_dialogue
      - synthesize_perspectives
      - guide_consensus
    facilitation_style:
      neutral: 0.9             # 中立性
      inclusive: 0.8           # 包容性
      clarifying: 0.8          # 澄清能力

  - name: result-synthesizer
    role: 结果综合者
    responsibilities:
      - aggregate_insights
      - resolve_conflicts
      - generate_integrated_output
    synthesis_style:
      holistic: 0.8            # 整体性
      balanced: 0.9            # 平衡性
      actionable: 0.8          # 可执行性
```

**假设竞争配置：**

```yaml
team_dynamics:
  # 假设竞争机制
  assumption_competition:
    enabled: true

    # 竞争触发
    trigger_conditions:
      - on_proposal               # 方案权出时
      - on_decision               # 决策点时
      - on_critique               # 批判时
      - on_challenge              # 挑战时

    # 竞争形式
    competition_formats:
      - direct_dialogue          # 直接对话
      - structured_debate         # 结构化辩论
      - perspective_taking        # 角角互换
      - red_team_blue_team       # 红蓝对抗

    # 质量规则
    constructive_rules:
      - critique_solution_not_person      # 批判方案不批判人
      - provide_alternatives               # 批判同时提供建设
      - evidence_based                     # 基于证据
      - respect_expertise                  # 尊重专业经验

  # 批判性对话格式
  critical_dialogue:
    # 阶段 1: 方案权出
    stage_1_proposal:
      active_roles: [solution-architect, feature-developer]
      listener_roles: [devils-critic, risk-analyst]
      output: proposal_document

    # 阶段 2: 批判性质疑
    stage_2_critique:
      active_roles: [devils-critic, risk-analyst]
      listener_roles: [solution-architect, feature-developer]
      critique_dimensions:
        - technical_feasibility
        - cost_risks
        - time_constraints
        - scalability
        - maintainability
        - security
        - user_experience
      output: critique_document

    # 阶段 3: 改进建议
    stage_3_improvement:
      active_roles: [issue-improver, new-feature-specialist]
      listener_roles: [solution-architect, feature-developer, devils-critic]
      improvement_dimensions:
        - optimization_ops
        - enhancement_ops
        - innovation_ops
      output: improvement_document

    # 阶段 4: 整合决策
    stage_4_synthesis:
      active_roles: [decision-facilitator, result-synthesizer]
      listener_roles: all
      synthesis_method: balanced_perspectives  # balanced_perspectives | weighted_voting | consensus
      output: decision_document
```

**详细说明见 [Critical Collaboration Patterns](patterns.md#批判性协作模式)**

#### 协同模式

**并行模式 (Parallel)**

```yaml
mode: parallel
agents:
  - name: agent-a
  - name: agent-b
  - name: agent-c
```

所有 agent 同时启动，适用于独立任务。

**流水线模式 (Pipeline)**

```yaml
mode: pipeline
agents:
  - name: research-agent
    next: analzer-agent
  - name: analzer-agent
    next: writer-agent
  - name: writer-agent
```

顺序执行，每个 agent 的输出传递给下一个。

**依赖图模式 (DAG)**

```yaml
mode: dag
agents:
  - name: researcher
  - name: analzer-a
    depends_on: researcher
  - name: analzer-b
    depends_on: researcher
  - name: writer
    depends_on: [analzer-a, analzer-b]
```

复杂依赖关系，支持多对多。

详细协同时式和策略见 [Coordination Patterns](patterns.md)。

#### 上下文传递

Agent 间传递数据的三种方式：

**1. 文件传递（推荐）**

```yaml
agents:
  - name: producer
    output_file: research/data.json
  - name: consumer
    input_files: [research/data.json]
```

**2. 任务结果传递**

```yaml
agents:
  - name: upstream
    returns: findings
  - name: downstream
    receives_from: upstream.findings
```

**3. 共享状态**

```yaml
shared_state:
  database: .team-state/db.json
agents:
  - name: agent-a
    reads: [config, progress]
    writes: [results]
  - name: agent-b
    reads: [results]
    writes: [summary]
```

### 2. 并行任务调度

#### 自动并行识别

Claude 自动分析任务依赖图，识别可并行执行的任务：

```
用户: "调研 React、Vue、Svelte 的性能"
```

Claude 会识别出这是三个独立任务，启动三个并行 agent。

#### 显式并行控制

在配置中显式指定并行度：

```yaml
scheduling:
  max_parallel: 3
  queue_strategy: priority

agents:
  - name: agent-a
    priority: 1
  - name: agent-b
    priority: 2
  - name: agent-c
    priority: 1
```

**调度策略：**

- `fifo`: 先进先出
- `priority`: 基于优先级
- `dependency-aware`: 智能依赖感知调度

#### 负载均衡

```yaml
load_balancing:
  strategy: round_robin  # | least_loaded | dynamic
  resource_thresholds:
    cpu: 80%
    memory: 70%
```

### 3. 团队状态监控

#### 实时状态追踪

每个 Agent 有以下状态：

- `pending`: 等待启动
- `running`: 执行中
- `completed`: 成功完成
- `failed`: 失败
- `blocked`: 等待依赖

#### 监控接口

**查看团队状态：**

```
/team-status
```

**查看单个 Agent：**

```
/team-status <team-name> --agent <agent-name>
```

**实时日志：**

```
/team-logs <team-name> --follow
```

#### 结果汇总

```yaml
reporting:
  format: markdown  # | json | html
  include:
    - agent_outputs
    - execution_time
    - resource_usage
    - errors_and_warnings
  output: TEAM_REPORT.md
```

### 4. Agent 团队模板

#### 批判性思考角色 (Devil's Advocate/Issue 专员)

**核心概念：** 在团队中引入一个特殊的"批判者"角色，负责质疑假设、提出替代方案、识别风险。这是保证发散性思考和避免群体思维的关键。

```yaml
agents:
  # ... 其他 agents ...

  - name: devils-advocate
    role: 假设性竞争代理 / Issue 专员
    responsibilities:
      - challenge_assumptions      # 质疑基本假设
      - propose_alternatives       # 提出替代方案
      - identify_risks            # 识别潜在风险
      - stress_test_solution      # 压力测试方案
      - ensure_divergency          # 确保发散性思考

    # 批判维度
    critical_dimensions:
      - technical_feasibility    # 技术可行性
      - cost_risks               # 成本风险
      - time_constraints          # 时间约束
      - scalability               # 可扩展性
      - maintainability           # 可维护性
      - security                  # 安全性
      - user_experience           # 用户体验
      - market_fit                # 市场契合度

    # 批判时机
    critique_points:
      - during_planning            # 计划阶段
      - after_proposal            # 方案提出后
      - before_implementation     # 实施前
      - during_review             # 审查时

    # 输出格式
    output_format:
      - challenges                 # 挑战列表
      - alternatives                 # 替代方案
      - risk_assessment            # 风险评估
      - what_if_scenarios          # What-If 场景
      - red_team_findings          # 红队测试发现
```

**详细说明见 [Critical Thinking Patterns](patterns.md#批判性思考模式)**

#### 内置模板

**全栈调研团队**

```yaml
template: fullstack-research
# 自动配置前端、后端、DevOps、文档四个 agent
```

**代码审查团队**

```yaml
template: code-review
# 自动配置安全、性能、架构、测试四个审查维度
```

**竞品分析团队**

```yaml
template: competitive-analisis
# 自动配置产品、技术、市场、体验四个分析维度
```

#### 自定义模板

在 `~/.claude/teams/templates/` 创建模板文件：

```yaml
# my-custom-team.template.yaml
name: my-custom-team
description: 我的专业团队
version: 1.0

parameters:
  - name: focus_area
    type: string
    required: true

agents:
  - name: researcher
    role: "{{focus_area}} 调研专家"
    # ...
```

使用：

```
/team-create my-custom-team --focus-area "人工智能"
```

#### 模板继承

```yaml
# my-review-team.template.yaml
extends: code-review

overrides:
  agents:
    # 额外的 agent
    - name: compliance-checker
      role: 合规性检查

    # 覆盖现有 agent 配置
    - name: security-checker
      strict_mode: true
```

## Advanced Features

### 错误处理

```yaml
error_handling:
  on_failure: continue  # | stop | retry
  retry_policy:
    max_attempts: 3
    backoff: exponential  # | linear
    base_delay: 5s

agents:
  - name: fragile-agent
    on_failure: fallback
    fallback_to: stable-agent
```

### 资源限制

```yaml
resource_limits:
  per_agent:
    timeout: 30m
    max_tokens: 100000
  total:
    max_cost: 1.00
    max_tokens: 500000
```

### 条件执行

```yaml
agents:
  - name: conditional-agent
    condition: "{{previous_agent.success}} == true"
    tasks:
      - ...
```

### 循环和迭代

```yaml
agents:
  - name: iterator
    loop:
      over: [item1, item2, item3]
      parallel: true
    tasks:
      - process: "{{item}}"
```

## Best Practices

### 设计原则

1. **任务分解粒度**：每个 agent 负责一个明确的子目标
2. **依赖最小化**：尽可能让任务独立，最大化并行度
3. **输岀标准化**：使用统一的文件格式和目录结构
4. **状态可观测**：配置清晰的日志和状态报告
5. **错误可恢复**：设置合理的重试和降级策略

### 性能优化

1. **并行度控制**：根据系统资源设置合理的 max_parallel
2. **上下文精简**：只传递必要的输入数据
3. **增量执行**：利用 shared_state 避免重复计算
4. **资源清理**：完成后及时清理临时文件和状态

### 调试技巧

1. **逐步验证**：先用 1-2 个 agent 验证流程
2. **日志详细**：开发时启用 verbose 模式
3. **人工检查**：关键节点添加人工确认
4. **断点续传**：利用 shared_state 支持断点恢复

## Examples

完整示例配置见 [examples.md](examples.md)，包含：

- 全栈开发团队
- 文献综述团队
- 竞品分析团队
- 多语言代码库迁移团队
- 自动化测试团队

## Troubleshooting

**问题：Agent 启动失贩**

- 检查 `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=true`
- 确认可执行 `claude` 命令
- 查看错误日志：`/team-logs <team> --agent <agent>`

**问题：Agent 卡在 blocked 状态**

- 检查依赖配置：`depends_on`
- 确认上游 agent 是否完成
- 使用 `/team-status` 查看完整依赖链

**问题：并行度不足**

- 调整 `max_parallel` 参数
- 检查系统资源限制
- 优化 agent 间依赖关系

更多问题排查见 [patterns.md](patterns.md) 的调试章节。
