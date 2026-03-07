# Coordination Patterns and Scheduling Strategies

本文档详细描述 Agent Teams 的协同时式、调度策略和最佳实践。

## Coordination Patterns

### 最佳团队配置（Optimal Team Configurations）

**核心理念：** 基于项目复杂度和团队能力，以下是经过验证的 5-7 人团队最佳配置。

---

#### 配置 1：全栈开发团队（5 人）

**适用场景：** 中小型产品开发，需要完整的前后端+DevOps 能力

**团队配置：**
```yaml
name: fullstack-dev-team-small
description: 小型全栈开发团队（5 人）
team_size: 5

agents:
  # 构建者（2 人）
  - name: frontend-architect
    role: 前端架构师
    responsibilities:
      - design_frontend_architecture
      - component_library_design
    personality:
      visionary: 0.8
      pragmatic: 0.6

  - name: backend-architect
    role: 后端架构师
    responsibilities:
      - design_api_architecture
      - database_schema_design
    personality:
      visionary: 0.7
      pragmatic: 0.8

  # 批判者（1 人）
  - name: devils-critic
    role: 魔鬼式批判者
    responsibilities:
      - challenge_architecture_decisions
      - identify_technical_risks
      - stress_test_scalability
    critical_thinking_style:
      skepticism: 0.9
      scenarios: what_if

  # 改进者（1 人）
  - name: issue-improver
    role: DevOps 改进专员
    responsibilities:
      - identify_ci_cd_enhancements
      - optimize_deployment_pipeline
      - propose_infrastructure_improvements
    improvement_thinking_style:
      incremental: 0.8
      user_focused: 0.7

  # 整合者（1 人）
  - name: result-synthesizer
    role: 技术决策促进者
    responsibilities:
      - facilitate_tech_debates
      - synthesize_architecture_proposals
      - make_tech_tradeoff_decisions
    facilitation_style:
      neutral: 0.9
      technical_depth: 0.8
```

**协作流程：**
```
1. [前端架构师] 提出前端方案
   ↓
2. [后端架构师] 提出后端方案
   ↓
3. [魔鬼批判者] 质疑双方假设
   - "Server Components 真的可行吗？"
   - "如果数据库性能瓶颈怎么办？"
   ↓
4. [DevOps 改进专员] 提供优化建议
   - "是否可以先容器化迁移？"
   - "CI/CD 流水线能否分阶段？"
   ↓
5. [技术决策促进者] 整合观点，推动共识
```

**为什么这个配置有效：**
- **2 名架构师**：前端和后端各有专家，深度覆盖技术栈
- **1 名批判者**：足够的批判火力，避免技术盲点
- **1 名改进者**：专注于流程优化，持续提升效率
- **1 名整合者**：强有力的技术背景，能有效调和分歧

---

#### 配置 2：产品迭代团队（6 人）

**适用场景：** 快速迭代的产品开发，需要平衡创新和稳定性

**团队配置：**
```yaml
name: product-iteration-team
description: 产品迭代团队（6 人）
team_size: 6

agents:
  # 构建者（2 人）
  - name: product-architect
    role: 产品架构师
    responsibilities:
      - design_product_features
      - create_user_journeys
      - define_success_metrics
    personality:
      user_focused: 0.9
      data_driven: 0.7

  - name: tech-lead
    role: 技术负责人
    responsibilities:
      - assess_technical_feasibility
      - estimate_development_effort
      - identify_tech_dependencies
    personality:
      pragmatic: 0.9
      risk_averse: 0.7

  # 批判者（2 人）
  - name: devils-critic
    role: 魔鬼式批判者（技术视角）
    responsibilities:
      - challenge_tech_assumptions
      - stress_test_architecture
    critical_thinking_style:
      skepticism: 0.9
      scenarios: what_if

  - name: risk-analyst
    role: 风险分析师（业务视角）
    responsibilities:
      - assess_market_risks
      - identify_regulatory_risks
      - evaluate_competitive_threats
    critical_thinking_style:
      risk_averse: 0.8
      defensive: 0.7

  # 改进者（1 人）
  - name: new-feature-specialist
    role: 新特性探索专员
    responsibilities:
      - research_emerging_techs
      - propose_innovative_features
      - explore_market_trends
    innovation_thinking_style:
      trend_aware: 0.9
      experimental: 0.8

  # 整合者（1 人）
  - name: decision-facilitator
    role: 产品决策协调者
    responsibilities:
      - facilitate_proposal_debates
      - balance_user_and_tech_constraints
      - drive_product_decision
    facilitation_style:
      user_advocate: 0.8
      business_acumen: 0.8
```

**协作流程：**
```
┌────────────────────────────────────────┐
│         产品假设竞争对话                 │
├────────────────────────────────────────┤
│                                          │
│  [产品架构师] "我建议 AI 推荐"   │
│  ↓                                   │
│  [技术负责人] "开发需要 3 个月"     │
│  ↓                                   │
│  ┌────────────────┐  ┌────────────────┐ │
│  │ 技术批判 │  │ 业务批判 │  │
│  │ "如果      │  │ "如果竞品  │  │
│  │  GPU 成本  │  │  也做了呢？" │  │
│  │  过高怎么办？"│  │             │  │
│  └────────────┘  └────────────┘ │
│  └────────────────────────────────┘ │
│  │              │              │
│  ▼              ▼              │
│  [新特性专员] "可以先用小规模试点"│
│  ↓                                   │
│  [决策协调者] "综合各方，先 Phase 1"│
└────────────────────────────────────────┘
```

**为什么这个配置有效：**
- **2 名批判者**：技术和业务双重视角，避免盲点
- **2 名构建者**：产品和技术平衡，确保可执行
- **1 名创新者**：持续注入新想法，避免停滞
- **1 名决策者**：强有力的协调能力，平衡多方需求

---

#### 配置 3：研究与探索团队（7 人）

**适用场景：** 技术调研、竞品分析、新领域探索等需要深度思考的任务

**团队配置：**
```yaml
name: research-exploration-team
description: 研究探索团队（7 人 - 上限配置）
team_size: 7

agents:
  # 构建者（2 人）
  - name: domain-researcher-1
    role: 领域研究员 1
    domain: "前端技术 | AI | 安全 | 其他"
    responsibilities:
      - deep_domain_research
      - technology_trend_analysis
    personality:
      expertise: 0.9
      analytical: 0.8

  - name: domain-researcher-2
    role: 领域研究员 2
    domain: "后端架构 | DevOps | 数据工程 | 其他"
    responsibilities:
      - deep_domain_research
      - benchmarking_and_testing
    personality:
      expertise: 0.9
      pragmatic: 0.8

  # 批判者（2 人）
  - name: devils-critic
    role: 魔鬼式批判者（技术可行性）
    responsibilities:
      - challenge_assumptions
      - identify_technical_gaps
    critical_thinking_style:
      skepticism: 0.9
      scenarios: what_if

  - name: academic-skeptic
    role: 学院式批判者（方法论批判）
    responsibilities:
      - challenge_research_methodology
      - identify_bias_risks
      - peer_review_research_quality
    critical_thinking_style:
      skepticism: 0.8
      rigorous: 0.9

  # 改进者（2 人）
  - name: issue-improver
    role: 实践问题改进者
    responsibilities:
      - identify_practical_gaps
      - propose_practical_solutions
      - optimize_existing_tools
    improvement_thinking_style:
      hands_on: 0.9
      user_focused: 0.8

  - name: new-feature-specialist
    role: 新特性探索专员
    responsibilities:
      - explore_cutting_edge_techs
      - propose_experimental_features
      - trend_spotting
    innovation_thinking_style:
      experimental: 0.9
      trend_aware: 0.9

  # 整合者（1 人）
  - name: result-synthesizer
    role: 研究综合者
    responsibilities:
      - synthesize_multi_domain_findings
      - resolve_conflicting_insights
      - generate_integrated_reports
    synthesis_style:
      holistic: 0.9
      cross_domain: 0.8
```

