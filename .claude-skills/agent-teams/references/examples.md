# Agent Teams Examples

本文档包含完整的 Agent Teams 配置示例，涵盖各种实际使用场景。

## Example 1: Fullstack Development Team

**场景：** 全栈开发团队同时开发前端、后端、DevOps 配置

```yaml
name: fullstack-dev-team
description: 全栈开发团队 - 前端/后端/DevOps 并行开发
version: 1.0
mode: parallel

scheduling:
  max_parallel: 3
  resource_aware: true

error_handling:
  on_failure: continue

agents:
  - name: frontend-dev
    role: 前端开发工程师
    tasks:
      - setup: "初始化 React 项目"
        output: frontend/package.json
      - develop: "实现用户界面组件"
        output: frontend/src/components/UserInterface.tsx

  - name: backend-dev
    role: 后端开发工程师
    tasks:
      - setup: "初始化 Node.js API"
        output: backend/package.json
      - develop: "实现 RESTful API 端点"
        output: backend/src/api/routes.js

  - name: devops-eng
    role: DevOps 工程师
    tasks:
      - setup: "创建 Docker 配置"
        output: docker-compose.yml
      - develop: "配置 CI/CD pipeline"
        output: .github/workflows/deploy.yml
```

**执行流程：**

1. 三个 agent 同时启动
2. 各自独立完成开发任务
3. 失败不影响其他 team 成员
4. 最终需要人工集成（或使用下一个示例的集成 agent）

---

## Example 2: Research → Analysis → Report Pipeline

**场景：** 技术调研的流水线处理

```yaml
name: tech-research-pipeline
description: 技术调研团队 - 研究/分析/报告流水线
version: 1.0
mode: pipeline

shared_state:
  type: file
  database: .team-state/research.db

agents:
  - name: tech-researcher
    role: 技术研究员
    description: 负责深度技术调研
    tasks:
      - investigate: "调研微前端架构"
        output: research/micro-frontends.md
      - compare: "对比 qiankun vs single-spa"
        output: research/comparison.md
    writes: [research_data]

  - name: analyst
    role: 技术分析师
    description: 分析研究结果并提供建议
    depends_on: tech-researcher
    tasks:
      - analyze: "分析各方案优劣"
        input: [research/micro-frontends.md, research/comparison.md]
        output: analysis/evaluation.md
    reads: [research_data]
    writes: [analysis_result]

  - name: report-writer
    role: 技术文档撰写
    description: 撰写决策报告
    depends_on: analyst
    tasks:
      - write: "撰写技术选型报告"
        input: analysis/evaluation.md
        output: TECH_DECISION_REPORT.md
    reads: [analysis_result]

reporting:
  format: markdown
  output: RESEARCH_PIPELINE_REPORT.md
  include:
    - agent_outputs
    - execution_time
```

**执行流程：**

```
Researcher → Analyst → Writer
   ↓             ↓          ↓
 原始数据    分析数据   最终报告
```

---

## Example 3: Competitive Analysis Team

**场景：** 竞品分析 - 多维度并行分析后聚合

```yaml
name: competitive-analysis
description: 竞品分析团队 - 产品/技术/市场/体验四维度
version: 1.0
mode: dag

scheduling:
  max_parallel: 4
  queue_strategy: priority

error_handling:
  on_failure: continue

agents:
  # 第一层：并行分析（优先级 1）
  - name: product-analyst
    role: 产品分析
    priority: 1
    tasks:
      - analyze: "分析竞品功能特性和定位"
        target: "Notion"
        output: analysis/product.md

  - name: tech-analyst
    role: 技术分析
    priority: 1
    tasks:
      - analyze: "分析竞品技术栈和架构"
        target: "Notion"
        output: analysis/tech.md

  - name: market-analyst
    role: 市场分析
    priority: 1
    tasks:
      - analyze: "分析竞品市场规模和增长"
        target: "Notion"
        output: analysis/market.md

  - name: ux-analyst
    role: 用户体验分析
    priority: 1
    tasks:
      - analyze: "分析竞品 UX 设计和交互"
        target: "Notion"
        output: analysis/ux.md

  # 第二层：聚合报告（优先级 2）
  - name: report-compiler
    role: 报告汇总
    priority: 2
    depends_on: [product-analyst, tech-analyst, market-analyst, ux-analyst]
    tasks:
      - compile: "聚合竞品分析报告"
        input: [analysis/product.md, analysis/tech.md, analysis/market.md, analysis/ux.md]
        output: COMPETITIVE_ANALYSIS_NOTION.md

reporting:
  format: markdown
  output: ANALYSIS_REPORT.md
  include:
    - dependency_graph
    - execution_time
    - resource_usage
```

