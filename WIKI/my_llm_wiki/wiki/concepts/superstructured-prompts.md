---
type: concept
title: Superstructured Prompts
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, llm, claude, anthropic, structure]
related: [role-prompting, xml-tag-prompting, prompt-chaining, context-engineering]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# Superstructured Prompts

Superstructured prompts are the combination of [[XML Tag Prompting]] with embedded [[Few-Shot Prompting]] examples. This is the default approach Anthropic engineers use whenever consistency matters.

## Structure

A superstructured prompt typically includes:
1. A role assignment (e.g., "You are a CFO")
2. XML tags separating context, instructions, and output format
3. One or two concrete examples of the desired output embedded within the tags

## Why It Works

The role provides the interpretive frame, the XML tags provide structural boundaries, and the examples provide concrete pattern-matching targets. Each element addresses a different limitation of plain-text prompting.

## When to Use

Superstructured prompts are recommended for any task where output consistency is critical — recurring reports, analysis templates, content generation with specific style requirements.

## Relationship to Other Techniques

Superstructured prompts can be used as individual steps within a [[Prompt Chaining]] workflow. They are the most advanced form of [[Context Engineering]].