**协作流程：**
```
┌──────────────────────────────────────────────┐
│        研究质量保证流程                     │
├──────────────────────────────────────────────┤
│                                              │
│  [研究员 1] "React 19 性能提升 40%"  │
│  [研究员 2] "Vue 4 也类似提升"       │
│  ↓                                     │
│  ┌────────────────┐  ┌────────────────┐  │
│  │ 技术批判    │  方法论批判  │  │
│  │ "基准测试    │  "样本是否有   │  │
│  │  公平吗？"    │  偏差？"       │  │
│  └────────────┘  └──────────────┘  │
│  └────────────────────────────────┘  │
│  │              │              │
│  ▼              ▼              │
│  [实践改进]   │  [新特性探索]  │
│  "实际项目    │  "Svelte 5 还   │  │
│  中收益有限"  │  增长 60%"    │  │
│  └────────────────────────────────┘  │
│  ↓                                     │
│  [研究综合者] "综合：Svelte 最值得深究" │
└──────────────────────────────────────────────┘
```

**为什么这个配置有效：**
- **2 名研究员**：覆盖不同领域，提供多视角
- **2 名批判者**：技术+方法论双保险，确保研究质量
- **2 名改进者**：实践+创新双驱动，平衡稳健和前沿
- **1 名综合者**：需要强大的跨领域整合能力

**为什么 7 人是上限：**
- 沟通复杂度：7 人有 21 条沟通渠道，已经是管理极限
- 决策效率：超过 7 人，达成共识需要显著更多时间
- 角色重叠：容易出現职责边界模糊

---

#### 配置 4：敏捷交付团队（5 人）

**适用场景：** 快速交付、短周期迭代、需要快速响应变化

**团队配置：**
```yaml
name: agile-delivery-team
description: 敏捷交付团队（5 人）- 最精简配置
team_size: 5

agents:
  # 构建者（2 人）- 核心开发能力
  - name: fullstack-developer-1
    role: 全栈开发者 1
    responsibilities:
      - implement_frontend_features
      - build_backend_apis
    personality:
      productive: 0.9
      versatile: 0.8

  - name: fullstack-developer-2
    role: 全栈开发者 2
    responsibilities:
      - implement_frontend_features
      - build_backend_apis
    personality:
      productive: 0.9
      versatile: 0.8

  # 批判者（1 人）- 质量但关键
  - name: devils-critic
    role: 快速批判者
    responsibilities:
      - quick_assumption_checks
      - identify_blocker_risks
    critical_thinking_style:
      skepticism: 0.7
      fast_feedback: 0.9

  # 改进者（1 人）- 持续优化
  - name: issue-improver
    role: 流程改进者
    responsibilities:
      - optimize_development_workflow
      - automate_repetitive_tasks
    improvement_thinking_style:
      pragmatic: 0.9
      quick_wins: 0.8

  # 整合者（1 人）- 敏捷决策
  - name: decision-facilitator
    role: 敏捷决策者
    responsibilities:
      - make_quick_decisions
      - unblock_developers
    facilitation_style:
      decisive: 0.9
      action_oriated: 0.9
```

**为什么这个配置有效：**
- **2 名开发者**：核心交付能力，并行开发
- **1 名批判者**：快速反馈，避免重大错误
- **1 名改进者**：持续优化流程，提升效率
- **1 名决策者**：快速决策，减少等待时间

---

### 不同规模对比

| 规模 | 典型场景 | 优缺点 | 推荐配置 |
|------|---------|---------|---------|
| **5 人（最精简）** | 快速交付、单一领域 | ✅ 沟通最快<br>✅ 决策最速<br>❌ 角角单一<br>❌ 批判火力弱 | 敏捷交付团队 |
| **6 人（推荐）** | 平衡创新和执行 | ✅ 角色完整<br>✅ 协作顺畅<br>⚠️ 需要协调<br>⚠️ 成本稍高 | 产品迭代团队 |
| **7 人（上限）** | 跨度探索、跨领域 | ✅ 覆盖最广<br>✅ 批判最全<br>❌ 沟通复杂<br>❌ 决策较慢 | 研究探索团队 |

**超过 7 人的问题：**
- 需要 **Subteam 结构**（Team of Teams）
- 引入 **中间管理角色**（Team Lead → Squad Lead）
- 显著增加 **协调成本**（会议、文档、对齐）
- 出现 **社交怠惰**（Social Loafing）

**处理更大项目的策略：**
```yaml
# 不推荐：直接扩大到 10+ 人
name: large-team-anti-pattern  # ❌ 反模式

# 推荐：拆分为多个 5-7 人子团队
name: team-of-teams-approach  # ✅ 推荐

structure:
  - name: platform-team
    size: 6
    focus: "平台架构和基础设斄"

  - name: feature-team-a
    size: 5
    focus: "特性 A 家族"

  - name: feature-team-b
    size: 5
    focus: "特性 B 家族"

coordination:
  - platform_team_responsible_for: "共享基础设施"
  - feature_teams_autonomous: "特性级决策"
  - weekly_alignment: "跨团队对齐"
```

---

### 0. 批判性协作模式（Critical Collaboration）

**核心理念：** Agent Teams 采用**对等协作 + 多角色互补 + 内置批判思维**的团队模式，而非传统的中心化指挥模式。每个 agent 都有独特的个性和领域视角，通过**假设竞争对话**和**批判性互动**达成更优决策。

**与中心化模式的对比：**

| 维度 | 中心化模式（Leader） | 对等协作模式（Critical Collaboration） |
|------|-------------------|-------------------|
| 权力结构 | 层次化（Leader → Workers）| 对等化（所有角色平级）|
| 决策方式 | Leader 协调和决策 | 所有角色通过对话达成共识 |
| 批判思维 | 单一 Devil's Advocate 角色 | 每个角色都具批判性视角 |
| 创新思维 | 无 | Issue Improver 和 New Feature Specialist |
| 适应性 | Leader 调整策略 | 团队自组织适应 |
| 鲁棒性 | 单点失败（Leader）| 分布式鲁棒性 |
| 人工介入 | Leader 触发决策点 | 紧急决策由 Facilitator 触发，其他通过对话解决 |

