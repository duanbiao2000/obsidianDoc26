---
type: concept
title: Agent Harness Engineering
tags: [ai-agents, software-architecture, claude-code]
related: [claude-code, minimal-agent-loop, context-engineering, bash-is-all-you-need, autonomous-agents]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/Learn Claudecode.md"]
---
# Agent Harness Engineering

**Agent Harness Engineering** is the practice of building the environment—tools, context, permissions, and observation interfaces—around a Large Language Model (LLM) to enable it to function as an autonomous agent. It reframes the developer's role from "prompt tuner" to "vehicle builder," where the model is the driver and the harness is the vehicle.

## Definition

A harness is defined by the following components:

> Harness = Tools + Knowledge + Observation + Action Interfaces + Permissions

*   **Tools:** Capabilities such as file I/O, shell access, network requests, and database interactions.
*   **Knowledge:** Domain-specific information, including product documentation, API specs, and style guides, injected on-demand.
*   **Observation:** Feedback mechanisms such as git diffs, error logs, or sensor data that allow the agent to perceive the results of its actions.
*   **Action Interfaces:** The methods by which the agent interacts with the world, often via CLI commands or API calls.
*   **Permissions:** Security boundaries, sandboxing, and approval workflows that govern what the agent is allowed to do.

## Distinction from Prompt Engineering

While prompt engineering focuses on optimizing the input to elicit better reasoning or output from the model, harness engineering focuses on the **execution environment**. It addresses how the agent receives context, how it executes actions, and how it observes outcomes. The harness determines the agent's capabilities in any given domain, whether that be coding, farming, or healthcare.

## Core Principles

*   **Agent = Model:** The "agent" is strictly the intelligence (the LLM). Everything else (frameworks, loops, tools) is external infrastructure. This decouples reasoning from execution logic.
*   **Minimal Agent Loop:** The fundamental unit of agentic behavior is `LLM Reasoning → Tool-use Decision → Execution → Repeat`.
*   **Bash Sufficiency:** A robust shell interface (Bash) is often sufficient for most agent actions, reducing the need for complex, custom tool APIs.
*   **Generalizability:** The patterns used in coding agents (such as [[Claude Code]]) are universal. They can be applied to any task requiring perception, reasoning, and action.

## Implementation Patterns

Key patterns in harness engineering include:
*   **On-Demand Knowledge Injection:** Loading knowledge via `tool_result` rather than stuffing it into the system prompt, preserving context window space.
*   **Context Compression:** Strategies to manage limited context windows, such as multi-layer compression, to enable infinite sessions.
*   **Subagent Spawning:** Breaking large tasks into subtasks, each with its own clean context and independent message history.
*   **Worktree Isolation:** Using [[Git Worktree]] to create separate directory states for parallel task execution, preventing interference between sub-agents.

## Related Concepts

*   [[Context Engineering]]: Harness engineering is a practical application of context engineering principles.
*   [[Minimal Agent Loop]]: The core operational cycle of the harness.
*   [[Bash Is All You Need]]: The philosophy that simple, universal interfaces are preferred over complex, bespoke APIs.
