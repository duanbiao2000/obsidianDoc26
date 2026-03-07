# Team Configuration Schema

本文档详细描述 Agent Teams YAML 配置文件的完整模式规范。

## Root Object

```yaml
name: string                    # 必需：团队唯一标识符
description: string             # 可选：团队描述
version: string                 # 可选：配置版本号
mode: enum                      # 可选：协同时式 [parallel|pipeline|dag]，默认 dag
extends: string                  # 可选：继承的模板名称

parameters: []                  # 可选：模板参数定义
agents: []                      # 必需：Agent 定义列表
scheduling: {}                  # 可选：调度策略配置
load_balancing: {}              # 可选：负载均衡配置
error_handling: {}              # 可选：错误处理策略
resource_limits: {}             # 可选：资源限制
shared_state: {}                # 可选：共享状态配置
reporting: {}                   # 可选：结果报告配置
```

## Agent Definition

```yaml
agents:
  - name: string                # 必需：Agent 唯一标识符
    role: string                # 可选：Agent 角色描述
    description: string          # 可选：详细描述

    # 依赖关系
    depends_on: string | []     # 可选：依赖的 agent 名称(s)
    next: string                # 可选：流水线下一个 agent

    # 任务定义
    tasks: []                  # 可选：任务列表（二选一）
      - <task_name>: string      # 任务描述
        input: string | []      # 可选：输入文件(s)
        output: string           # 可选：输出文件

    # 直接指令（二选一）
    prompt: string              # 可选：直接执行的指令

    # 上下文传递
    input_files: []            # 可选：输入文件列表
    output_file: string         # 可选：输出文件路径
    returns: string             # 可选：返回的变量名
    receives_from: string       # 可选：接收来自上游的变量（格式：agent.variable）

    # 共享状态访问
    reads: []                  # 可选：从共享状态读取的键
    writes: []                 # 可选：写入共享状态的键

    # 执行控制
    priority: integer           # 可选：优先级（1-10，数字越小优先级越高）
    condition: string           # 可选：执行条件（Jinja2 模板）
    timeout: string             # 可选：超时时间（如：30m）
    retries: integer            # 可选：重试次数

    # 错误处理
    on_failure: enum           # 可选：失败处理 [continue|stop|retry|fallback]
    fallback_to: string         # 可选：降级时使用的 agent

    # 循环执行
    loop: {}                   # 可选：循环配置
    parallel: boolean           # 可选：是否并行执行循环

    # 资源限制
    max_tokens: integer         # 可选：最大 token 使用
    max_cost: float            # 可选：最大成本
```

## Task Definition

```yaml
tasks:
  - <task_name>: string       # 必需：任务名称和描述
    input: string | []         # 可选：输入文件(s)
    output: string             # 可选：输出文件
    timeout: string            # 可选：超时时间
    retries: integer           # 可选：重试次数
```

## Scheduling Configuration

```yaml
scheduling:
  max_parallel: integer        # 最大并行 agent 数量（默认：无限制）
  queue_strategy: enum         # 队列策略 [fifo|priority|dependency_aware]
  resource_aware: boolean     # 是否启用资源感知调度

  thresholds:                 # 资源阈值
    cpu: string               # CPU 使用率阈值（如：80%）
    memory: string            # 内存使用率阈值
    tokens: integer           # Token 使用阈值
```

## Load Balancing Configuration

```yaml
load_balancing:
  strategy: enum              # 负载均衡策略 [round_robin|least_loaded|dynamic]
  check_interval: string       # 健康检查间隔（如：10s）

  resource_thresholds:         # 资源阈值
    cpu: string
    memory: string
    tokens: integer
```

## Error Handling Configuration

```yaml
error_handling:
  on_failure: enum            # 全局失败处理策略 [continue|stop|retry]
  log_errors: boolean          # 是否记录错误日志

  retry_policy:               # 重试策略
    max_attempts: integer      # 最大重试次数
    backoff: enum             # 退避策略 [exponential|linear]
    base_delay: string        # 基础延迟（如：5s）
    max_delay: string         # 最大延迟

  fallback_policy:            # 降级策略
    enabled: boolean          # 是否启用降级
    max_fallbacks: integer    # 最大降级层数
```

## Resource Limits Configuration

