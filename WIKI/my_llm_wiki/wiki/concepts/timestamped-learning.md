---
type: concept
title: Timestamped Learning
created: 2026-06-22
updated: 2026-06-22
tags: [learning, memory, context-recovery, video]
related: [agentic-learning-system, anki, spaced-repetition, obsidian]
sources: ["Journals/2026-06-16_带时间戳好友对话.md"]
---
# Timestamped Learning

**Timestamped Learning** is a technique that links notes, flashcards, or other learning artifacts to exact moments in video or audio content via timestamps. This enables rapid context recovery during review — when a learner forgets something, they can jump directly to the original source moment to rebuild understanding.

## Key Advantages

- **Granular context recovery:** Instead of vague summaries, each note or card can take the learner straight back to the rich, original context.
- **Reduced friction:** Eliminates the need to scrub through long videos to find relevant sections.
- **Portable data:** Unlike platform-specific features (e.g., NotebookLM or Gemini clickable timestamps that don't survive copying), timestamped links in a personal system (e.g., [[Obsidian]]) remain reusable and under the learner's control.

## Implementation

A common implementation involves:
1. Extracting video transcripts (e.g., via a Python script).
2. Using an AI agent (e.g., [[Claude Code]]) to identify key moments with timestamps.
3. Creating flashcards or notes with clickable timestamp links on the back.
4. Storing these in a personal knowledge base (e.g., [[Obsidian]]) for long-term access.

## Related Concepts

- [[Agentic Learning System]]
- [[Quiz-First Workflow]]
- [[Spaced Repetition]]
- [[Context Engineering]]
