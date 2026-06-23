---
type: concept
title: Role Prompting
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, llm, claude, anthropic]
related: [xml-tag-prompting, superstructured-prompts, context-engineering, prompting-chatgpt]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# Role Prompting

Role prompting is a technique for improving LLM output quality by explicitly assigning a role or persona to the model before asking a question. A single sentence like "You are a CFO" fundamentally changes the tone, language complexity, and structural choices of the output.

## Mechanism

The role tells the model how to interpret everything that follows. Anthropic recommends treating Claude like a "brilliant but literal new hire" — the role provides the interpretive frame for all subsequent instructions.

## Example

From the source: asking Claude to "explain a balance sheet" produces a generic answer, but prefacing with "You are a CFO" produces simpler language, corporate examples, and a structure that feels like a real executive explaining to a colleague.

## When to Use

Role prompting is the single most impactful technique and should be the first thing to try when improving any prompt. It works for any domain where a specific professional or expert perspective is valuable.

## Relationship to Other Techniques

Role prompting is often combined with [[XML Tag Prompting]] and [[Few-Shot Prompting]] to create [[Superstructured Prompts]]. It is a concrete application of [[Context Engineering]].
