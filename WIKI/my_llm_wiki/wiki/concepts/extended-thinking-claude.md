---
type: concept
title: Extended Thinking (Claude)
created: 2026-06-22
updated: 2026-06-22
tags: [claude, anthropic, reasoning, llm]
related: [prompt-chaining, role-prompting, context-engineering]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# Extended Thinking (Claude)

Extended thinking is Claude's step-by-step reasoning mode for multi-step logic problems. When enabled, Claude works through the problem step-by-step and shows the reasoning chain, allowing users to see where they agree and where the logic needs correction.

## When to Use

The source recommends extended thinking for:
- Multi-step logic problems
- Financial analysis
- Strategy development
- Technical problem-solving
- Any situation where a quick answer might be dangerously wrong

## Relationship to Effort Levels

Extended thinking is related to but distinct from "effort levels" — Anthropic's parameter controlling how much computation Claude uses. The source quotes Anthropic saying "we expect effort to matter more for this version than any prior Claude," and recommends using at least high effort whenever accuracy matters. The exact relationship between extended thinking and effort levels is not fully specified in the source.

## Relationship to Other Techniques

Extended thinking can be combined with [[Prompt Chaining]] for complex analytical workflows. It is complementary to [[Role Prompting]] and [[XML Tag Prompting]].