**依赖图：**

```
[product] ───┐
[tech]    ───┴──> [report-compiler]
[market]   ───┘
[ux]     ───┘
```

---

## Example 4: Code Review Team

**场景：** 代码审查 - 多维度并行审查

```yaml
name: code-review-team
description: 代码审查团队 - 安全/性能/架构/测试四维度
version: 1.0
mode: dag

parameters:
  - name: target_branch
    type: string
    required: true
    description: 目标分支

agents:
  - name: security-reviewer
    role: 安全审查
    priority: 1
    tasks:
      - review: "安全漏洞扫描（SQL 注入、XSS、认证授权）"
        target_branch: "{{target_branch}}"
        output: reviews/security.md

  - name: performance-reviewer
    role: 性能审查
    priority: 1
    tasks:
      - review: "性能分析（算法复杂度、数据库查询、缓存策略）"
        target_branch: "{{target_branch}}"
        output: reviews/performance.md

  - name: architecture-reviewer
    role: 架构审查
    priority: 1
    tasks:
      - review: "架构评估（模块化、可扩展性、设计模式）"
        target_branch: "{{target_branch}}"
        output: reviews/architecture.md

  - name: test-reviewer
    role: 测试审查
    priority: 1
    tasks:
      - review: "测试覆盖率和质量（单元测试、集成测试、E2E）"
        target_branch: "{{target_branch}}"
        output: reviews/testing.md

  - name: report-compiler
    role: 审查报告汇总
    priority: 2
    depends_on: [security-reviewer, performance-reviewer, architecture-reviewer, test-reviewer]
    tasks:
      - compile: "生成代码审查报告"
        input: [reviews/security.md, reviews/performance.md, reviews/architecture.md, reviews/testing.md]
        output: CODE_REVIEW_REPORT.md

reporting:
  format: markdown
  output: REVIEW_SUMMARY.md
```

**使用方式：**

```bash
/team-launch code-review --target-branch "feature/user-auth"
```

---

## Example 5: Multi-Language Migration Team

**场景：** 多语言代码库迁移（扇出扇入模式）

```yaml
name: multi-lang-migration
description: 多语言代码库迁移 - Python/Go/Rust/Java 四路并行后聚合
version: 1.0
mode: dag

scheduling:
  max_parallel: 4
  resource_aware: true

resource_limits:
  per_agent:
    timeout: 1h
  total:
    max_time: 3h

agents:
  # 第一阶段：代码分析（并行）
  - name: python-analyst
    role: Python 代码分析
    tasks:
      - analyze: "分析 Python 代码库结构和依赖"
        output: analysis/python/structure.json

  - name: go-analyst
    role: Go 代码分析
    tasks:
      - analyze: "分析 Go 代码库结构和依赖"
        output: analysis/go/structure.json

  - name: rust-analyst
    role: Rust 代码分析
    tasks:
      - analyze: "分析 Rust 代码库结构和依赖"
        output: analysis/rust/structure.json

  - name: java-analyst
    role: Java 代码分析
    tasks:
      - analyze: "分析 Java 代码库结构和依赖"
        output: analysis/java/structure.json

  # 第二阶段：迁移策略制定（并行）
  - name: python-strategist
    role: Python 迁移策略
    depends_on: python-analyst
    tasks:
      - plan: "制定 Python 到 TypeScript 迁移计划"
        input: analysis/python/structure.json
        output: plans/python.md

  - name: go-strategist
    role: Go 迁移策略
    depends_on: go-analyst
    tasks:
      - plan: "制定 Go 到 TypeScript 迁移计划"
        input: analysis/go/structure.json
        output: plans/go.md

  - name: rust-strategist
    role: Rust 迁移策略
    depends_on: rust-analyst
    tasks:
      - plan: "制定 Rust 到 TypeScript 迁移计划"
        input: analysis/rust/structure.json
        output: plans/rust.md

  - name: java-strategist
    role: Java 迁移策略
    depends_on: java-analyst
    tasks:
      - plan: "制定 Java 到 TypeScript 迁移计划"
        input: analysis/java/structure.json
        output: plans/java.md

  # 第三阶段：综合评估
  - name: integration-architect
    role: 集成架构师
    depends_on: [python-strategist, go-strategist, rust-strategist, java-strategist]
    tasks:
      - evaluate: "评估所有迁移方案并制定综合策略"
        input: [plans/python.md, plans/go.md, plans/rust.md, plans/java.md]
        output: MIGRATION_STRATEGY.md
```

