---
type: atomic
created: 2026-08-26
updated: 2026-08-26
tags: [原子, domain/LLM, type/关系]
---

# 无高质量Prompt则Harness失精度、无Harness则Prompt有上限

**核心**：没有高质量 Prompt 工程，Harness 失去精度；没有 Harness，Prompt 工程上限受限。二者协同——Prompt 变精密微调的底层模版，Harness 变串联模版的软件工程主体。

**为什么 / 证据**：
> 没有高质量的 Prompt 工程，Harness 会失去精度：如果 Harness 拼接给 LLM 的动态 Prompt 缺乏规范或存在歧义，LLM 仍会给出错误决策，导致整个 harness 循环失效。
> 没有 Harness 的支持，Prompt 工程上限受限：单纯靠写 Prompt 无法突破上下文窗口限制、无法保证 100% 格式正确、无法处理复杂的失败重试与长期状态维持。
> 现代应用中：Prompt 工程变成对底层指令模版与提示策略（如 JSON Schema 强制、CoT 诱导）的精密微调；Agentic Harness 则成为真正的"软件工程主体"。

这是理解两者关系的总纲（见 [[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]]、[[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]]）。

**边界 / 反例**：
- 把本该写进代码的校验用 Prompt 硬凑，会两头不讨好（Prompt 不稳定、代码又没兜底）。
- 反之把该用推理的环节写死成代码，会丧失灵活度、难对长尾。

**我的判断**（个人层 / 应用）：
- 我投入顺序：先磨 Prompt 模版（让它稳、格式可解析），再用 Harness 把稳的模版串起来。不在 Prompt 还飘的时候就堆 Harness，那只会放大噪声。

**关联**：[[Prompt工程是微观指令设计、Agentic Harness是宏观控制外骨骼]] [[Harness把确定性逻辑交给代码、把推理拆成极简专职Prompt]] [[Harness运行时按状态记忆与观察动态组装Prompt]]

**开放问题**：在给定预算下，Prompt 精密化与 Harness 鲁棒化之间应如何分配投入？是否存在更优顺序？
