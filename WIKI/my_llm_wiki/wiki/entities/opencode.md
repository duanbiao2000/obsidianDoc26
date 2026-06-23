---
type: entity
title: OpenCode
tags: [ai-tool, coding-agent, software-development]
related: [claude-code, zen-model-router, ai-coding-agent-core-loop]
created: 2026-06-22
updated: 2026-06-22
sources: ["Journals/How I Actually Use Opencode As A Senior Engineer.md"]
---
# OpenCode

[[OpenCode]] is an AI-powered coding agent tool that has evolved into a de facto leader in its category. It supports multiple interfaces including terminal, full-blown GUI, web, and iPad, allowing for flexible usage scenarios from local development to headless server operations.

## Features

*   **Multi-Model Support**: Integrates with model routers like [[Zen]] to route requests to various LLMs such as [[Claude]] or Big Pickle for cost and performance optimization.
*   **Sub-Agent Architecture**: Supports the creation of specialized sub-agents for tasks like planning, building, and code review, which helps reduce AI hallucinations.
*   **Integration**: Deeply integrated with [[GitHub]] for PR reviews and interactions, and supports editing instructions via [[Neovim]].
*   **Session Management**: Uses [[SQLite]] for session storage to improve retrieval speed and context management.
*   **Configuration**: Highly customizable via `opencode.json` for global or project-level settings.

## Security Model

OpenCode emphasizes security by advocating for Just-in-Time (JIT) tokens over static API keys, preventing potential security holes associated with hardcoded credentials.