**团队角色矩阵：**

```
┌────────────────────────────────────────────────────┐
│                    批判性协作团队                      │
├────────────────────────────────────────────────────┤
│                                                            │
│  ┌────────────────┐  ┌────────────────┐           │
│  │   构建者阵营   │  │   批判者阵营   │           │
│  │  Solution Arch │  │  Devil's Critic│           │
│  │  Feature Dev   │  │  Risk Analyst   │           │
│  └────────────────┘  └────────────────┘           │
│                                                            │
│  ┌────────────────┐  ┌────────────────┐           │
│  │   改进者阵营   │  │   整合者阵营   │           │
│  │  Issue Improver │  │  Decision Facil │           │
│  │  New Feature Spec│  │  Result Synthe  │           │
│  └────────────────┘  └────────────────┘           │
│                                                            │
│              所有角色通过假设竞争对话协作                 │
└────────────────────────────────────────────────────┘
```

**配置示例：**

**适用场景：**
- 需要动态调整策略
- 复杂的异常处理逻辑
- 需要人工介入决策
- 资源受限需要动态分配
- 多阶段、多分支的复osten工作流

**配置示例：**
```yaml
name: orchestrated-research-team
mode: orchestrated

leader:
  name: coordinator
  role: 团队协调器
  model: claude-opus-4-6        # Leader 使用更强大的模型

  # 职责范围
  responsibilities:
    - task_allocation          # 动态任务分配
    - exception_handling        # 异常处理和降级
    - resource_management       # 资源管理
    - result_aggregation       # 结果聚合
    - human_intervention       # 人工介入决策

  # 决策点（需要人工介入）
  decision_points:
    - on_strategy_change      # 策略变更时
      timeout: 5m               # 等待人工决策的最长时间
      auto_continue: false     # 超时是否自动继续

    - on_budget_exceed        # 超预算时
      threshold: 0.80           # 预算使用到 80% 时触发
      action: pause             # pause | stop | continue

    - on_conflict             # agent 冲突时
      resolution: manual       # manual | auto_priority | auto_first

    - on_completion           # 完成后验证
      require_approval: true   # 是否需要人工验证

  # 监控策略
  monitoring:
    interval: 10s              # 监控检查间隔
    metrics:
      - agent_status          # agent 状态
      - resource_usage        # 资源使用
      - progress_rate         # 进度速率
      - error_rate            # 错误率

  # 异常处理策略
  exception_handling:
    retry:
      max_attempts: 3
      backoff: exponential
    fallback:
      enabled: true
      pool: [backup-1, backup-2]    # 备用 agent 池
    escalation:
      threshold: 2             # 第 2 次失贩后升级
      action: human_intervention

agents:
  # 工作节点
  - name: researcher-1
    role: 前端研究员
    capacity: 1                # 容量（可同时处理任务数）

  - name: researcher-2
    role: 后端研究员
    capacity: 1

  - name: backup-researcher
    role: 备用研究员
    is_backup: true           # 标记为备用
```

**执行流程：**

```
┌─────────────────────────────────────────┐
│          Leader (Coordinator)           │
│  ┌───────────────────────────────┐  │
│  │ 1. 分析任务和资源              │  │
│  │ 2. 分配任务给 workers         │  │
│  │ 3. 监控执行状态              │  │
│  │ 4. 处理异常                 │  │
│  │ 5. 聚合结果                 │  │
│  └───────────────────────────────┘  │
│         │              │              │
│         ▼              ▼              │
│  ┌──────────┐  ┌──────────┐      │
│  │ Worker-1   │  │ Worker-2   │      │
│  │ (执行任务) │  │ (执行任务) │      │
│  └──────────┘  └──────────┘      │
│         │              │              │
│         ▼              ▼              │
│  ┌───────────────────────────────┐  │
│  │   结果汇总和异常处理           │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────────┘
```

**Leader Agent 的职责详解：**

#### 1. 动态任务分配

```yaml
leader:
  task_allocation:
    strategy: dynamic           # dynamic | static | hybrid

    # 动态策略
    dynamic:
      algorithm: least_loaded    # least_loaded | round_robin | predictive
      rebalance_interval: 30s    # 重新平衡间隔

      # 负载评估
      load_assessment:
        metrics:
          - active_tasks        # 活跃任务数
          - cpu_usage           # CPU 使用率
          - memory_usage        # 内存使用
          - queue_depth         # 队列深度
        weights:
          active_tasks: 0.4
          cpu_usage: 0.3
          memory_usage: 0.2
          queue_depth: 0.1

    # 预测策略
    predictive:
      lookback_window: 10      # 参考历史执行时间
      estimate_method: average   # average | ewma | percentile
```

**执行逻辑：**
1. 持续监控所有 worker 的负载状态
2. 新任务到来时，选择负载最轻的 worker
3. 定期（如 30s）重新评估和调整任务分配
4. 预测任务执行时间，优化调度决策

---

#### 2. 异常处理和降级

```yaml
leader:
  exception_handling:
    # 失败检测
    detection:
      timeout: 60s              # agent 无响应超时
      error_threshold: 0.5       # 错误率阈值（50%）

    # 失败处理策略
    on_failure:
      strategy: adaptive         # adaptive | retry | fallback | stop

      adaptive:
        # 第 1 次失败：重试
        attempt_1: retry
        retry_delay: 10s

        # 第 2 次失败：降级
        attempt_2: fallback
        fallback_to: backup_pool

        # 第 3 次失败：人工介入
        attempt_3: escalate
        escalate_to: human

    # 重试策略
    retry:
      max_attempts: 3
      backoff: exponential
      base_delay: 5s
      max_delay: 60s

    # 降级策略
    fallback:
      backup_pool: [backup-1, backup-2]
      activation: manual          # manual | auto
      quality_mode: degraded     # degraded | best_effort

    # 升级策略
    escalation:
      levels: 3
      level_1: retry
      level_2: fallback
      level_3: human_intervention
```

**执行场景示例：**

```
场景：Worker-1 执行任务失败

Leader 检测到失败
  ↓
[第 1 次失败]
  → 重试（10s 后）
  ↓
仍然失败
  ↓
[第 2 次失败]
  → 检查备用 agent 池
  → 启动 Backup-1 接管任务
  ↓
Backup-1 执行成功
  ↓
[任务完成]
  → 记录降级日志
  → 更新 Worker-1 可靠性评分
```

---

#### 3. 资源管理

```yaml
leader:
  resource_management:
    # 资源限制
    limits:
      total_cost: 10.00          # 总成本限制（美元）
      max_parallel: 5             # 最大并行 agent 数
      timeout: 2h                 # 总超时时间

    # 资源分配
    allocation:
      strategy: fair             # fair | priority | market_based

      fair:
        algorithm: max_min        # 最大化最小分配
        rebalance: true

      priority:
        queues:
          - name: urgent
            weight: 10
          - name: normal
            weight: 5
          - name: background
            weight: 1

      market_based:
        bidding_enabled: true      # 允许 agent "竞标"
        currency: tokens            # tokens | time | cost

    # 资源监控
    monitoring:
      interval: 5s
      alerts:
        - metric: cpu_usage
          threshold: 90%
          action: throttle          # throttle | stop | scale

        - metric: memory_usage
          threshold: 85%
          action: throttle

        - metric: cost
          threshold: 0.80           # 使用到 80% 预算
          action: human_approval     # require_approval | stop | continue
```

