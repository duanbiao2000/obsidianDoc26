# Agent Reference

Complete reference for all **100 specialized AI agents** organized by category with model assignments.

## Agent Categories

### Architecture & System Design

#### Core Architecture

| Agent                                                                                         | Model  | Description                                                            |
| --------------------------------------------------------------------------------------------- | ------ | ---------------------------------------------------------------------- |
| [backend-architect](Research/agents/plugins/backend-development/agents/backend-architect.md)               | opus   | RESTful API design, microservice boundaries, database schemas          |
| [frontend-developer](Research/agents/plugins/multi-platform-apps/agents/frontend-developer.md)             | sonnet | React components, responsive layouts, client-side state management     |
| [graphql-architect](Research/agents/plugins/backend-development/agents/graphql-architect.md)               | opus   | GraphQL schemas, resolvers, federation architecture                    |
| [architect-reviewer](Research/agents/plugins/comprehensive-review/agents/architect-review.md)              | opus   | Architectural consistency analysis and pattern validation              |
| [cloud-architect](Research/agents/plugins/cloud-infrastructure/agents/cloud-architect.md)                  | opus   | AWS/Azure/GCP infrastructure design and cost optimization              |
| [hybrid-cloud-architect](hybrid-cloud-architect.md)    | opus   | Multi-cloud strategies across cloud and on-premises environments       |
| [kubernetes-architect](Research/agents/plugins/kubernetes-operations/agents/kubernetes-architect.md)       | opus   | Cloud-native infrastructure with Kubernetes and GitOps                 |
| [service-mesh-expert](service-mesh-expert.md)          | opus   | Istio/Linkerd service mesh architecture, mTLS, and traffic management  |
| [event-sourcing-architect](event-sourcing-architect.md) | opus   | Event sourcing, CQRS patterns, event stores, and saga orchestration    |
| [monorepo-architect](monorepo-architect.md)            | opus   | Monorepo tooling with Nx, Turborepo, Bazel, and workspace optimization |

#### UI/UX & Mobile

| Agent                                                                                    | Model  | Description                                             |
| ---------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------- |
| [ui-designer](ui-designer.md)                                | opus   | UI/UX design for mobile and web with modern patterns    |
| [accessibility-expert](accessibility-expert.md)              | opus   | WCAG compliance, accessibility audits, inclusive design |
| [design-system-architect](design-system-architect.md)        | opus   | Design tokens, component libraries, theming systems     |
| [ui-ux-designer](ui-ux-designer.md)                | sonnet | Interface design, wireframes, design systems            |
| [ui-visual-validator](ui-visual-validator.md) | sonnet | Visual regression testing and UI verification           |
| [mobile-developer](Research/agents/plugins/multi-platform-apps/agents/mobile-developer.md)            | sonnet | React Native and Flutter application development        |
| [ios-developer](ios-developer.md)                  | sonnet | Native iOS development with Swift/SwiftUI               |
| [flutter-expert](flutter-expert.md)                | sonnet | Advanced Flutter development with state management      |

### Programming Languages

#### Systems & Low-Level

| Agent                                                             | Model  | Description                                                 |
| ----------------------------------------------------------------- | ------ | ----------------------------------------------------------- |
| [c-pro](c-pro.md)           | sonnet | System programming with memory management and OS interfaces |
| [cpp-pro](cpp-pro.md)       | sonnet | Modern C++ with RAII, smart pointers, STL algorithms        |
| [rust-pro](rust-pro.md)     | sonnet | Memory-safe systems programming with ownership patterns     |
| [golang-pro](golang-pro.md) | sonnet | Concurrent programming with goroutines and channels         |

#### Web & Application

