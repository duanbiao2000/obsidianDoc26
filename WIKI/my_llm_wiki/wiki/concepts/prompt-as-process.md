---
type: concept
title: Prompt-as-Process
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, llm, workflow, iteration]
related: [role-prompting, xml-tag-prompting, superstructured-prompts, context-engineering]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
---
# Prompt-as-Process

Prompt-as-process is a mindset and methodology for iterative prompt refinement. Instead of treating imperfect outputs as failures to be edited manually, each imperfect answer is treated as a signal to fix the prompt itself.

## Mechanism

When a pattern of mistakes appears in Claude's outputs, the user updates the role, examples, or constraints in the prompt rather than editing the output. Over time, small cumulative improvements compound into dramatically better results.

## Evidence

From the source: one user's weekly reporting prompt went from needing 4–5 corrections per report to needing only 1–2 corrections after three months of small iterative updates. The same prompt, refined incrementally, produced drafts that were nearly ready to send.

## Automation via Projects

Putting refined instructions into a Claude project means every future conversation in that project inherits the improvements automatically. This turns the prompt-as-process approach into a scalable system.

## Key Principle

"Claude on day 30" feels fundamentally different from "Claude on day one" — not because the model changed, but because the prompt was refined through repeated use.

## Relationship to Other Techniques

Prompt-as-process is the meta-methodology that governs the use of [[Role Prompting]], [[XML Tag Prompting]], [[Few-Shot Prompting]], and [[Prompt Chaining]]. It is the practice of continuously improving these techniques over time.