**资源竞标示例：**

```
场景：新任务需要分配

Leader 发布任务
  ↓
[Worker-1 竞标]："我可以在 30s 内完成，成本 100 tokens"
[Worker-2 竞标]："我可以在 20s 内完成，成本 150 tokens"
[Worker-3 竞标]："我可以在 25s 内完成，成本 80 tokens"
  ↓
Leader 评估（优先级：时间 > 成本）
  → 选择 Worker-2（最快）
  → 分配任务
```

---

#### 4. 结果聚合

```yaml
leader:
  result_aggregation:
    # 聚合策略
    strategy: intelligent         # intelligent | simple | custom

    intelligent:
      # 结果验证
      validation:
        schema_check: true        # 模式验证
        quality_check: true        # 质量检查
        consistency_check: true     # 一致性检查

      # 结果整合
      integration:
        method: merge             # merge | concat | custom
        conflict_resolution: manual  # manual | auto_wins | longest_wins

      # 结果优化
      optimization:
        deduplication: true        # 去重
        normalization: true         # 标准化
        enrichment: true           # 增强（如添加元数据）

    # 聚合模板
    template:
      format: markdown           # markdown | json | html | custom
      sections:
        - title: 执行概要
          content: summary
        - title: Agent 结果
          content: agent_outputs
        - title: 指标分析
          content: metrics
        - title: 异常日志
          content: errors
        - title: 人工决策
          content: human_decisions

    # 聚合后处理
    post_aggregation:
      notify: true               # 通知用户
      archive: true              # 归档结果
      cleanup: true              # 清理临时文件
```

**聚合流程：**

```
Worker-1 结果 ───┐
Worker-2 结果 ───┼──> [验证] ───> [整合] ───> [优化] ───> 最终报告
Worker-3 结果 ───┘                  ↓          ↓          ↓
                              模式检查   去重处理   标准化
                              质量检查   冲突解决   增强
                              一致性检查
```

---

#### 5. 人工介入决策

```yaml
leader:
  human_intervention:
    # 决策点配置
    decision_points:
      - name: strategy_change
        trigger: manual            # manual | automatic
        description: 策略变更时需要确认
        timeout: 5m
        auto_action: pause         # pause | continue | stop
        options:
          - label: 继续当前策略
            description: 继续执行，不做变更
          - label: 切换到并行模式
            description: 切换到并行执行模式
          - label: 切换到流水线模式
            description: 切换到流水线执行模式
          - label: 终止执行
            description: 终止所有 agent

      - name: budget_exceed
        trigger: automatic          # 预算使用到阈值时自动触发
        threshold: 0.80
        description: 预算使用超过 80%
        timeout: 3m
        auto_action: stop
        options:
          - label: 增加预算
            description: 增加 5 美元预算
            input:
              name: additional_budget
              type: float
              default: 5.00

          - label: 终止执行
            description: 立即停止，保存当前进度

          - label: 降级模式
            description: 切换到低成本模式

    # 通知方式
    notification:
      channels:
        - type: console
          urgency: high

        - type: desktop
          urgency: medium

        - type: email
          urgency: low
          address: user@example.com

    # 决策历史
    history:
      enabled: true
      retention: 90              # 保留 90 天
      file: .team/decisions.log
```

**决策交互示例：**

```
┌─────────────────────────────────────────┐
│         人工介入决策请求              │
├─────────────────────────────────────────┤
│ 类型：策略变更                       │
│ 触发：Worker-3 连续失败 2 次          │
│ 超时：5 分钟                         │
├─────────────────────────────────────────┤
│                                         │
│ 选项：                                 │
│ [1] 继续当前策略                     │
│     Worker-3 将重试第 3 次              │
│                                         │
│ [2] 启用备用 Agent                     │
│     Backup-1 将接手 Worker-3 的任务     │
│                                         │
│ [3] 调整执行策略                     │
│     从 parallel 切换为 pipeline          │
│     （可能需要更多时间，但更可靠）     │
│                                         │
│ [4] 终止执行                          │
│     保存当前进度和结果               │
│                                         │
│ [5] 自定义方案                        │
│     请输入您的决策...                 │
├─────────────────────────────────────────┤
│ 请选择 [1-5]：_
```

---

**完整示例：研究团队协调器**

```yaml
name: orchestrated-research-team
description: 协调式研究团队 - Leader 模式
mode: orchestrated

leader:
  name: research-coordinator
  role: 研究协调器
  model: claude-opus-4-6

  responsibilities:
    - task_allocation
    - exception_handling
    - result_aggregation
    - human_intervention

  decision_points:
    - on_strategy_change
      timeout: 5m

    - on_agent_failure
      threshold: 2              # 2 个 agent 失败
      action: pause

    - on_completion
      require_approval: true

  monitoring:
    interval: 10s

  exception_handling:
    retry:
      max_attempts: 2
    fallback:
      enabled: true
      pool: [backup-researcher]

agents:
  - name: frontend-researcher
    role: 前端研究员
    capacity: 2              # 可同时处理 2 个任务

  - name: backend-researcher
    role: 后端研究员
    capacity: 1

  - name: backup-researcher
    role: 备用研究员
    is_backup: true
    capacity: 1

reporting:
  format: markdown
  output: ORCHESTRATED_RESEARCH_REPORT.md
  include:
    - agent_outputs
    - leader_decisions
    - exception_log
    - execution_trace
```

---

**Leader vs. 传统模式对比：**

| 特性 | Parallel/Pipeline/DAG | Leader/Orchestrator |
|------|---------------------|---------------------|
| 任务分配 | 静态配置文件 | 动态调整 |
| 异常处理 | 预定义重试/降级 | 智能处理和决策 |
| 资源管理 | 预设限制 | 动态分配和竞标 |
| 结果聚合 | 简单汇总 | 智能验证和整合 |
| 人工介入 | 无 | 决策点介入 |
| 执行复杂度 | 简单 | 复杂 |
| 适用场景 | 固定流程 | 动态、复杂场景 |

---

**何时使用 Leader 模式：**

✅ **推荐使用：**
- 执行过程中需要调整策略
- 异常处理逻辑复杂
- 需要人工在关键点决策
- 资源受限需要动态分配
- 多阶段、多分支的复osten工作流
- 需要质量保证和结果验证

❌ **不推荐使用：**
- 简单的固定流程（用 Parallel/Pipeline）
- 无需人工介入（用 DAG）
- 超级敏感（Leader 会增加延迟）
- 预算受限（Leader 使用更多资源）

---

## Critical Thinking Patterns（批判性思考模式）

### Devil's Advocate / Issue 专员模式

**核心概念：** 在团队中引入一个专门的"批判者"角色，负责质疑假设、提出替代方案、识别潜在风险。这是保证发散性思考和避免群体思维（Groupthink）的关键机制，类似于 Six Thinking Hats 中的黑帽角色。

