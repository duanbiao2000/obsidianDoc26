---
type: source
title: "Learn Claude Code: Bash is all you need"
authors: ["shareAI-lab"]
year: 2026
url: "https://github.com/shareAI-lab/learn-claude-code"
venue: "GitHub"
tags: [ai-agents, software-engineering, claude-code, agent-harness]
related: [claude-code, agent-harness-engineering, minimal-agent-loop, worktree-isolation, context-compression, bash-is-all-you-need]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/Learn Claudecode.md"]
---
# Learn Claude Code: Bash is all you need

This source documents the **shareAI-lab/learn-claude-code** repository, an open-source educational project that deconstructs the architecture of [[Claude Code]] to teach developers how to build agent harnesses from scratch. The central thesis is that "Bash is all you need" for agent execution, and that the primary engineering challenge in AI agents is not prompt tuning, but **Harness Engineering**.

## Core Concept: The Agent Harness

The source defines an **Agent Harness** as the environment that allows a model to function in a specific domain. It distinguishes the "Agent" (the intelligence/LLM) from the "Harness" (the infrastructure).

> Harness = Tools + Knowledge + Observation + Action Interfaces + Permissions

*   **Tools:** File I/O, shell, network, database, browser.
*   **Knowledge:** Product docs, domain references, API specs, style guides.
*   **Observation:** Git diff, error logs, browser state, sensor data.
*   **Action:** CLI commands, API calls, UI interactions.
*   **Permissions:** Sandboxing, approval workflows, trust boundaries.

The model acts as the driver, while the harness acts as the vehicle. This pattern generalizes beyond coding to domains like farming, healthcare, and logistics.

## Architectural Breakdown of Claude Code

The source analyzes [[Claude Code]] as an ideal example of an agent harness, composed of:
*   One agent loop
*   Tools (bash, read, write, edit, glob, grep, browser)
*   On-demand skill loading
*   Context compression
*   Subagent spawning
*   Task system with dependency graph
*   Team coordination with async mailboxes
*   Worktree isolation for parallel execution
*   Permission governance

## The 12 Progressive Sessions

The repository outlines a pedagogical path (s01–s12) to build a complex agent harness incrementally:

1.  **s01:** "One loop & Bash is all you need" — Establishing the minimal agent loop.
2.  **s02:** "Adding a tool means adding one handler" — Extending the dispatch map.
3.  **s03:** "An agent without a plan drifts" — Implementing step-by-step planning.
4.  **s04:** "Break big tasks down; each subtask gets a clean context" — Using subagents with independent message histories.
5.  **s05:** "Load knowledge when you need it, not upfront" – Injecting knowledge via `tool_result` rather than system prompts.
6.  **s06:** "Context will fill up; you need a way to make room" — Implementing three-layer context compression.
7.  **s07:** "Break big goals into small tasks, order them, persist to disk" — Creating a file-based task graph with dependencies.
8.  **s08:** "Run slow operations in the background; the agent keeps thinking" — Using daemon threads for asynchronous execution.
9.  **s09:** "When the task is too big for one, delegate to teammates" — Introducing persistent teammates and async mailboxes.
10. **s10:** "Teammates need shared communication rules" — Standardizing request-response patterns for negotiation.
11. **s11:** "Teammates scan the board and claim tasks themselves" — Enabling self-claiming tasks without central assignment.
12. **s12:** "Each works in its own directory, no interference" — Using [[Git Worktree]] for task isolation and parallel execution.

## Key Takeaways

*   **Harness Engineering is Central:** The developer's role shifts from prompt tuner to vehicle builder.
*   **Bash Sufficiency:** Complex tool APIs are often unnecessary; a robust shell interface is sufficient for most agent actions.
*   **Generalizability:** The patterns used in coding agents (perception, reasoning, action) apply to any domain requiring autonomous task execution.
*   **Decoupling:** The "Agent = Model" stance decouples reasoning from execution logic, simplifying design.