| Agent                                                                               | Model  | Description                                                                       |
| ----------------------------------------------------------------------------------- | ------ | --------------------------------------------------------------------------------- |
| [javascript-pro](javascript-pro.md)         | sonnet | Modern JavaScript with ES6+, async patterns, Node.js                              |
| [typescript-pro](typescript-pro.md)         | sonnet | Advanced TypeScript with type systems and generics                                |
| [python-pro](python-pro.md)                    | sonnet | Python development with advanced features and optimization                        |
| [temporal-python-pro](temporal-python-pro.md) | sonnet | Temporal workflow orchestration with Python SDK, durable workflows, saga patterns |
| [ruby-pro](ruby-pro.md)                             | sonnet | Ruby with metaprogramming, Rails patterns, gem development                        |
| [php-pro](php-pro.md)                               | sonnet | Modern PHP with frameworks and performance optimization                           |

#### Enterprise & JVM

| Agent                                                       | Model  | Description                                                          |
| ----------------------------------------------------------- | ------ | -------------------------------------------------------------------- |
| [java-pro](java-pro.md)     | sonnet | Modern Java with streams, concurrency, JVM optimization              |
| [scala-pro](scala-pro.md)   | sonnet | Enterprise Scala with functional programming and distributed systems |
| [csharp-pro](csharp-pro.md) | sonnet | C# development with .NET frameworks and patterns                     |

#### Specialized Platforms

| Agent                                                                              | Model  | Description                                                                               |
| ---------------------------------------------------------------------------------- | ------ | ----------------------------------------------------------------------------------------- |
| [elixir-pro](elixir-pro.md)               | sonnet | Elixir with OTP patterns and Phoenix frameworks                                           |
| [django-pro](Research/agents/plugins/api-scaffolding/agents/django-pro.md)                      | sonnet | Django development with ORM and async views                                               |
| [fastapi-pro](Research/agents/plugins/api-scaffolding/agents/fastapi-pro.md)                    | sonnet | FastAPI with async patterns and Pydantic                                                  |
| [haskell-pro](haskell-pro.md)             | sonnet | Strongly typed functional programming with purity, advanced type systems, and concurrency |
| [unity-developer](unity-developer.md)           | sonnet | Unity game development and optimization                                                   |
| [minecraft-bukkit-pro](minecraft-bukkit-pro.md) | sonnet | Minecraft server plugin development                                                       |
| [sql-pro](sql-pro.md)                            | sonnet | Complex SQL queries and database optimization                                             |

### Infrastructure & Operations

#### DevOps & Deployment

| Agent                                                                                  | Model  | Description                                                        |
| -------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------------------ |
| [devops-troubleshooter](Research/agents/plugins/incident-response/agents/devops-troubleshooter.md)  | sonnet | Production debugging, log analysis, deployment troubleshooting     |
| [deployment-engineer](Research/agents/plugins/cloud-infrastructure/agents/deployment-engineer.md)   | sonnet | CI/CD pipelines, containerization, cloud deployments               |
| [terraform-specialist](Research/agents/plugins/cloud-infrastructure/agents/terraform-specialist.md) | sonnet | Infrastructure as Code with Terraform modules and state management |
| [dx-optimizer](Research/agents/plugins/team-collaboration/agents/dx-optimizer.md)                   | sonnet | Developer experience optimization and tooling improvements         |

#### Database Management

| Agent                                                                                  | Model  | Description                                                         |
| -------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------------------- |
| [database-optimizer](Research/agents/plugins/observability-monitoring/agents/database-optimizer.md) | sonnet | Query optimization, index design, migration strategies              |
| [database-admin](database-admin.md)              | sonnet | Database operations, backup, replication, monitoring                |
| [database-architect](Research/agents/plugins/database-design/agents/database-architect.md)          | opus   | Database design from scratch, technology selection, schema modeling |

#### Incident Response & Network

| Agent                                                                              | Model  | Description                                         |
| ---------------------------------------------------------------------------------- | ------ | --------------------------------------------------- |
| [incident-responder](../plugins/incident-response/agents/incident-responder.md)    | opus   | Production incident management and resolution       |
| [network-engineer](Research/agents/plugins/observability-monitoring/agents/network-engineer.md) | sonnet | Network debugging, load balancing, traffic analysis |

#### Project Management