**适用场景：**
- 需要避免群体思维
- 重要决策需要多角度审视
- 复杂项目需要风险识别
- 创新方案需要压力测试
- 需要确保考虑替代方案

**配置示例：**
```yaml
name: critical-thinking-team
mode: orchestrated

agents:
  - name: solution-architect
    role: 方案架构师
    responsibilities:
      - design_solution
      - propose_architecture

  - name: devils-advocate
    role: 假设性竞争代理 / Issue 专员
    responsibilities:
      - challenge_assumptions
      - propose_alternatives
      - identify_risks
      - stress_test_solution

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
      - after_proposal            # 方案权出后
      - before_implementation     # 实施前
      - during_review             # 审查时

    # 输出格式
    output_format:
      - challenges                 # 挑战列表
      - alternatives                 # 替代方案
      - risk_assessment            # 风险评估
      - what_if_scenarios          # What-If 场景
      - red_team_findings          # 红队测试发现

  - name: decision-maker
    role: 决策制定者
    depends_on: [solution-architect, devils-advocate]
    responsibilities:
      - evaluate_proposal_vs_challenges
      - make_informed_decision
      - document_rationale
```

**Devil's Advocate 的工作流程：**

```
┌─────────────────────────────────────────┐
│     Solution Architect 提出方案         │
├─────────────────────────────────────────┤
                 │
                 ▼
┌─────────────────────────────────────────┐
│    Devil's Advocate 批判分析           │
├─────────────────────────────────────────┤
│ 1. 质疑基本假设                      │
│    ┌─ "这个方案基于哪些假设？"          │
│    ┌─ "这些假设是否成立？"             │
│    ┌─ "如果假设错误会怎样？"           │
│                                         │
│ 2. 识别潜在风险                      │
│    ┌─ "技术风险：架构是否可行？"        │
│    ┌─ "成本风险：预算是否充足？"        │
│    ┌─ "时间风险：排期是否现实？"        │
│    ┌─ "安全风险：是否有漏洞？"          │
│                                         │
│ 3. 提出替代方案                      │
│    ┌─ "有没有其他技术路径？"            │
│    ┌─ "是否可以简化或分阶段？"         │
│    ┌─ "是否可以用不同的架构？"         │
│                                         │
│ 4. 压力测试方案                      │
│    ┌─ "如果用户量增长 10 倍？"         │
│    ┌─ "如果关键依赖方失贩？"           │
│    ┌─ "如果预算削减 50%？"             │
│    ┌─ "如果团队人员变动？"             │
├─────────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│     Decision Maker 综合决策             │
├─────────────────────────────────────────┘
```

**详细职责说明：**

#### 1. 质疑基本假设（Challenge Assumptions）

**目标：** 识别方案背后的隐含假设，并质疑其有效性。

**执行策略：**
```yaml
devils-advocate:
  assumption_challenges:
    # 假设类型识别
    assumption_types:
      - technical: "技术栈假设"
      - resource: "资源可用性假设"
      - market: "市场需求假设"
      - user: "用户行为假设"
      - timeline: "时间排期假设"
      - budget: "预算假设"

    # 质疑方法
    questioning_methods:
      - "这个方案成立的前提是什么？"
      - "如果我们错了会怎样？"
      - "有什么证据支持这个假设？"
      - "历史上类似假设的失败率？"
      - "最坏情况是什么？"
```

**输出示例：**
```markdown
## 假设性质疑

### 技术假设
**假设：** React 19 的 Server Components 可以无缝集成
**质疑：**
- 当前项目使用大量第三方库，这些库是否支持 Server Components？
- 团队是否有 Server Components 开发经验？
- 如果集成遇到问题，备选方案是什么？

### 资源假设
**假设：** 可以招募到 3 名全栈开发人员
**质疑：**
- 当前市场该技术栈的人才供给如何？
- 预算是否能支持目标薪资水平？
- 如果 2 个月内无法招募到，项目是否停滞？

### 时间假设
**假设：** Q3 可以完成 MVP
**质疑：**
- 历史类似规模的项目的实际交付周期？
- 是否考虑了学习曲线和不确定性？
- 如果关键里程碑延期，是否有缓冲计划？
```

---

#### 2. 识别潜在风险（Identify Risks）

**目标：** 从多个维度识别方案的风险。

**风险矩阵：**
```yaml
devils-advocate:
  risk_identification:
    # 风险维度
    risk_dimensions:
      - name: 技术风险
        factors:
          - 技术栈成熟度
          - 依赖项稳定性
          - 性能可扩展性
          - 安全漏洞

      - name: 成本风险
        factors:
          - 开发成本
          - 运维成本
          - 机会成本
          - 预算风险

      - name: 时间风险
        factors:
          - 学习曲线
          - 集成复杂度
          - 依赖项交付
          - 不可预见问题

      - name: 人员风险
        factors:
          - 技能匹配
          - 团队规模
          - 人员流动
          - 知识传承

      - name: 业务风险
        factors:
          - 市场契合
          - 竞争对手
          - 用户接受度
          - 监管合规

    # 风险评级
    rating:
      probability: [低, 中, 高]
      impact: [低, 中, 高, 灾难]
      priority_matrix:
        - {probability: 高, impact: 高, priority: P0}
        - {probability: 高, impact: 中, priority: P1}
        - {probability: 中, impact: 高, priority: P1}
```

**输出示例：**
```markdown
## 风险评估

| 风险 | 维度 | 概率 | 影响 | 优先级 | 缓解措施 |
|------|------|--------|--------|----------|----------|
| Server Components 集成困难 | 技术 | 高 | 高 | P0 | 预先验证关键依赖 |
| 招募不到合适的开发者 | 人员 | 中 | 灾难 | P1 | 提前启动招聘 + 备选方案 |
| Q3 交付不现实 | 时间 | 高 | 中 | P1 | 调整 MVP 范围 |
| 运维成本超预算 | 成本 | 中 | 中 | P2 | 使用托管服务降低运维 |
```

---

#### 3. 提出替代方案（Propose Alternatives）

**目标：** 提供不同的技术路径和实施策略。

**方案类型：**
```yaml
devils-advocate:
  alternative_proposals:
    # 替代方案类型
    alternative_types:
      - name: 技术栈替代
        description: "使用不同的技术实现"
        examples:
          - "不用 React，用 Svelte"
          - "不用 PostgreSQL，用 MongoDB"

      - name: 架构替代
        description: "使用不同的架构模式"
        examples:
          - "不用微服务，用单体应用"
          - "不用 Serverless，用容器化"

      - name: 分阶段实施
        description: "分解为多个阶段逐步实现"
        examples:
          - "Phase 1: 基础功能，Phase 2: 高级特性"
          - "先小规模试点，再全面推广"

      - name: 降级方案
        description: "简化或减少功能范围"
        examples:
          - "Phase 1 只实现核心功能"
          - "使用现成解决方案而非自研"

    # 方案对比
    comparison_framework:
      criteria:
        - 开发时间
        - 成本
        - 复杂度
        - 可维护性
        - 可扩展性
      format: 对比表格
```

