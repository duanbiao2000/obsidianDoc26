# Agentic Architecture：智能体 Harness 的状态机设计与控制循环模式

---

## 属性与元数据

- **定义**： Agentic Architecture（智能体架构）是指利用确定性软件工程手段（如有限状态机、有向图控制流、沙箱环境及状态持久化）为概率性的大语言模型（LLM）构建运行与驱动外骨骼（Harness）的设计范式。
- **核心组件**： 控制循环（Control Loop）、状态机（State Machine）、记忆系统（Memory System）、工具沙箱（Tool Sandbox）、防御性断言（Guardrails）
- **适用领域**： [[人工智能]]、系统架构、自动化工作流、[[大语言模型]]应用开发
- **关联概念**： [[ Prompt 工程 ]]、[[LangGraph]]、[[smolagents]]、[[语篇分析]]

---

## 概述

早期的 Agent 尝试（如早期的 AutoGPT）过度依赖 LLM 的完全自主性，仅凭一段包含多重指导规则的单体 Prompt 试图驱动整个多轮任务，这极易导致模型进入无休止死循环、偏离目标或出现严重的幻觉断层。

现代 **Agentic Architecture** 的核心哲学是 **“代码接管控制流，LLM 负责局部推理”**。智能体 Harness 通过**状态机（State Machine）** 约束系统的合规状态转换，并通过**控制循环（Control Loop）** 精确调度 LLM 的计算周期、上下文构建与外部工具调用，从而在保持智能体灵活性的同时，获得工程级别的确定性与鲁棒性。

---

## 控制循环模式 (Control Loop Patterns)

控制循环是 Harness 的驱动引擎（Engine Loop），负责在每一次运行周期中完成 `输入拼接 -> 模型推理 -> 工具执行 -> 状态更新` 的闭环。

```
                    ┌──────────────────────────────────────────────┐
                    │               Agentic Harness                │
                    │                                              │
    ┌───────┐       │   ┌─────────────┐       ┌────────────────┐   │
    │ Input │───────┼──>│ State Input │──────>│ Dynamic Prompt │   │
    └───────┘       │   └─────────────┘       └───────┬────────┘   │
                        │                             │            │
                        │                             ▼            │
    ┌────────┐      │   ┌─────────────┐       ┌────────────────┐   │
    │ Output │<─────┼───│ Final State │       │   LLM Engine   │   │
    └────────┘      │   └─────────────┘       └───────┬────────┘   │
                        │      ▲                      │            │
                        │      │                      ▼            │
                        │   ┌──┴──────────┐       ┌────────────────┐   │
                        │   │ State Check │<──────│ Exec / Observe │   │
                        │   └─────────────┘       └────────────────┘   │
                        └──────────────────────────────────────────┘
```

常见的控制循环形态包括以下四大模式：

### 1. ReAct 循环 (Reasoning + Acting Loop)
最基础的控制模式。在每一个步骤（Step）中，Harness 促使 LLM 生成思维链（Thought）与具体动作（Action），Harness 捕获该 Action 并调用工具，得到观测结果（Observation），将其压入上下文继续循环。

- **控制公式**：
  $$S_{t+1} = S_t \cup \{ \text{Thought}_t, \text{Action}_t, \text{Observation}_t \}$$
- **适用场景**： 短链条、直观且交互步骤明确的工具调用任务。

### 2. Reflexion / Self-Correction 循环 (自我评估与反思循环)
在常规执行闭环外增加一个**评价/反思节点（Evaluator/Reflexion Node）**。当工具执行失败（如代码报错、测试未通过）或生成的输出未通过 schema 校验时，Harness 将错误堆栈与历史上下文打包，触发专门的“反思 Prompt”，驱动 LLM 重新调整策略。

- **优势**： 无需人工干预即可在 Harness 内部完成自我修复（Self-healing），显著提升复杂任务的单次成功率。

### 3. Plan-and-Execute 循环 (规划与分步执行循环)
将**宏观规划**与**微观执行**从控制层面上解耦：
- **Planner**： 生成一个结构化的任务列表（Task List / Sub-goals）。
- **Executor Loop**： 针对当前 Task 启动独立的子控制循环完成操作。
- **Re-planner**： 每当一个 Task 完成或遭遇阻碍时，评估全局进度并动态更新后续 Task List。

- **适用场景**： 长程、高复杂度的软件工程任务或多源信息检索任务。

### 4. Code-as-Action 循环 (代码即动作循环)
以 **[[smolagents]]** 为代表的新型 Harness 范式。LLM 不再输出 JSON 格式的工具调用指令，而是直接输出一段合法的可执行代码（如 Python）。Harness 将代码放入轻量级沙箱中运行，并将执行输出（或 Traceback）作为 Observation 返回。

- **优势**： 代码本身具备循环、条件判断与局部变量，大大减少了 Harness 与 LLM 之间的多余 RPC 交互开销。

---

## 状态机设计 (State Machine Design)

状态机是 Harness 控制系统稳定性的“骨架”。通过构建有向有环图（Cyclic Graph），将智能体的运行路径限制在预设的状态节点与转换条件中。

### 1. 显式状态定义 (Explicit State Schema)

