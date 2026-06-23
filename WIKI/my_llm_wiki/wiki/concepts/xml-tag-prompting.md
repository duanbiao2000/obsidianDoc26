---
type: concept
title: XML Tag Prompting
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, llm, claude, anthropic, structure]
related: [role-prompting, superstructured-prompts, context-engineering, prompting-chatgpt]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# XML Tag Prompting

XML tag prompting is a technique for structuring LLM prompts by wrapping different sections in XML-style tags (e.g., `<context>`, `<instruction>`, `<output>`). This gives the model clear structural boundaries for processing each part of the prompt.

## Mechanism

By labeling different parts of a prompt with descriptive tags, the model can process each section in order and understand the relationship between them. There are no "correct" tag names — users can choose any labels and stay consistent. Claude was trained to treat any XML tags as structure markers.

## Effectiveness

Anthropic's internal documentation claims XML tags yield **20–40% more consistent outputs** on complex prompts. Almost nobody outside the Anthropic team uses them, making this a significant untapped opportunity.

## Common Tag Structure

- `<context>` — Background information the model needs to understand the task
- `<instruction>` — The actual task or request
- `<output>` — Formatting requirements for the response

## When to Use

XML tags are most valuable for complex prompts with multiple components (background, task, format requirements). For simple one-sentence prompts, the overhead may not be worth it.

## Relationship to Other Techniques

XML tags are often combined with [[Role Prompting]] and [[Few-Shot Prompting]] to create [[Superstructured Prompts]]. They are a concrete application of [[Context Engineering]].