| Agent                                                             | Model | Description                                                                          |
| ----------------------------------------------------------------- | ----- | ------------------------------------------------------------------------------------ |
| [conductor-validator](../conductor/agents/conductor-validator.md) | opus  | Validates Conductor project artifacts for completeness, consistency, and correctness |

### Quality Assurance & Security

#### Code Quality & Review

| Agent                                                                                            | Model | Description                                                     |
| ------------------------------------------------------------------------------------------------ | ----- | --------------------------------------------------------------- |
| [code-reviewer](Research/agents/plugins/comprehensive-review/agents/code-reviewer.md)                         | opus  | Code review with security focus and production reliability      |
| [security-auditor](Research/agents/plugins/comprehensive-review/agents/security-auditor.md)                   | opus  | Vulnerability assessment and OWASP compliance                   |
| [backend-security-coder](Research/agents/plugins/data-validation-suite/agents/backend-security-coder.md)      | opus  | Secure backend coding practices, API security implementation    |
| [frontend-security-coder](frontend-security-coder.md) | opus  | XSS prevention, CSP implementation, client-side security        |
| [mobile-security-coder](mobile-security-coder.md)     | opus  | Mobile security patterns, WebView security, biometric auth      |
| [threat-modeling-expert](threat-modeling-expert.md)          | opus  | STRIDE threat modeling, attack trees, and security requirements |

#### Testing & Debugging

| Agent                                                                         | Model  | Description                                                |
| ----------------------------------------------------------------------------- | ------ | ---------------------------------------------------------- |
| [test-automator](Research/agents/plugins/codebase-cleanup/agents/test-automator.md)        | sonnet | Comprehensive test suite creation (unit, integration, e2e) |
| [tdd-orchestrator](Research/agents/plugins/backend-development/agents/tdd-orchestrator.md) | sonnet | Test-Driven Development methodology guidance               |
| [debugger](Research/agents/plugins/error-debugging/agents/debugger.md)                     | sonnet | Error resolution and test failure analysis                 |
| [error-detective](Research/agents/plugins/error-debugging/agents/error-detective.md)       | sonnet | Log analysis and error pattern recognition                 |

#### Performance & Observability

| Agent                                                                                          | Model | Description                                                    |
| ---------------------------------------------------------------------------------------------- | ----- | -------------------------------------------------------------- |
| [performance-engineer](Research/agents/plugins/observability-monitoring/agents/performance-engineer.md)     | opus  | Application profiling and optimization                         |
| [observability-engineer](Research/agents/plugins/observability-monitoring/agents/observability-engineer.md) | opus  | Production monitoring, distributed tracing, SLI/SLO management |
| [search-specialist](search-specialist.md)                  | haiku | Advanced web research and information synthesis                |

### Data & AI

#### Data Engineering & Analytics

| Agent                                                                      | Model  | Description                                             |
| -------------------------------------------------------------------------- | ------ | ------------------------------------------------------- |
| [data-scientist](data-scientist.md) | opus   | Data analysis, SQL queries, BigQuery operations         |
| [data-engineer](data-engineer.md)       | sonnet | ETL pipelines, data warehouses, streaming architectures |

#### Machine Learning & AI

| Agent                                                                                         | Model | Description                                                           |
| --------------------------------------------------------------------------------------------- | ----- | --------------------------------------------------------------------- |
| [ai-engineer](ai-engineer.md)                           | opus  | LLM applications, RAG systems, prompt pipelines                       |
| [ml-engineer](ml-engineer.md)                          | opus  | ML pipelines, model serving, feature engineering                      |
| [mlops-engineer](mlops-engineer.md)                    | opus  | ML infrastructure, experiment tracking, model registries              |
| [prompt-engineer](prompt-engineer.md)                   | opus  | LLM prompt optimization and engineering                               |
| [vector-database-engineer](vector-database-engineer.md) | opus  | Vector databases, embeddings, similarity search, and hybrid retrieval |

### Documentation & Technical Writing

