---
type: concept
title: Claude Chat Commands
created: 2026-06-22
updated: 2026-06-22
tags: [prompt-engineering, claude, ai-interaction, llm]
related: [context-engineering, ai-coding-agent-core-loop, ai-systems-commander, claude-code]
sources: ["Journals/2026-05-14-18 Claude Chat Commands.md"]
---
# Claude Chat Commands

A curated set of 18 commands for controlling Claude's behavior, output format, reasoning depth, and self-awareness during chat interactions on claude.ai. These commands form a practical toolkit for [[context-engineering]] and prompt management.

## Command Categories

### Assumption Management
Commands that surface the AI's implicit assumptions and identify gaps in user input:
- "Before you respond — what are you assuming?"
- "What's missing from my prompt?"
- "What would you need to give me a better answer?"
- "Flag every assumption you made."

### Output Control
Commands that give fine-grained control over response format, length, and diversity:
- "Bullet points only from here."
- "Keep this short. I'll ask for more if I need it."
- "Give me three versions. Different angles."
- "Now make it half as long."

### Context Engineering
Commands that manage the conversation's context window and continuity:
- "Forget everything above. Fresh start."
- "Summarize what we've covered, then keep going."
- "Pick up where you left off."
- "Remember this the entire session: [detail]."
- "Rewrite the last response but [one change]."

### Meta-Cognition
Commands that push the AI to reflect on its own reasoning and output:
- "Think out loud before giving me the final answer."
- "Now critique what you just wrote."
- "Give me the uncomfortable version of this answer."

### Role & Model Control
Commands that set the AI's persona or model variant:
- "For this whole conversation, you are [role]."
- "Use Opus for this one."

## Significance

The assumption-flagging commands (the largest cluster) are the most distinctive and valuable contribution of this list. They address a common pain point in LLM interactions — AI systems making unwarranted assumptions — that generic prompting guides often miss. This set of commands operationalizes the strategic concepts of [[context-engineering]] and [[ai-coding-agent-core-loop]] into concrete, actionable interactions.

## Limitations

- The commands are designed for claude.ai and may not transfer directly to other LLM platforms (ChatGPT, Gemini).
- The model-switching command ("Use Opus for this one") is platform-specific and may become outdated as Claude's model lineup evolves.
- No empirical effectiveness data is provided — the list is prescriptive, not evidence-based.