**输出示例：**
```markdown
## 替代方案

### 方案 A: Svelte + Vite
**优势：**
- 更小的 bundle size
- 更快的构建速度
- 更少的学习曲线

**劣势：**
- 生态系统较小
- 社区案例较少
- 团队无经验

### 方案 B: 分阶段实施
**Phase 1 (Q3):** 核心功能 + React
**Phase 2 (Q4):** Server Components 逐步集成
**Phase 3 (Q1):** 完整迁移

**优势：**
- 降低一次性风险
- 逐步积累经验
- 更灵活的调整

### 对比表格
| 维度 | 原方案 (React 全家桶) | 方案 A (Svelte) | 方案 B (分阶段) |
|------|---------------------|----------------|------------------|
| 开发时间 | 3 个月 | 2.5 个月 | 4 个月 (总计) |
| 成本 | $$ | $$ | $$ |
| 复杂度 | 高 | 中 | 低 |
| 风险 | 高 | 中 | 低 |
```

---

#### 4. 压力测试方案（Stress Test）

**目标：** 通过极端场景测试方案的鲁棒性。

**压力测试类型：**
```yaml
devils-advocate:
  stress_tests:
    # What-If 场景
    what_if_scenarios:
      - scenario: 流量激增
        description: "如果用户量突然增长 10 倍"
        questions:
          - "架构是否支持水平扩展？"
          - "数据库会成为瓶颈吗？"
          - "CDN 成本是否可承受？"
          - "监控和告警是否到位？"

      - scenario: 关键依赖失贩
        description: "如果核心 API 或服务不可用"
        questions:
          - "有降级方案吗？"
          - "用户体验受多大影响？"
          - "如何快速恢复？"
          - "是否有备选供应商？"

      - scenario: 预算削减 50%
        description: "如果公司预算突然减半"
        questions:
          - "哪些功能可以砍掉？"
          - "是否可以用免费服务替代？"
          - "项目还值得继续吗？"
          - "MVP 范围可以缩小到什么程度？"

      - scenario: 核心开发人员离职
        description: "如果技术负责人离开"
        questions:
          - "知识是否充分文档化？"
          - "是否有后备人员？"
          - "外部招聘需要多长时间？"
          - "如何保证交接质量？"

      - scenario: 竞争对手先发布
        description: "如果竞品下月发布类似功能"
        questions:
          - "我们的差异化价值是什么？"
          - "是否需要调整功能或策略？"
          - "市场定位如何调整？"
          - "是否需要加速开发？"
```

**输出示例：**
```markdown
## 压力测试

### 场景：用户量增长 10 倍
**架构承受能力：** ⚠️ 可疑
- 当前单体架构无法支撑
- 需要重写为微服务或使用 Serverless

**数据库瓶颈：** ⚠️ 高风险
- 当前 PostgreSQL 单实例不够
- 需要实施读写分离和缓存层

**CDN 成本：** ⚠️ 中等风险
- 预估可能增加 5-10 倍美元
- 建议使用图片优化和懒加载

**建议：** 先实赞基础设施监控，再推广

---

### 场景：预算削减 50%
**可削减项目：**
1. ~~实时聊天功能~~ → 使用第三方服务 ($100/月)
2. ~~高级分析~~ → 使用免费版 Google Analytics
3. ~~DevOps 工程师~~ → 使用托管平台

**MVP 缩小：**
- Phase 1 只实现核儿功能（用户注册、内容创建、基础社交）
- Phase 2 再添加高级功能（实时聊天、高级分析、推荐算法）

**建议：** 预备两版计划（完整版 vs 最小可行版）
```

---

### 完整示例：产品决策团队

```yaml
name: product-decision-team
mode: orchestrated

leader:
  name: coordinator
  role: 协调器
  responsibilities:
    - facilitate_debate
    - synthesis_proposals_and_challenges
    - ensure_divergency

agents:
  - name: product-manager
    role: 产品经理
    tasks:
      - propose: "提出产品方案"
        output: proposal.md

  - name: devils-advocate
    role: 批判性思考代理
    tasks:
      - critique: "批判分析方案"
        input: proposal.md
        output: critique.md
      - alternatives: "提出替代方案"
        output: alternatives.md
      - stress_test: "压力测试"
        output: stress_tests.md

  - name: tech-lead
    role: 技术负责人
    tasks:
      - feasibility: "评估技术可行性"
        input: [proposal.md, critique.md]
        output: feasibility.md

  - name: decision-maker
    role: 决策者（通常是人类）
    depends_on: [product-manager, devils-advocate, tech-lead]
    tasks:
      - review: "审阅所有输入"
        input: [proposal.md, critique.md, alternatives.md, stress_tests.md, feasibility.md]
        output: DECISION.md

decision_points:
    - on_proposal_conflict      # 方案权冲突
      action: human_debate      # 人类辩论

    - on_high_risk              # 高风险场景
      action: human_approval    # 人类批准
```

**执行流程：**
```
1. Product Manager 提出方案
   ↓
2. Devil's Advocate 批判分析
   - 质疑假设
   - 识别风险
   - 提出替代方案
   - 压力测试
   ↓
3. Tech Lead 评估技术可行性
   ↓
4. Coordinator 综合所有观点
   ↓
5. Decision Maker (人类) 做决策
```

---

**与其他角色的对比：**

| 特性 | 普通 Worker | Leader/Orchestrator | Devil's Advocate |
|------|-----------|---------------------|-------------------|
| 主要职责 | 执行任务 | 协调和异常处理 | 质疑和批判 |
| 工作方式 | 服从指令 | 动态调整 | 挑战假设 |
| 输出 | 任务结果 | 决策和执行状态 | 挑战和风险 |
| 思维模式 | 建设执行 | 协调思维 | 批判性思维 |
| 与其他关系 | 协作 | 管理 | 对立 |

**何时使用 Devil's Advocate：**

✅ **推荐使用：**
- 重要决策（技术选型、架构设计、产品方向）
- 高风险项目（大额投资、关键客户、长周期）
- 需要创新（探索新技术、新市场）
- 团队容易群体思维（强领导、高凝聚力）
- 需要多角度审视

❌ **不推荐使用：**
- 简单执行任务（如代码实现、测试）
- 低风险场景（如小的功能迭代）
- 紧急决策（Devil's Advocate 会增加时间）
- 方案权明确（如标准化流程）

**最佳实践：**

1. **平衡批判和建设**
   - 不只是反对，要提供建设性替代
   - 批战是为了改进，不是为了否定

2. **提前定义批判范围**
   - 哪先约定哪些维度需要审视
   - 避免无限制的质疑导致效率低下

3. **时而有度**
   - 早期阶段多用批判（规划和设计）
   - 实施阶段减少批判（避免频繁变更）

4. **文档化所有质疑**
   - 让质疑和挑战可追溯
   - 便于后续审查和学习

5. **培养批判文化**
   - 鼓励团队成员也提出质疑
   - 不只是"代理"的职责

---

### 1. Parallel Pattern（并行模式）

