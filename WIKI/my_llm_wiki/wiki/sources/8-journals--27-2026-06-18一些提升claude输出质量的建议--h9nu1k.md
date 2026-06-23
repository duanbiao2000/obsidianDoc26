---
type: source
title: "How Anthropic Engineers Use Claude: Prompting Techniques for Higher Quality Output"
created: 2026-06-22
updated: 2026-06-22
tags: [prompting, claude, anthropic, llm, prompt-engineering]
related: [role-prompting, xml-tag-prompting, prompt-chaining, superstructured-prompts, extended-thinking-claude, prompt-as-process, context-engineering, claude-code]
sources: ["Journals/2026-06-18一些提升claude输出质量的建议.md"]
authors: []
year: 2026
url: "https://www.youtube.com/watch?v=MBTS_jC9rlA"
venue: YouTube
---
# How Anthropic Engineers Use Claude: Prompting Techniques for Higher Quality Output

This source is a structured dialogue (flashcard-style Q&A) summarizing a YouTube video titled "How Anthropic Engineers Use Claude." The video reveals the prompting techniques that Anthropic's own engineers use internally to get dramatically better results from Claude, the company's large language model.

## Core Techniques

### Role Prompting
The single most impactful technique: telling Claude who it is before asking a question. A single sentence like "You are a CFO" fundamentally changes the tone, language complexity, and structural choices of the output. Anthropic recommends treating Claude like a "brilliant but literal new hire" — the role tells Claude how to interpret everything that follows.

### XML Tag Prompting
Wrapping different parts of a prompt in XML-style tags (e.g., `<context>`, `<instruction>`, `<output>`) gives Claude clear structural boundaries. Anthropic's internal documentation claims this yields **20–40% more consistent outputs** on complex prompts. There are no "correct" tag names — users can choose any labels and stay consistent. Claude was trained to treat any XML tags as structure markers.

### Few-Shot Prompting
Providing 1–2 concrete examples of the desired output is more effective than abstract descriptions. Claude is better at **pattern matching than instruction following**, so copying tone and length from examples is easier than guessing from a fuzzy style description. Anthropic's documentation explicitly recommends positive examples over "don't do this" lists.

### Superstructured Prompts
The combination of XML tags with embedded few-shot examples. This is the default approach Anthropic engineers use whenever consistency matters.

### Prompt Chaining
Splitting complex tasks into sequential prompts (research → analysis → drafting → formatting) rather than one giant prompt. Each subtask gets Claude's full attention, producing higher quality per step. A concrete example from the video: summarize a medical paper → grade the summary A–F → improve the summary based on its own review.

### Extended Thinking
Claude's step-by-step reasoning mode for multi-step logic. Recommended for financial analysis, strategy, and technical problem-solving where a quick answer might be dangerously wrong. Shows the reasoning chain so users can see where logic needs correction.

### Effort Levels
Anthropic states that "effort matters more for this version than any prior Claude." Using at least high effort is recommended whenever accuracy is critical.

### Prompt-as-Process Mindset
Treating every imperfect answer as a signal to fix the prompt, not just edit the output. One user's weekly reporting prompt went from 4–5 corrections per report to 1–2 after three months of small iterative updates. Putting refined instructions into a Claude project propagates improvements across all conversations automatically.

## Key Claims

- Role prompting dramatically changes output quality with a single sentence
- XML tags yield 20–40% more consistent outputs (attributed to Anthropic's internal docs)
- Claude is better at pattern matching than instruction following
- Positive examples beat negative "don't do this" lists
- Prompt chaining improves quality by reducing cognitive load per prompt
- Extended thinking is recommended for multi-step logic, financial analysis, strategy, technical problem-solving
- Iterative prompt refinement over time yields compounding returns

## Caveats

All claims are attributed to a single YouTube video and Anthropic's documentation. No independent verification or comparison with other prompting methodologies is provided. The 20–40% consistency improvement claim has not been independently replicated.