传统的 Prompting 仅仅将历史对话记录（Message History）作为隐式状态，容易造成状态混淆。现代 Harness 要求使用强类型语言定义显式状态对象：

```python
from typing import TypedDict, Annotated, List
import operator

class AgentState(TypedDict):
    messages: Annotated[List[dict], operator.add]  # 追加式对话历史
    current_task: str                               # 当前正在执行的任务
    plan: List[str]                                 # 剩余规划路径
    error_count: int                                # 连续失败重试计数
    is_completed: bool                              # 结束标志
```

### 2. 条件转换与边控制 (Conditional Edges)

状态之间的转移由代码逻辑硬约束，而非完全交给 LLM 决定。例如：

- **节点 (Nodes)**： `Planner`、`ToolExecutor`、`ReflexionEngine`、`HumanApproval`。
- **条件边 (Conditional Edges)**：
  - 如果 `error_count > 3` $\rightarrow$ 转移到 `HumanApproval`（人工干预）。
  - 如果 `LLM_Output` 包含 `tool_calls` $\rightarrow$ 转移到 `ToolExecutor`。
  - 如果 `LLM_Output` 包含最终答案 $\rightarrow$ 转移到 `END`。

### 3. 快照与时间旅行 (Checkpointing & Time-Travel)

高效的 Harness 状态机在每一次状态转换后都会对 `AgentState` 进行持久化（Checkpointing）：

- **断点续传（Pause & Resume）**： 在需要人工审核（Human-in-the-loop）的节点挂起状态，待人工确认后再读取 Checkpoint 恢复循环。
- **回滚重试（Time-travel / Rollback）**： 当检测到智能体陷入死胡同或错误分支时，Harness 可直接将状态机倒回 3 个步骤前的 Checkpoint，并插入提示“之前的路径无效，请换一条思路”，实现有向图层面的搜索分支裁剪。

---

## 防护栏与鲁棒性设计 (Guardrails & Robustness)

在状态机和控制循环中，Harness 必须部署防护栏（Guardrails）以抵御非确定性模型的异常行为：

| 异常模式 | Harness 层的应对策略与设计 |
|---|---|
| **死循环 / 震荡** | 维护状态 Hash 历史；若连续 N 次产生相同的工具参数，强制断流并注入 `Reflexion Prompt` |
| **上下文超限** | Harness 实施滑动窗口（Sliding Window）、选择性压栈或语义总结，确保输入严格限制在窗口阈值内 |
| **JSON/Schema 解析错误** | 采用代码级结构化提取器（如 Pydantic）校验，校验失败自动触发带有行号报错信息的修正 Loop |
| **副作用操作失控** | 对写数据库、删文件、高额支付等敏感工具节点强制添加 `Human-in-the-Loop` 状态拦截 |

---

## 代码范例：极简图状态机 Harness (基于 Python 伪代码)

以下展示了一个典型的代码级驱动的控制循环状态机模型：

```python
class AgentHarness:
    def __init__(self, model, tools, max_steps=10):
        self.model = model
        self.tools = tools
        self.max_steps = max_steps

    def run(self, user_query: str):
        # 1. 初始化显式状态
        state = {
            "messages": [{"role": "user", "content": user_query}],
            "step_count": 0,
            "is_done": False
        }

        # 2. 控制循环主引擎 (Control Loop Engine)
        while not state["is_done"] and state["step_count"] < self.max_steps:
            state["step_count"] += 1
            
            # 2a. 动态构建 Prompt (Harness 介入)
            system_prompt = self._build_dynamic_prompt(state)
            
            # 2b. 调用 LLM 节点
            response = self.model.generate(system_prompt, state["messages"])
            state["messages"].append({"role": "assistant", "content": response.text})

            # 2c. 状态机转移逻辑 (State Machine Transition)
            if response.has_tool_calls:
                # 执行工具并捕获 Observation
                obs = self._execute_tools(response.tool_calls)
                state["messages"].append({"role": "tool", "content": obs})
            elif response.is_final_answer:
                state["is_done"] = True
            else:
                # 异常防护机制：既无工具调用又无答案，强制注入反思提示
                state["messages"].append({
                    "role": "user", 
                    "content": "系统提示：你的输出既未调用工具也未回答问题，请指明下一步动作。"
                })

        return state["messages"][-1]["content"]
```

---

## 总结与架构价值

**Agentic Architecture** 标志着生成式 AI 开发从“Prompt 炼金术”向“确定性软件工程”的跨越。

通过引入 **状态机** 与 **控制循环**：
1. **开发者** 重新掌握了系统的控制权（掌控条件分支、异常拦截与状态持久化）。
2. **大语言模型** 被安放在最适合它的位置——作为状态机节点内部的“非线性推理与决策算子”，而非操控一切的脆弱主控器。

---

## 相关笔记

- [[ Prompt 工程 ]]：状态机内部节点微观指令设计的核心方法
- [[LangGraph]]：显式状态图与 Checkpointing 机制的标准 Harness 实现
- [[smolagents]]：以 Code-as-Action 简化控制循环的轻量级 Harness
- [[大语言模型]]：底层推理算子与决策能力来源