---

## Example 6: Automated Testing Team

**场景：** 自动化测试 - 单元/集成/E2E/性能四层测试

```yaml
name: automated-testing
description: 自动化测试团队 - 多层测试流水线
version: 1.0
mode: pipeline

error_handling:
  on_failure: continue

agents:
  - name: unit-tester
    role: 单元测试
    tasks:
      - test: "运行单元测试（pytest）"
        output: reports/unit.xml

  - name: integration-tester
    role: 集成测试
    depends_on: unit-tester
    tasks:
      - test: "运行集成测试（Docker compose）"
        output: reports/integration.xml

  - name: e2e-tester
    role: E2E 测试
    depends_on: integration-tester
    tasks:
      - test: "运行 E2E 测试（Playwright）"
        output: reports/e2e.xml

  - name: performance-tester
    role: 性能测试
    depends_on: e2e-tester
    tasks:
      - test: "运行性能基准测试（k6）"
        output: reports/performance.json

  - name: coverage-analyst
    role: 覆盖率分析
    depends_on: [unit-tester, integration-tester, e2e-tester]
    tasks:
      - analyze: "分析测试覆盖率和质量"
        input: [reports/unit.xml, reports/integration.xml, reports/e2e.xml]
        output: TEST_QUALITY_REPORT.md
```

---

## Example 7: Document Translation Team

**场景：** 文献翻译 - 并行翻译后审校

```yaml
name: doc-translation
description: 文献翻译团队 - 分章并行翻译后统一审校
version: 1.0
mode: dag

parameters:
  - name: target_language
    type: string
    required: true
    description: 目标语言

agents:
  # 并行翻译各章节
  - name: chapter1-translator
    role: 第 1 章译者
    tasks:
      - translate: "翻译第 1 章到 {{target_language}}"
        source: docs/en/chapter1.md
        output: docs/{{target_language}}/chapter1.md

  - name: chapter2-translator
    role: 第 2 章译者
    tasks:
      - translate: "翻译第 2 章到 {{target_language}}"
        source: docs/en/chapter2.md
        output: docs/{{target_language}}/chapter2.md

  - name: chapter3-translator
    role: 第 3 章译者
    tasks:
      - translate: "翻译第 3 章到 {{target_language}}"
        source: docs/en/chapter3.md
        output: docs/{{target_language}}/chapter3.md

  # 统一审校
  - name: proofreader
    role: 审校
    depends_on: [chapter1-translator, chapter2-translator, chapter3-translator]
    tasks:
      - proofread: "审校并统一术语和风格"
        input: [docs/{{target_language}}/chapter1.md, docs/{{target_language}}/chapter2.md, docs/{{target_language}}/chapter3.md]
        output: docs/{{target_language}}/REVIEWED/
```

---

## Example 8: CI/CD Pipeline Team

**场景：** CI/CD 流水线 - 构建/测试/部署/监控

```yaml
name: cicd-pipeline
description: CI/CD 流水线团队
version: 1.0
mode: pipeline

error_handling:
  on_failure: stop
  retry_policy:
    max_attempts: 2
    backoff: exponential
    base_delay: 30s

agents:
  - name: builder
    role: 构建工程师
    tasks:
      - build: "构建 Docker 镜像"
        output: build/image.tar

  - name: tester
    role: 测试工程师
    depends_on: builder
    tasks:
      - test: "运行测试套件"
        output: tests/results.xml

  - name: deployer
    role: 部署工程师
    depends_on: tester
    tasks:
      - deploy: "部署到预发环境"
        output: deploy/pre.log
      - smoke_test: "冒烟测试"
        output: tests/smoke.xml

  - name: monitor
    role: 监控工程师
    depends_on: deployer
    tasks:
      - monitor: "监控部署后指标"
        duration: 5m
        output: monitoring/metrics.json
```

---

## Example 9: Data Processing Pipeline

**场景：** 数据处理 - ETL 流水线

```yaml
name: data-etl
description: 数据 ETL 流水线团队
version: 1.0
mode: pipeline

shared_state:
  type: file
  database: .team-state/data.db

agents:
  - name: extractor
    role: 数据抽取
    tasks:
      - extract: "从多个 API 抽取数据"
        apis: [api1, api2, api3]
        output: data/raw.json
    writes: [raw_data]

  - name: cleaner
    role: 数据清洗
    depends_on: extractor
    tasks:
      - clean: "清洗去重和格式化"
        input: data/raw.json
        output: data/clean.json
    reads: [raw_data]
    writes: [clean_data]

  - name: transformer
    role: 数据转换
    depends_on: cleaner
    tasks:
      - transform: "转换到目标模式"
        input: data/clean.json
        output: data/transformed.json
    reads: [clean_data]
    writes: [transformed_data]

  - name: loader
    role: 数据加载
    depends_on: transformer
    tasks:
      - load: "加载到数据仓库"
        input: data/transformed.json
        output: etl/load-report.json
    reads: [transformed_data]
```

