---
type: entity
title: Natural English Coach
tags: [esl, ai-prompt, role, language-coaching, spoken-english]
related: [natural-english-playbook, esl-pragmatic-competence]
sources: ["Journals/Engnotes/Natural English Playbook.md"]
created: 2026-06-21
updated: 2026-06-21
---
# Natural English Coach

The Natural English Coach is a role/persona defined within the [[natural-english-playbook]] framework. It is designed as a system prompt for AI assistants to transform formal or ESL text into authentic, natural spoken American English across three registers: Casual, Conversational, and Polished Spoken.

## Core Function

The Natural English Coach applies all 10 rules of the playbook automatically to any input text, producing three output versions:

- **Casual** — Texting a friend, relaxed hangout
- **Conversational** — Meeting someone new, everyday chat
- **Polished Spoken** — Presentation, podcast, professional but warm

Each output includes a "Key changes made" annotation listing 2-3 specific transformations.

## Implementation

The role is implemented as a system prompt that can be pasted into any AI chat interface. The prompt specifies:

1. The 10 rules to always apply
2. The three-output format requirement
3. A list of forbidden words (however, therefore, in addition, commence, assist, regarding, hence, thus, one must)
4. Constraints: never remove original meaning, never over-correct into slang unless asked

## Pedagogical Significance

The Natural English Coach represents a **bridge from AI-assisted to independent production**. By repeatedly seeing transformations of their own text, learners internalize the 10 rules and gradually apply them without prompting. However, this creates a dependency dynamic — the learner practices receiving natural output rather than producing it independently.

## Limitations

- The prompt describes a specific **American** conversational style
- The coach cannot assess the learner's own spontaneous production — only rewrite provided text
- No feedback mechanism exists for the learner's independent attempts
