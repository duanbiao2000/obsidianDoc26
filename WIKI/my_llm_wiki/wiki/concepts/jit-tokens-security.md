---
type: concept
title: Just-in-Time (JIT) Tokens Security
tags: [security, ai-development, best-practices]
related: [opencode, ai-coding-agent-core-loop]
created: 2026-06-22
updated: 2026-06-22
sources: ["Journals/How I Actually Use Opencode As A Senior Engineer.md"]
---
# Just-in-Time (JIT) Tokens Security

[[Just-in-Time (JIT) Tokens Security]] refers to a security mechanism where access tokens are generated dynamically for specific, short-lived sessions or tasks, rather than using long-lived static keys. This approach is critical in AI-assisted development to prevent security vulnerabilities.

## Rationale

Static API keys are considered a "massive security hole" because they can be easily compromised through social engineering or accidental exposure. Once exposed, a static key grants persistent access to sensitive resources. JIT tokens mitigate this risk by ensuring that even if a token is intercepted, its utility is limited to a specific context and timeframe.

## Application

Tools like [[OpenCode]] advocate for the use of JIT tokens to manage interactions with LLMs and other services. This ensures that team-based AI coding workflows remain secure without sacrificing efficiency. Developers are encouraged to avoid hardcoding keys and instead rely on dynamic token generation provided by their AI tools or infrastructure.