---

## Example 10: Microservices Architecture Evaluation

**场景：** 微服务架构评估 - 多维度评估后决策

```yaml
name: microservices-eval
description: 微服务架构评估团队
version: 1.0
mode: dag

agents:
  # 并行评估各维度
  - name: scalability-evaluator
    role: 可扩展性评估
    priority: 1
    tasks:
      - evaluate: "评估水平扩展能力"
        output: evaluation/scalability.md

  - name: reliability-evaluator
    role: 可靠性评估
    priority: 1
    tasks:
      - evaluate: "评估容错和恢复能力"
        output: evaluation/reliability.md

  - name: complexity-evaluator
    role: 复杂度评估
    priority: 1
    tasks:
      - evaluate: "评估开发和运维复杂度"
        output: evaluation/complexity.md

  - name: cost-evaluator
    role: 成本评估
    priority: 1
    tasks:
      - evaluate: "评估基础设施成本"
        output: evaluation/cost.md

  - name: latency-evaluator
    role: 延迟评估
    priority: 1
    tasks:
      - evaluate: "评估网络延迟影响"
        output: evaluation/latency.md

  # 综合决策
  - name: decision-maker
    role: 决策制定
    priority: 2
    depends_on: [scalability-evaluator, reliability-evaluator, complexity-evaluator, cost-evaluator, latency-evaluator]
    tasks:
      - decide: "综合评估并制定架构决策"
        input: [evaluation/scalability.md, evaluation/reliability.md, evaluation/complexity.md, evaluation/cost.md, evaluation/latency.md]
        output: ARCHITECTURE_DECISION.md
```

---

## Template Examples

### 自定义模板示例

**文件位置：** `~/.claude/teams/templates/blog-post.template.yaml`

```yaml
name: blog-post
description: 博客文章创作团队模板
version: 1.0

parameters:
  - name: topic
    type: string
    required: true
    description: 文章主题

  - name: tone
    type: string
    required: false
    default: professional
    options: [casual, professional, academic, technical]

  - name: word_count
    type: integer
    required: false
    default: 1500
    description: 目标字数

agents:
  - name: researcher
    role: 研究员
    tasks:
      - research: "搜集 {{topic}} 相关资料和案例"
        output: research/materials.md

  - name: outline-writer
    role: 大纲撰写
    depends_on: researcher
    tasks:
      - outline: "撰写文章大纲（目标字数：{{word_count}}）"
        input: research/materials.md
        output: draft/outline.md

  - name: content-writer
    role: 内容撰写
    depends_on: outline-writer
    tasks:
      - write: "撰写完整文章（语调：{{tone}}）"
        input: draft/outline.md
        output: draft/article.md

  - name: editor
    role: 编辑审校
    depends_on: content-writer
    tasks:
      - edit: "编辑审校文章"
        input: draft/article.md
        output: final/BLOG_POST.md

reporting:
  format: markdown
  output: BLOG_CREATION_REPORT.md
```

**使用方式：**

```bash
/team-create blog-post --topic "AI Agent 编排" --tone technical --word-count 2500
```

---

## Quick Start Examples

### 示例 1：简单并行团队

**用户请求：** "帮我调研 Python、Go、Rust 的性能"

**自动生成的团队配置：**

```yaml
name: auto-performance-research
mode: parallel

agents:
  - name: python-researcher
    tasks:
      - research: "Python 性能特性和基准测试"
        output: research/python.md

  - name: go-researcher
    tasks:
      - research: "Go 性能特性和基准测试"
        output: research/go.md

  - name: rust-researcher
    tasks:
      - research: "Rust 性能特性和基准测试"
        output: research/rust.md
```

---

### 示例 2：流水线团队

**用户请求：** "先分析竞品，再给出产品建议"

**自动生成的团队配置：**

```yaml
name: auto-competitive-analysis
mode: pipeline

agents:
  - name: analyst
    tasks:
      - analyze: "分析主要竞品"
        output: analysis/competitive.md

  - name: advisor
    depends_on: analyst
    tasks:
      - advise: "基于竞品分析给出产品建议"
        input: analysis/competitive.md
        output: ADVICE.md
```
