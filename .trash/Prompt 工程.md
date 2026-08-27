**Prompt 工程**（Prompt Engineering）与 **Agentic Harness**（智能体驾驭/运行框架）代表了基于大语言模型（LLM）开发应用时的两个不同演进阶段与抽象层级。

简而言之：**Prompt 工程是微观层面的“沟通与指令设计”，而 Agentic Harness 是宏观层面的“系统架构与控制外骨骼”。** 

两者的核心关系可以总结为：**Agentic Harness 将 Prompt 工程从“人工编写静态文本”升维为“程序化、动态调度的底层基础设施”。**

---

## 一、概念对比与定位

| 维度 | Prompt 工程 (Prompt Engineering) | Agentic Harness (智能体驾驭框架) |
|---|---|---|
| **核心定位** | **微观视角**：优化单次/少次输入的上下文与指令 | **宏观视角**：为 LLM 提供确定性的运行环境与控制循环 |
| **主要媒介** | 自然语言文本、System Prompt、Few-shot 示例、输出格式规范 | 状态机、代码逻辑循环（ReAct/Reflexion）、工具接口、数据库记忆 |
| **解决的问题** | 如何让 LLM 在**单次生成**中理解意图并输出高质量结果 | 如何让 LLM **跨多轮交互**自主完成复杂、长程、有副作用的任务 |
| **控制力来源** | 依靠 LLM 的注意力机制与上下文理解（软约束） | 依靠代码逻辑、条件分支、状态转移与校验机制（硬约束） |

---

## 二、核心关系解析

### 1. Harness 包含了 Prompt 工程，并实现了 Prompt 的“动态程序化”
在传统 Prompt 工程中，开发者手动编写并拼接字符串（如 System Prompt + User Query）。
而在 Agentic Harness 中，Prompt 变成了**由程序动态构建的组件**：
- Harness 会根据当前的状态（State）、历史记忆（Memory）以及工具执行结果（Observation），**在运行时自动组装 Prompt**。
- 例如：当 Agent 遇到错误时，Harness 会捕捉异常堆栈，动态插入一段“自我反思 Prompt”（Reflexion Prompt），重新送入 LLM。

### 2. 责任解耦： Harness 减轻了 Prompt 工程的“认知负担”
早期开发者试图通过写出“万能 Prompt”（如几千字的复杂 Prompt 包含角色、规则、工具说明、思考步骤、输出格式）来让 LLM 解决复杂问题，但这极易导致模型产生幻觉或忽略指令。

Agentic Harness 采用了**解耦策略**：
- **确定性逻辑归代码**：状态保留、循环控制、异常重试、API 解析、上下文截断等由 Harness 严格控制。
- **不确定性/推理归 Prompt**：单个 Prompt 被拆解为极简的专职任务（如“根据当前日志判断下一个调用的工具”、“总结本轮执行结果”）。

### 3. 控制模式演进：从“期望 LLM 驱动一切”到“代码控制流（Code-driven Harness）”
- **单纯 Prompt 驱动**：让 LLM 决定整个任务的执行计划，并一步步输出下一行动（容易在长链条中迷路或陷入死循环）。
- **Harness 驱动**：Harness 掌握控制权（Control Loop）。Harness 决定何时调用 LLM、何时截断上下文、何时强制插入人工干预（Human-in-the-loop）、何时终止循环。LLM 只是 Harness 内部的一个“推理算子”。

---

## 三、演进路线图 (Paradigm Shift)

```
[ Phase 1: 基础 Prompting ]
  └─ User ──> Raw Prompt ──> LLM ──> Output

[ Phase 2: 高级 Prompt 工程 ]
  └─ User ──> System Prompt + CoT + Few-Shot ──> LLM ──> Direct Output

[ Phase 3: Agentic Harness (当前主流) ]
  ┌──────────────────────── Agentic Harness ────────────────────────┐
  │                                                                │
  │  State / Memory <──> [Dynamic Prompt Builder]                  │
  │                             │                                  │
  │                             ▼                                  │
  │  Control Loop ─────────> LLM Engine                            │
  │    ▲   │                    │                                  │
  │    │   └─ Step Execution ──>┴─> Tool Call / Code Sandbox       │
  │    │                                    │                      │
  │    └──────────────── Observation ───────┘                      │
  └────────────────────────────────────────────────────────────────┘
```

---

## 四、总结与协同关系

- **没有高质量的 Prompt 工程，Harness 会失去精度**：如果 Harness 拼接给 LLM 的动态 Prompt 缺乏规范或存在歧义，LLM 仍会给出错误决策，导致整个 harness 循环失效。
- **没有 Harness 的支持，Prompt 工程上限受限**：单纯靠写 Prompt 无法突破上下文窗口限制、无法保证 100% 格式正确、无法处理复杂的失败重试与长期状态维持。

在现代 [[人工智能]] 与 [[自然语言处理]] 的应用研发中：
- **Prompt 工程** 变成了对底层指令模版与提示策略（如 JSON Schema 强制、CoT 诱导）的精密微调；
- **Agentic Harness** 则成为了真正的“软件工程主体”，负责将这些 Prompt 模块串联为具备高可用性、鲁棒性的智能体系统。

---

## 相关笔记

