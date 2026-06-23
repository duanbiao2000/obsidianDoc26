---
type: source
title: 18 Claude Chat Commands
created: 2026-06-22
updated: 2026-06-22
tags: [prompt-engineering, claude, ai-interaction, llm]
related: [context-engineering, ai-coding-agent-core-loop, ai-systems-commander, claude-code]
sources: ["Journals/2026-05-14-18 Claude Chat Commands.md"]
authors: []
year: 2026
url: ""
venue: ""
---
# 18 Claude Chat Commands

A practical reference list of 18 commands for controlling Claude's behavior, output format, reasoning depth, and self-awareness during chat interactions on claude.ai.

## Commands

1. **Context Reset** — "Forget everything above. Fresh start." Resets the conversation history for a clean slate.
2. **Summarize & Continue** — "Summarize what we've covered, then keep going." Provides a recap and continues the dialogue.
3. **Bullet Points Only** — "Bullet points only from here." Restricts responses to bulleted lists.
4. **Model Switch** — "Use Opus for this one." Switches the model to Claude Opus for the next prompt.
5. **Concise First** — "Keep this short. I'll ask for more if I need it." Requests a concise answer first.
6. **Assumption Flagging** — "Before you respond — what are you assuming?" Asks Claude to list its prompt assumptions.
7. **Chain-of-Thought** — "Think out loud before giving me the final answer." Enables a detailed reasoning process before output.
8. **Diverse Generation** — "Give me three versions. Different angles." Generates multiple diverse responses.
9. **Self-Critique** — "Now critique what you just wrote." Instructs Claude to review its previous output.
10. **Resume** — "Pick up where you left off." Resumes from the last completed point.
11. **Role-Play Persona** — "For this whole conversation, you are [role]." Sets a persistent character for the AI.
12. **Pinpoint Context** — "Remember this the entire session: [detail]." Pinpoints crucial information for the whole chat.
13. **Targeted Edit** — "Rewrite the last response but [one change]." Edits the previous answer with a specific modification.
14. **Gap Detection** — "What's missing from my prompt?" Asks Claude to identify gaps in user input.
15. **Uncomfortable Truth** — "Give me the uncomfortable version of this answer." Requests the rawest, most direct response possible.
16. **Improvement Inquiry** — "What would you need to give me a better answer?" Inquires about necessary improvements.
17. **Assumption Audit** — "Flag every assumption you made." Calls out all underlying presuppositions used.
18. **Response Compression** — "Now make it half as long." Compresses the previous response to 50% length.

## Key Themes

- **Assumption Management:** Commands 6, 14, 16, and 17 all focus on surfacing the AI's implicit assumptions and identifying gaps in user input. This is the most distinctive cluster in the list.
- **Output Control:** Commands 3, 5, 8, and 18 give the user fine-grained control over response format, length, and diversity.
- **Context Engineering:** Commands 1, 2, 10, 12, and 13 manage the conversation's context window and continuity.
- **Meta-Cognition:** Commands 7, 9, and 15 push the AI to reflect on its own reasoning, critique itself, and provide unfiltered perspectives.

## Relationship to Existing Wiki

This source provides a tactical layer that operationalizes concepts from [[context-engineering]] and [[ai-coding-agent-core-loop]]. The assumption-flagging commands are particularly valuable as they address a common pain point in LLM interactions — unwarranted assumptions — that generic prompting guides often overlook.
