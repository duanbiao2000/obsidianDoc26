---
type: concept
title: Prompt Chaining
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, llm, workflow, decomposition]
related: [role-prompting, xml-tag-prompting, superstructured-prompts, context-engineering, ai-coding-agent-core-loop]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# Prompt Chaining

Prompt chaining is a technique for improving LLM output quality by splitting complex tasks into sequential prompts, each handling a single cognitive subtask. Instead of one giant prompt asking for research, analysis, drafting, and formatting, each step gets its own focused prompt.

## Mechanism

A single giant prompt asking for multiple cognitive tasks forces the model to split its attention, degrading quality on each subtask. By decomposing the work into steps — research in prompt one, analysis in prompt two, drafting in prompt three, formatting in prompt four — each step can be simpler and higher quality.

## Example

From the source: a medical paper workflow with three chained prompts:
1. Summarize the paper
2. Grade the summary from A to F for accuracy
3. Improve the summary based on its own review feedback

A simpler two-step chain: run one prompt for thinking (listing arguments and evidence), then a second prompt to turn that structured thinking into the final polished answer.

## When to Use

Prompt chaining is valuable for any task that involves multiple distinct cognitive operations: research + analysis + writing, or brainstorming + structuring + formatting. It is especially useful when quality matters more than speed.

## Relationship to Other Techniques

Prompt chaining parallels the [[AI Coding Agent Core Loop]] concept but applied to general prompting rather than coding. It can be combined with [[Role Prompting]], [[XML Tag Prompting]], and [[Extended Thinking (Claude)]] for maximum quality.
