---
type: concept
title: Context Compression
tags: [ai-agents, llm, claude-code, context-engineering]
related: [context-engineering, agent-harness-engineering, claude-code, cognitive-compression-complexity-compression]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/Learn Claudecode.md"]
---
# Context Compression

**Context Compression** refers to strategies used in AI agent harnesses to manage limited context windows, enabling agents to operate over long sessions without losing critical information or exceeding token limits.

## The Problem

As an agent interacts with its environment, the history of observations, actions, and thoughts grows. Eventually, this history exceeds the model's context window, leading to truncated information or errors.

## Strategies

The [[shareAI-lab/learn-claude-code]] repository outlines a three-layer compression strategy (session s06):

1.  **Summarization:** Condensing long histories of interaction into concise summaries.
2.  **Pruning:** Removing irrelevant or outdated information from the context.
3.  **On-Demand Injection:** Instead of keeping all knowledge in the context, loading specific knowledge via `tool_result` only when needed (session s05).

## Importance

*   **Infinite Sessions:** Compression allows agents to operate indefinitely, rather than being limited by a fixed context window.
*   **Efficiency:** Reduces token usage and cost.
*   **Focus:** Keeps the model's attention on relevant, recent, and critical information.

## Related Concepts

*   [[Context Engineering]]: Context compression is a core technique in managing agent context.
*   [[Agent Harness Engineering]]: The harness is responsible for implementing compression strategies.
*   [[Cognitive Compression (Complexity Compression)]]: A broader concept related to reducing complexity in information processing.
