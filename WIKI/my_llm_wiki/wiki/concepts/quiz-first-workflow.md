---
type: concept
title: Quiz-First Workflow
created: 2026-06-22
updated: 2026-06-22
tags: [learning, active-recall, spaced-repetition, ai-agents]
related: [agentic-learning-system, anki, active-recall, spaced-repetition]
sources: ["Journals/2026-06-16_带时间戳好友对话.md"]
---
# Quiz-First Workflow

The **Quiz-First Workflow** is a learning method that prioritizes identifying knowledge gaps through self-testing before creating study materials. Instead of trying to memorize an entire document, the learner first takes a quiz to expose what they have not retained, then creates targeted flashcards or notes for those specific gaps.

## Process

1. **Generate quiz:** Feed a source document (e.g., a PDF) to an AI agent (e.g., [[Claude Code]]) to produce an interactive HTML quiz.
2. **Take the quiz:** Answer the questions to identify which concepts were not understood or retained.
3. **Create targeted cards:** Based on quiz results, generate [[Anki]] flashcards only for the weak points, not for every detail in the source.

## Advantages

- **Efficiency:** Focuses study time on what the learner actually needs to review, rather than re-encoding already-known information.
- **Active recall:** The quiz itself is a form of [[Active Recall]], which strengthens memory.
- **Targeted encoding:** Cards become meaningful and personally relevant, increasing the likelihood of long-term retention.

## Caveats

- The workflow requires an AI agent capable of generating quizzes from documents.
- The human must still decide which quiz results are worth encoding — the AI identifies gaps, but the learner chooses what matters.

## Related Concepts

- [[Agentic Learning System]]
- [[Active Recall]]
- [[Spaced Repetition]]
- [[Retrieval Practice]]