```yaml
resource_limits:
  per_agent:                 # 每个 agent 的限制
    timeout: string            # 超时时间
    max_tokens: integer        # 最大 token
    max_cost: float           # 最大成本

  total:                      # 全局限制
    max_cost: float           # 团队最大成本
    max_tokens: integer       # 团队最大 token
    max_time: string          # 团队最大执行时间
```

## Shared State Configuration

```yaml
shared_state:
  type: enum                  # 状态存储类型 [file|database|memory]
  database: string             # 数据库路径（file 类型）
  table: string                # 表名（database 类型）

  schema: {}                   # 状态模式（可选）
  initial_state: {}            # 初始状态（可选）
```

## Reporting Configuration

```yaml
reporting:
  format: enum                # 报告格式 [markdown|json|html]
  output: string              # 输出文件路径
  real_time: boolean          # 是否实时更新

  include: []                 # 包含的内容
    - agent_outputs           # Agent 输出
    - execution_time          # 执行时间
    - resource_usage          # 资源使用
    - errors_and_warnings     # 错误和警告
    - dependency_graph        # 依赖关系图
    - cost_breakdown          # 成本明细

  aggregation:                # 聚合方式
    time_precision: string     # 时间精度（如：1s）
    cost_precision: integer   # 成本精度（小数位）
```

## Loop Configuration

```yaml
loop:
  over: []                   # 必需：迭代列表
  parallel: boolean            # 可选：是否并行执行迭代
  max_iterations: integer      # 可选：最大迭代次数

  item_var: string           # 可选：迭代项变量名（默认：item）
  index_var: string           # 可选：索引变量名（默认：index）

  continue_on_error: boolean  # 可选：出错后是否继续
```

## Template Parameters

```yaml
parameters:
  - name: string              # 必需：参数名
    type: enum                # 参数类型 [string|integer|float|boolean|list]
    required: boolean          # 是否必填
    default: any              # 可选：默认值
    description: string        # 可选：参数描述
    options: []               # 可选：可选项（enum 类型）
```

## 完整示例

```yaml
name: example-team
description: 示例团队配置
version: 1.0
mode: dag

parameters:
  - name: focus_topic
    type: string
    required: true
    description: 研究主题

shared_state:
  type: file
  database: .team-state/state.json
  schema:
    research_data: object
    analysis_results: object
    final_report: string

scheduling:
  max_parallel: 3
  queue_strategy: dependency_aware
  resource_aware: true

error_handling:
  on_failure: continue
  retry_policy:
    max_attempts: 2
    backoff: exponential
    base_delay: 5s

resource_limits:
  per_agent:
    timeout: 30m
    max_tokens: 100000
  total:
    max_cost: 5.00

reporting:
  format: markdown
  output: TEAM_REPORT.md
  include:
    - agent_outputs
    - execution_time
    - resource_usage
    - dependency_graph

agents:
  - name: researcher
    role: 研究专家
    description: 负责收集和分析信息
    priority: 1
    tasks:
      - research: "{{focus_topic}} 的深度研究"
        output: research/data.json
    writes: [research_data]
    on_failure: retry

  - name: analzer
    role: 分析专家
    description: 负责数据分析
    depends_on: researcher
    priority: 2
    tasks:
      - analyze: "分析研究数据"
        input: research/data.json
        output: analysis/results.json
    reads: [research_data]
    writes: [analysis_results]

  - name: reporter
    role: 报告专家
    description: 负责撰写报告
    depends_on: analzer
    priority: 3
    tasks:
      - compile: "生成最终报告"
        input: [research/data.json, analysis/results.json]
        output: FINAL_REPORT.md
    reads: [research_data, analysis_results]
    writes: [final_report]
```

## 验证规则

1. **必填字段**：`name` 是根对象和每个 agent 的必填字段
2. **唯一性**：`agent.name` 必须在团队内唯一
3. **依赖完整性**：`depends_on` 引用的 agent 必须存在
4. **无循环依赖**：依赖关系图不能有环
5. **流水线一致性**：`mode: pipeline` 时，`next` 链条必须完整
6. **文件路径**：所有文件路径相对于团队配置文件目录
7. **模版变量**：`parameters` 中定义的变量才能在模版中使用
8. **资源限制**：`total.max_cost` 不能低于所有 `per_agent.max_cost` 之和