**适用场景：**
- 独立任务，无依赖关系
- 需要最大化并行度
- 可容错，部分失败不影响整体

**配置示例：**
```yaml
name: parallel-research-team
mode: parallel

agents:
  - name: react-researcher
    tasks:
      - research: "React 19 新特性"
        output: docs/react.md

  - name: vue-researcher
    tasks:
      - research: "Vue 4 新特性"
        output: docs/vue.md

  - name: svelte-researcher
    tasks:
      - research: "Svelte 5 新特性"
        output: docs/svelte.md
```

**执行特点：**
- 所有 agent 同时启动
- 无等待时间
- 总耗时 = max(agent_1耗时, agent_2耗时, ...)

**注意事项：**
- 资源竞争：多个 agent 同时消耗 CPU/内存
- 输出冲突：确保输出文件路径不重叠
- 错误隔离：单个 agent 失败不影响其他

---

### 2. Pipeline Pattern（流水线模式）

**适用场景：**
- 前后任务有明确依赖
- 每个 agent 的输出是下一个的输入
- 需要顺序处理，如 ETL 流程

**配置示例：**
```yaml
name: etl-pipeline
mode: pipeline

agents:
  - name: extractor
    role: 数据抽取
    tasks:
      - extract: "从 API 抽取数据"
        output: data/raw.json

  - name: transformer
    role: 数据转换
    next: loader
    tasks:
      - transform: "清洗和转换数据"
        input: data/raw.json
        output: data/processed.json

  - name: loader
    role: 数据加载
    tasks:
      - load: "加载到数据库"
        input: data/processed.json
        output: reports/load.log
```

**执行特点：**
- 严格顺序执行
- 每个 agent 等待上游完成
- 总耗时 = sum(agent_1耗时, agent_2耗时, ...)

**注意事项：**
- 性能瓶颈：流水线速度取决于最慢的 agent
- 错误传播：上游失贩会导致下游无法执行
- 中间状态：合理设计中问数据格式

---

### 3. DAG Pattern（有向无环图模式）

**适用场景：**
- 复杂依赖关系
- 多对多依赖
- 需要优化执行顺序

**配置示例：**
```yaml
name: microservices-analysis
mode: dag

agents:
  # 前端调研（并行）
  - name: frontend-analyst
    role: 前端架构分析
    tasks:
      - analyze: "分析前端微服务架构"
        output: analysis/frontend.md

  - name: backend-analyst
    role: 后端架构分析
    tasks:
      - analyze: "分析后端微服务架构"
        output: analysis/backend.md

  - name: database-analyst
    role: 数据库架构分析
    tasks:
      - analyze: "分析数据层架构"
        output: analysis/database.md

  # 性能测试（依赖架构分析）
  - name: performance-tester
    role: 性能基准测试
    depends_on: [frontend-analyst, backend-analyst, database-analyst]
    tasks:
      - benchmark: "执行性能基准测试"
        input: [analysis/frontend.md, analysis/backend.md, analysis/database.md]
        output: reports/performance.md

  # 安全审计（依赖架构分析）
  - name: security-auditor
    role: 安全审计
    depends_on: [frontend-analyst, backend-analyst, database-analyst]
    tasks:
      - audit: "执行安全审计"
        input: [analysis/frontend.md, analysis/backend.md, analysis/database.md]
        output: reports/security.md

  # 最终报告（依赖性能和安全）
  - name: report-compiler
    role: 报告编译
    depends_on: [performance-tester, security-auditor]
    tasks:
      - compile: "生成最终架构评估报告"
        input: [reports/performance.md, reports/security.md]
        output: FINAL_REPORT.md
```

**依赖图：**
```
    [frontend] ───┐
    [backend]  ───┼──> [performance] ───┐
    [database] ───┘                   │
           │                          │
           └──────────────────────────┴──> [report]
                                         │
                         [security] ─────────┘
```

**执行特点：**
- 智能调度：自动识别可并行的层级
- 依赖感知：上游完成自动触发下游
- 优化顺序：最小化总执行时间

**注意事项：**
- 依赖完整性：确保所有依赖都存在
- 无环检测：避免循环依赖导致死锁
- 层级深度：过深的依赖链会增加等待时间

---

### 4. Fan-Out/Fan-In Pattern（扇出扇入模式）

**适用场景：**
- MapReduce 风格
- 批量数据处理
- 聚合多源信息

**配置示例：**
```yaml
name: mapreduce-team
mode: dag

agents:
  # Map 阶段（扇出）
  - name: mapper-1
    role: 数据映射
    tasks:
      - process: "处理数据分片 1"
        output: data/chunk1.json

  - name: mapper-2
    role: 数据映射
    tasks:
      - process: "处理数据分片 2"
        output: data/chunk2.json

  - name: mapper-3
    role: 数据映射
    tasks:
      - process: "处理数据分片 3"
        output: data/chunk3.json

  # Reduce 阶段（扇入）
  - name: reducer
    role: 数据聚合
    depends_on: [mapper-1, mapper-2, mapper-3]
    tasks:
      - aggregate: "聚合并规约数据"
        input: [data/chunk1.json, data/chunk2.json, data/chunk3.json]
        output: data/aggregated.json
```

**执行特点：**
- 并行 map，顺序 reduce
- 适合 embarrassingly parallel 问题

---

### 5. Divide and Conquer Pattern（分治模式）

**适用场景：**
- 大任务分解
- 递归式问题求解
- 需要中间结果聚合

**配置示例：**
```yaml
name: divide-conquer-team
mode: dag

agents:
  # Divide 阶段
  - name: divider
    role: 任务分解
    tasks:
      - split: "将大任务分解为 4 个子任务"
        output: tasks/subtasks.json

  # Conquer 阶段（并行）
  - name: worker-1
    depends_on: divider
    tasks:
      - solve: "解决子任务 1"
        input: tasks/subtasks.json
        output: results/result1.json

  - name: worker-2
    depends_on: divider
    tasks:
      - solve: "解决子任务 2"
        input: tasks/subtasks.json
        output: results/result2.json

  - name: worker-3
    depends_on: divider
    tasks:
      - solve: "解决子任务 3"
        input: tasks/subtasks.json
        output: results/result3.json

  - name: worker-4
    depends_on: divider
    tasks:
      - solve: "解决子任务 4"
        input: tasks/subtasks.json
        output: results/result4.json

  # Merge 阶段
  - name: merger
    role: 结果合并
    depends_on: [worker-1, worker-2, worker-3, worker-4]
    tasks:
      - merge: "合并所有子任务结果"
        input: [results/result1.json, results/result2.json, results/result3.json, results/result4.json]
        output: results/final.json
```

---

## Scheduling Strategies

### FIFO（First In, First Out）

**特点：**
- 简单公平
- 无优先级
- 适合同级任务

**配置：**
```yaml
scheduling:
  queue_strategy: fifo
```

**适用场景：**
- 任务同等重要
- 先到先服务原则
- 无资源竞争问题

---

### Priority（优先级调度）

**特点：**
- 优先级高的先执行
- 支持动态优先级
- 适合有紧急任务

