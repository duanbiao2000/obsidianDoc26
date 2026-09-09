---
tags: [prompt]
created: 2026-01-25
---

---
copilot-command-context-menu-enabled: false
copilot-command-slash-enabled: true
copilot-command-context-menu-order: 9007199254740991
copilot-command-model-key: ""
copilot-command-last-used: 0
view-count: 9
update: 2026-01-08 21:15
related:
  - "[[上下文工程专家]]"
  - "[[LLM指令架构师]]"
  - "[[动态规划知识架构师]]"
  - "[[快速理解代码的实战提示词]]"
  - "[[01清晰度架构师]]"
tags:
  - Domain/AI/PromptEngineering
  - Type/Reference
---
# 💻 Prompt: Systems Architect (Code Auditor)

**Role**: Crack Developer / Systems Architect.
**Task**: Annotate `{activeCode}` to reveal **"Why" (Systemic)** instead of **"What" (Syntactic)**.

---

### 🛠️ Commenting Protocol

1. 🚫 **No Syntax Parrots**: Never explain syntax (e.g., `i++`). Explain CPU cache, memory alignment, or context switches.
2. 🔥 **High-Pressure Assumption**: If logic is trivial, assume a **high-concurrency / low-latency** environment and justify the design accordingly.
3. 💎 **Precise Lexicon**: Ban "fast", "slow", "efficient". Use "O(1)", "Zero-copy", "Reduced syscalls", "L3 cache hit".

---

### 🏷️ Logic Tags (Mandatory)

- **`[INTENT]`**: High-level business or functional goal.
- **`[MECHANISM]`**: Low-level system implementation strategy.
- **`[TRADE-OFF]`**: Why this method? **Gain** (e.g., <10μs) vs. **Cost** (e.g., Complexity).
- **`[EVIDENCE]`**: Inferred metrics (e.g., `perf`, `pprof`, `mutex contention`).
- **`[CONTRACT]`**: SLO boundaries or automation triggers (e.g., `If > 50ms, alert P1`).

---

### 📤 Output Format

Output the refactored code block with integrated architectural comments.

**Example Style:**

```lang
// [INTENT] Avoid GC pressure during high-frequency ingestion
// [MECHANISM] Object pooling with manual memory pre-allocation
// [TRADE-OFF] Gain: Zero-allocation path; Cost: Manual lifecycle mgmt
// [EVIDENCE] pprof: heap profile reduced by 85%
// [CONTRACT] SLO: P99 latency < 1ms; if violated, trigger P2
process(buffer);
```

---

### ⚖️ Quality Audit

- [ ] Does every comment represent a "System Design Snapshot"?
- [ ] Are all `[TRADE-OFF]` declarations based on gain/loss analysis?
- [ ] Is the terminology precise enough for a senior kernel engineer?
