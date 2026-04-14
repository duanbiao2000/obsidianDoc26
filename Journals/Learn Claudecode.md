---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source:
related:
  - "[[Bash Is All You Need]]"
---

[GitHub - shareAI-lab/learn-claude-code: Bash is all you need -  A nano claude code–like 「agent harness」, built from 0 to 1 · GitHub](https://github.com/shareAI-lab/learn-claude-code)

Building the harness. Writing the code that gives the model an environment to operate in. This is what most of us do, and it is the focus of this repository.

A harness is everything the agent needs to function in a specific domain:

> Harness = Tools + Knowledge + Observation + Action Interfaces + Permissions

> [!note]
> Tools: file I/O, shell, network, database, browser
> Knowledge: product docs, domain references, API specs, style guides
> Observation: git diff, error logs, browser state, sensor data
> Action: CLI commands, API calls, UI interactions
> Permissions: sandboxing, approval workflows, trust boundaries

The model decides. The harness executes. The model reasons. The harness provides context. The model is the driver. The harness is the vehicle.

A coding agent's harness is its IDE, terminal, and filesystem access.

A farm agent's harness is its sensor array, irrigation controls, and weather data feeds.

A hotel agent's harness is its booking system, guest communication channels, and facility management APIs.

The agent -- the intelligence, the decision-maker -- is always the model. The harness changes per domain. The agent generalizes across them.

This repo teaches you to build vehicles. Vehicles for coding. But the design patterns generalize to any domain: farm management, hotel operations, manufacturing, logistics, healthcare, education, scientific research. Anywhere a task needs to be perceived, reasoned about, and acted upon -- an agent needs a harness.

# Core Idea (Keyword Chain)

**Agent = Model** (not framework/prompt plumbing)

**Harness Engineering** = core work

**Harness** = Tools + Knowledge + Observation + Action Interfaces + Permissions

**Claude Code** = ideal agent harness example

**Minimal agent loop**: LLM reasoning → tool-use decision → execution → repeat

**12 progressive sessions** (s01–s12): build harness step-by-step

**Bash is all you need**

Harness roles: tool implementation, context management, permission control, knowledge curation

Harness patterns generalize across domains (coding, agriculture, healthcare, manufacturing)

Open-source repo: learn-claude-code, MIT license, teach building real agent environments

```
Claude Code = one agent loop
            + tools (bash, read, write, edit, glob, grep, browser...)
            + on-demand skill loading
            + context compression
            + subagent spawning
            + task system with dependency graph
            + team coordination with async mailboxes
            + worktree isolation for parallel execution
            + permission governance
```

12 progressive sessions, from a simple loop to isolated autonomous execution. Each session adds one harness mechanism. Each mechanism has one motto.

s01   "One loop & Bash is all you need" — one tool + one loop = an agent

s02   "Adding a tool means adding one handler" — the loop stays the same; new tools register into the dispatch map

s03   "An agent without a plan drifts" — list the steps first, then execute; completion doubles

s04   "Break big tasks down; each subtask gets a clean context" — subagents use independent messages[], keeping the main conversation clean

s05   "Load knowledge when you need it, not upfront" — inject via tool_result, not the system prompt

s06   "Context will fill up; you need a way to make room" — three-layer compression strategy for infinite sessions

s07   "Break big goals into small tasks, order them, persist to disk" — a file-based task graph with dependencies, laying the foundation for multi-agent collaboration

s08   "Run slow operations in the background; the agent keeps thinking" — daemon threads run commands, inject notifications on completion

s09   "When the task is too big for one, delegate to teammates" — persistent teammates + async mailboxes

s10   "Teammates need shared communication rules" — one request-response pattern drives all negotiation

s11   "Teammates scan the board and claim tasks themselves" — no need for the lead to assign each one

s12   "Each works in its own directory, no interference" — tasks manage goals, worktrees manage directories, bound by ID