| Agent                                                                                | Model  | Description                                                           |
| ------------------------------------------------------------------------------------ | ------ | --------------------------------------------------------------------- |
| [docs-architect](Research/agents/plugins/code-documentation/agents/docs-architect.md)             | opus   | Comprehensive technical documentation generation                      |
| [api-documenter](Research/agents/plugins/api-testing-observability/agents/api-documenter.md)      | sonnet | OpenAPI/Swagger specifications and developer docs                     |
| [reference-builder](reference-builder.md) | haiku  | Technical references and API documentation                            |
| [tutorial-engineer](Research/agents/plugins/code-documentation/agents/tutorial-engineer.md)       | sonnet | Step-by-step tutorials and educational content                        |
| [mermaid-expert](mermaid-expert.md)       | sonnet | Diagram creation (flowcharts, sequences, ERDs)                        |
| [c4-code](c4-code.md)                              | haiku  | C4 Code-level documentation with function signatures and dependencies |
| [c4-component](c4-component.md)                    | sonnet | C4 Component-level architecture synthesis and documentation           |
| [c4-container](c4-container.md)                    | sonnet | C4 Container-level architecture with API documentation                |
| [c4-context](c4-context.md)                        | sonnet | C4 Context-level system documentation with personas and user journeys |

### Business & Operations

#### Business Analysis & Finance

| Agent                                                                        | Model  | Description                                             |
| ---------------------------------------------------------------------------- | ------ | ------------------------------------------------------- |
| [business-analyst](business-analyst.md) | sonnet | Metrics analysis, reporting, KPI tracking               |
| [quant-analyst](quant-analyst.md)     | opus   | Financial modeling, trading strategies, market analysis |
| [risk-manager](risk-manager.md)       | sonnet | Portfolio risk monitoring and management                |

#### Marketing & Sales

| Agent                                                                             | Model  | Description                                  |
| --------------------------------------------------------------------------------- | ------ | -------------------------------------------- |
| [content-marketer](content-marketer.md)       | sonnet | Blog posts, social media, email campaigns    |
| [sales-automator](sales-automator.md) | haiku  | Cold emails, follow-ups, proposal generation |

#### Support & Legal

| Agent                                                                               | Model  | Description                                             |
| ----------------------------------------------------------------------------------- | ------ | ------------------------------------------------------- |
| [customer-support](customer-support.md) | sonnet | Support tickets, FAQ responses, customer communication  |
| [hr-pro](hr-pro.md)                           | opus   | HR operations, policies, employee relations             |
| [legal-advisor](legal-advisor.md)             | opus   | Privacy policies, terms of service, legal documentation |

### SEO & Content Optimization

| Agent                                                                                                     | Model  | Description                                          |
| --------------------------------------------------------------------------------------------------------- | ------ | ---------------------------------------------------- |
| [seo-content-auditor](seo-content-auditor.md)                      | sonnet | Content quality analysis, E-E-A-T signals assessment |
| [seo-meta-optimizer](seo-meta-optimizer.md)                  | haiku  | Meta title and description optimization              |
| [seo-keyword-strategist](seo-keyword-strategist.md)          | haiku  | Keyword analysis and semantic variations             |
| [seo-structure-architect](seo-structure-architect.md)        | haiku  | Content structure and schema markup                  |
| [seo-snippet-hunter](seo-snippet-hunter.md)                  | haiku  | Featured snippet formatting                          |
| [seo-content-refresher](seo-content-refresher.md)               | haiku  | Content freshness analysis                           |
| [seo-cannibalization-detector](seo-cannibalization-detector.md) | haiku  | Keyword overlap detection                            |
| [seo-authority-builder](../plugins/seo-analysis-monitoring/agents/seo-authority-builder.md)               | sonnet | E-E-A-T signal analysis                              |
| [seo-content-writer](seo-content-writer.md)                        | sonnet | SEO-optimized content creation                       |
| [seo-content-planner](seo-content-planner.md)                      | haiku  | Content planning and topic clusters                  |

### Specialized Domains