- [[语篇分析]]：语篇中的上下文结构与逻辑连贯性，为 Harness 的 Context Management 提供了理论参考
- [[ Prompt 工程 ]]：微观指令设计技巧与上下文控制
- [[ Agentic Architecture ]]：智能体 Harness 的状态机设计与控制循环模式
- [[大语言模型]]：底层推理与生成能力的来源


学习 **Agentic Harness**（智能体运行与控制框架）的关键，在于理解框架如何实现**状态循环（Control Loop）**、**状态持久化（State/Memory Management）**、**工具沙箱执行（Tool Sandbox Execution）** 以及 **错误捕获与自我修复（Reflexion/Retry）**。

按**设计范式与学习价值**，将业界主流的开源 Harness 框架整理如下：

---

## 一、 状态机与图驱动 Harness (Graph & State Machine)

这类框架将 Agent 的执行过程抽象为**有向图（Graph）或有限状态机（FSM）**，控制流显式写在代码中，是学习“硬控制流 + 软推理”结合的绝佳样本。

### 1. [[LangGraph]] (LangChain 生态)
- **核心范式**：基于循环图（Cyclic Graph）的状态机 Harness。
- **学习价值**：
  - **State & Checkpoint**：如何通过状态快照（Checkpoint）实现任务中断、重试和历史回滚。
  - **Human-in-the-loop**：如何利用 Harness 的中断机制在关键决策点引入人工审批。
  - **并行与条件分支**：如何用图的边（Edges）和节点（Nodes）控制多分支并发与动态路由。
- **推荐源码阅读点**：`langgraph.graph.StateGraph` 的节点调度逻辑与引擎执行循环。

### 2. [[LlamaIndex Workflows]]
- **核心范式**：基于事件驱动（Event-Driven）的异步工作流 Harness。
- **学习价值**：
  - **事件路由**：通过 `@step` 装饰器和 `Event` 对象实现完全异步解耦的推理流。
  - **适合 RAG + Agent 结合**：清晰地展示了数据检索与智能体工具调用的状态流转。

---

## 二、 极简与“代码即控制流” Harness (Code-Centric & Light)

如果不想被复杂框架的过度封装遮蔽视线，以下极简框架是深入源码、理解 Harness 核心骨架的最佳起点。

### 3. [[smolagents]] (Hugging Face)
- **核心范式**：代码智能体（Code Agent）极简 Harness。
- **学习价值**：
  - **Code-as-Action**：Agent 产生的行动不是 JSON，而是可执行的 Python 代码段。
  - **轻量透明**：核心代码仅约一千行，极度清晰地展示了 `LLM -> Code Parser -> Sandbox Execute -> Feedback -> Loop` 的底层运行 Harness。
- **推荐源码阅读点**：`CodeAgent` 类中的 `run()` 循环与安全 Python 解释器（`LocalPythonInterpreter`）。



---

## 三、 多智能体编排与消息驱动 Harness (Multi-Agent Systems)

这类 Harness 侧重于解决**多个 Agent 如何通过消息传递、协同对话或组织分工**完成复杂任务。

### 5. [[AutoGen]] (Microsoft)
- **核心范式**：异步事件驱动（Event-driven）与消息总线 Harness。
- **学习价值**：
  - **Actor 模型**：AutoGen v0.4 引入了分布式 Actor 架构，展示了高并发、分布式的 Agent Harness 设计。
  - **复杂对话范式**：支持 GroupChat、Two-Agent Chat 以及基于规则的角色切替。

### 6. [[CrewAI]]
- **核心范式**：基于角色（Role-based）与任务流水线（Task Pipeline）的组织型 Harness。
- **学习价值**：
  - **任务依赖管理**：如何在 Harness 层面定义 Sequential（顺序）和 Hierarchical（层级/主管分配）的任务分发逻辑。
  - **工具与记忆协同**：清晰展示了角色、任务、记忆（Memory）三者的绑定模式。

---

## 四、 软件工程与环境沙箱 Harness (Environment & Coding Agents)

这类 Harness 专注于解决**软件工程、命令行交互与代码修改**等高度依赖环境反馈（Feedback Loop）的场景。

### 7. [[SWE-agent]] (Princeton) / [[OpenHands]] (All-Hands AI)
- **核心范式**：Docker 沙箱 + Bash Shell 执行终端 Harness。
- **学习价值**：
  - **Agent-Computer Interface (ACI)**：专门为 LLM 设计的操作界面（如简化版文件编辑器、定制系统的搜索命令）。
  - **环境反馈吞吐**：Harness 如何捕获终端报错、长文本日志截断、代码 AST 树修改并送回 LLM 自我修复。

---

## 框架对比与选型指南

| 框架名称 | 架构范式 | 抽象层级 | 适合学习的核心 Harness 特性 |
|---|---|---|---|
| **LangGraph** | 图与状态机 | 中低层 | 状态恢复、人工干预 (Human-in-the-loop)、复杂有向循环 |
| **smolagents** | 代码执行流 | 极低 | 极简 Loop、代码工具调用、沙箱环境 |
| **AutoGen** | 消息总线/Actor | 中高层 | 异步事件、分布式多 Agent 协同 |
| **CrewAI** | 任务流水线 | 高层 | 基于 role/task 的业务流程编排 |
| **SWE-agent** | 终端与环境 Harness | 中低层 | Docker 沙箱交互、长日志裁剪、软件开发闭环 |