**配置：**
```yaml
scheduling:
  queue_strategy: priority

agents:
  - name: urgent-agent
    priority: 1        # 最高优先级

  - name: normal-agent
    priority: 5        # 正常优先级

  - name: background-agent
    priority: 10       # 最低优先级
```

**适用场景：**
- 有主次任务
- 需要保证关键路径
- 有 SLA 要求

---

### Dependency-Aware（依赖感知调度）

**特点：**
- 智能分析依赖图
- 最大化并行度
- 最小化总执行时间

**配置：**
```yaml
scheduling:
  queue_strategy: dependency_aware
  resource_aware: true     # 启用资源感知
```

**执行逻辑：**
1. 构建依赖图
2. 计算拓扑层级
3. 每层内并行执行
4. 层间顺序执行

**适用场景：**
- 复杂依赖关系
- 需要优化执行时间
- DAG 模式的默认策略

---

### Resource-Aware Scheduling（资源感知调度）

**特点：**
- 监控系统资源
- 动态调整并行度
- 避免资源耗尽

**配置：**
```yaml
scheduling:
  resource_aware: true
  check_interval: 5s

  thresholds:
    cpu: 80%
    memory: 70%
    tokens: 100000
```

**执行逻辑：**
1. 持续检查资源使用
2. 超出阈值时暂停启动新 agent
3. 资源释放后恢复调度

**适用场景：**
- 资源受限环境
- 与其他进程共存
- 长时间运行

---

## Load Balancing Strategies

### Round Robin

**特点：**
- 轮询分配
- 无状态
- 适合同质 agent

**配置：**
```yaml
load_balancing:
  strategy: round_robin
```

---

### Least Loaded

**特点：**
- 分配给当前负载最轻的 agent
- 需要负载监控
- 适合异质 agent

**配置：**
```yaml
load_balancing:
  strategy: least_loaded
  check_interval: 10s

  resource_thresholds:
    cpu: 80%
    memory: 70%
```

---

### Dynamic（动态负载均衡）

**特点：**
- 实时调整
- 预测型分配
- 最优性能

**配置：**
```yaml
load_balancing:
  strategy: dynamic
  check_interval: 5s
  prediction_window: 30s    # 预测窗口
```

---

## Error Handling Patterns

### Retry with Exponential Backoff

**适用场景：**
- 网络操作
- 外部 API 调用
- 临时性错误

**配置：**
```yaml
error_handling:
  retry_policy:
    max_attempts: 3
    backoff: exponential
    base_delay: 5s
    max_delay: 60s
```

**延迟序列：**
- 第 1 次：立即重试
- 第 2 次：等待 5s
- 第 3 次：等待 10s
- 第 4 次：等待 20s

---

### Fallback Pattern

**适用场景：**
- 多实现可用
- 主方案失贩
- 需要降级服务

**配置：**
```yaml
agents:
  - name: primary-agent
    on_failure: fallback
    fallback_to: backup-agent
    tasks:
      - primary_task: "主要实现"

  - name: backup-agent
    tasks:
      - backup_task: "备份实现"
```

---

### Continue on Error

**适用场景：**
- 部分独立的任务
- 部分失败可接受
- 需要最大化完成率

**配置：**
```yaml
error_handling:
  on_failure: continue

agents:
  - name: robust-agent
    on_failure: continue    # 覆盖全局设置
    tasks:
      - task: "容错任务"
```

---

## Debugging Techniques

### 1. 依赖图可视化

**方法：**
```bash
/team-status <team-name> --graph
```

**输出示例：**
```
Dependency Graph:
┌─ [agent-1] (completed)
│  └─ [agent-2] (running) ── [agent-4] (pending)
│  └─ [agent-3] (blocked)
└─ [agent-5] (pending)
```

---

### 2. 逐个执行调试

**方法：**
```yaml
scheduling:
  max_parallel: 1      # 串行执行
  queue_strategy: fifo
```

---

### 3. 人工检查点

**方法：**
```yaml
agents:
  - name: agent-1
    tasks:
      - step1: "第一步"
        require_approval: true    # 需要人工确认
```

---

### 4. 诊断模式

**方法：**
```yaml
reporting:
  format: markdown
  include:
    - dependency_graph
    - execution_trace      # 执行轨迹
    - resource_usage         # 资源使用
    - errors_and_warnings    # 错误和警告
  verbose: true             # 详细日志
```

---

### 5. 状态快照

**方法：**
```yaml
shared_state:
  type: file
  database: .team-state/state.json
  snapshot_interval: 60s    # 每 60 秒保存一次
```

恢复：
```bash
/team-resume <team-name> --snapshot .team-state/state.json.20240213-143000
```

---

## Performance Tuning

### 1. 并行度优化

**分析：**
```yaml
reporting:
  include:
    - execution_time      # 查看 agent 执行时间
    - resource_usage       # 查看资源使用
```

**调整：**
```yaml
scheduling:
  max_parallel: 4        # 根据系统资源调整
```

---

### 2. 上下文传递优化

**问题：** 大文件传递增加开销

**方案 1：增量传递**
```yaml
agents:
  - name: producer
    output_file: data/delta.json    # 只输出增量

  - name: consumer
    input_files: [data/base.json, data/delta.json]
```

**方案 2：共享状态**
```yaml
shared_state:
  database: .team-state/state.json

agents:
  - name: producer
    writes: [incremental_data]

  - name: consumer
    reads: [incremental_data]
```

---

### 3. 资源限制

**预防问题：**
- 某个 agent 耗尽资源
- 总成本超限

**配置：**
```yaml
resource_limits:
  per_agent:
    timeout: 30m
    max_tokens: 100000
    max_cost: 1.00
  total:
    max_cost: 5.00
    max_time: 2h
```

---

## Anti-Patterns（反模式）

### 1. 过度依赖

**问题：**
```yaml
agents:
  - name: agent-1
    depends_on: [agent-2, agent-3, agent-4, agent-5]
```

**后果：**
- agent-1 需要等很久
- 阻塞其他 agent

**改进：**
- 重新设计依赖关系
- 引入中间聚合 agent

---

### 2. 钻环依赖

**问题：**
```yaml
agents:
  - name: agent-1
    depends_on: agent-2
  - name: agent-2
    depends_on: agent-1
```

**后果：**
- 歴锁
- 无法执行

**检测：**
```bash
/team-validate <team-name> --detect-cycles
```

---

### 3. 不必要的数据传递

**问题：**
```yaml
agents:
  - name: agent-1
    output_file: data/huge.json      # 100MB 文件

  - name: agent-2
    input_files: [data/huge.json]
    tasks:
      - analyze: "只需要其中一个字段"
```

**改进：**
- 只传递必要字段
- 使用共享状态的查询接口
- 分解为多个小文件

---

### 4. 忽略资源限制

**问题：**
```yaml
agents:
  - name: heavy-agent
    tasks:
      - process: "处理 100 万条数据"
```

**后果：**
- 超时
- 成本过高
- 阻塞其他任务

**改进：**
- 分解为多个 agent
- 使用循环模式
- 添加资源限制