| Agent                                                                                   | Model  | Description                                             |
| --------------------------------------------------------------------------------------- | ------ | ------------------------------------------------------- |
| [arm-cortex-expert](arm-cortex-expert.md) | sonnet | ARM Cortex-M firmware and peripheral driver development |
| [blockchain-developer](blockchain-developer.md)       | sonnet | Web3 apps, smart contracts, DeFi protocols              |
| [payment-integration](payment-integration.md)      | sonnet | Payment processor integration (Stripe, PayPal)          |
| [legacy-modernizer](Research/agents/plugins/framework-migration/agents/legacy-modernizer.md)         | sonnet | Legacy code refactoring and modernization               |
| [context-manager](Research/agents/plugins/agent-orchestration/agents/context-manager.md)             | haiku  | Multi-agent context management                          |

## Model Configuration

Agents are assigned to specific Claude models based on task complexity and computational requirements.

### Model Distribution Summary

| Model  | Agent Count | Use Case                                                        |
| ------ | ----------- | --------------------------------------------------------------- |
| Opus   | 42          | Critical architecture, security, code review, production coding |
| Sonnet | 39          | Complex tasks, support with intelligence                        |
| Haiku  | 18          | Fast operational tasks                                          |

### Model Selection Criteria

#### Haiku - Fast Execution & Deterministic Tasks

**Use when:**

- Generating code from well-defined specifications
- Creating tests following established patterns
- Writing documentation with clear templates
- Executing infrastructure operations
- Performing database query optimization
- Handling customer support responses
- Processing SEO optimization tasks
- Managing deployment pipelines

#### Sonnet - Complex Reasoning & Architecture

**Use when:**

- Designing system architecture
- Making technology selection decisions
- Performing security audits
- Reviewing code for architectural patterns
- Creating complex AI/ML pipelines
- Providing language-specific expertise
- Orchestrating multi-agent workflows
- Handling business-critical legal/HR matters

### Hybrid Orchestration Patterns

The plugin ecosystem leverages Sonnet + Haiku orchestration for optimal performance and cost efficiency:

#### Pattern 1: Planning → Execution

```
Sonnet: backend-architect (design API architecture)
  ↓
Haiku: Generate API endpoints following spec
  ↓
Haiku: test-automator (generate comprehensive tests)
  ↓
Sonnet: code-reviewer (architectural review)
```

#### Pattern 2: Reasoning → Action (Incident Response)

```
Sonnet: incident-responder (diagnose issue, create strategy)
  ↓
Haiku: devops-troubleshooter (execute fixes)
  ↓
Haiku: deployment-engineer (deploy hotfix)
  ↓
Haiku: Implement monitoring alerts
```

#### Pattern 3: Complex → Simple (Database Design)

```
Sonnet: database-architect (schema design, technology selection)
  ↓
Haiku: sql-pro (generate migration scripts)
  ↓
Haiku: database-admin (execute migrations)
  ↓
Haiku: database-optimizer (tune query performance)
```

#### Pattern 4: Multi-Agent Workflows

```
Full-Stack Feature Development:
Sonnet: backend-architect + frontend-developer (design components)
  ↓
Haiku: Generate code following designs
  ↓
Haiku: test-automator (unit + integration tests)
  ↓
Sonnet: security-auditor (security review)
  ↓
Haiku: deployment-engineer (CI/CD setup)
  ↓
Haiku: Setup observability stack
```

## Agent Invocation

### Natural Language

Agents can be invoked through natural language when you need Claude to reason about which specialist to use:

```
"Use backend-architect to design the authentication API"
"Have security-auditor scan for OWASP vulnerabilities"
"Get performance-engineer to optimize this database query"
```

### Slash Commands

Many agents are accessible through plugin slash commands for direct invocation:

```bash
/backend-development:feature-development user authentication
/security-scanning:security-sast
/incident-response:smart-fix "memory leak in payment service"
```

## Contributing

To add a new agent:

1. Create `plugins/{plugin-name}/agents/{agent-name}.md`
2. Add frontmatter with name, description, and model assignment
3. Write comprehensive system prompt
4. Update plugin definition in `.claude-plugin/marketplace.json`

See [Contributing Guide](../CONTRIBUTING.md) for details.
