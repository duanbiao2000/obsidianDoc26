---
type: concept
title: Minimal Agent Loop
tags: [ai-agents, software-architecture, claude-code]
related: [agent-harness-engineering, autonomous-agents, claude-code]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/Learn Claudecode.md"]
---
# Minimal Agent Loop

The **Minimal Agent Loop** is the fundamental atomic unit of agentic behavior. It describes the basic cycle through which an AI agent perceives, reasons, and acts.

## The Cycle

The loop consists of four stages:

1.  **LLM Reasoning:** The model analyzes the current state, observations, and goals.
2.  **Tool-use Decision:** The model decides which tool or action to take next.
3.  **Execution:** The harness executes the chosen action (e.g., running a Bash command, reading a file).
4.  **Repeat:** The result of the execution is fed back as an observation, and the loop continues.

```
LLM Reasoning → Tool-use Decision → Execution → Observation → Repeat
```

## Significance

*   **Simplicity:** This loop demonstrates that complex agentic behavior emerges from a simple, repetitive process.
*   **Decoupling:** It separates the reasoning engine (the model) from the execution engine (the harness).
*   **Scalability:** This minimal loop can be scaled into complex multi-agent systems by adding layers such as planning, subagents, and task graphs, without changing the core mechanism.

## Implementation

In the [[shareAI-lab/learn-claude-code]] repository, the minimal loop is established in session s01 ("One loop & Bash is all you need"). Subsequent sessions add complexity (planning, subagents, worktrees) but retain this core loop as the foundation.

## Related Concepts

*   [[Agent Harness Engineering]]: The harness provides the tools and observation mechanisms for the loop.
*   [[Autonomous Agents]]: The minimal loop is the basis for autonomy.
*   [[Claude Code]]: An advanced implementation of this loop with additional features like subagent spawning and context compression.
