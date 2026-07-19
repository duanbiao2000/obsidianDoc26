---
title: "IELTS-8.5-Speaking-Corpus-Generation-Rules"
type: prompt
created: 2026-06-29
updated: 2026-06-29
status: active
sources:
  - "[[raw/20_Prompts/copilot/custom/雅思8.5口语语料生成规则.md]]"
tags: [prompt, ielts, speaking, 8.5-band]
confidence: high
related:
  - "[[IELTS-Official-Speaking-Question-Set-Generator]]"
  - "[[Oral-Fluency-First-Principles]]"
  - "[[Lexical-Chunk-Training]]"
---

# IELTS-8.5-Speaking-Corpus-Generation-Rules

**Type**: Domain-Specific Generation Protocol  
**Category**: IELTS Speaking

## Core Principle

**"One sentence, one job"** — Break complex logic into short, powerful, breathable sentences (12–18 words).

---

## Generation Rules

1. **Sentence Structure**
   - Maximum 12–18 words per sentence
   - Start with natural spoken openers (`I'd say`, `The thing is`, `Well`)

2. **Lexical Quality**
   - Embed at least one high-value word per logical layer (`gravitate`, `utilitarian`)
   - Wrap advanced vocabulary in natural verb phrases

3. **Avoid Noun Strings**
   - Convert abstract noun stacks into dynamic `verb + object` expressions

4. **Logical Transitions**
   - Use spoken markers: `The result?`, `And this...`, `So naturally`

5. **Example Introduction**
   - Replace formal phrases with conversational ones: `Take... as an example`

6. **Verb Flexibility**
   - Convert single high-level verbs into flexible phrasal expressions when possible

7. **Reality Anchor**
   - End every output with a **specific real-world anchor** (industry, country, or concrete scenario)

---

## Example Application

**Input topic**: Education systems

**Output (following rules)**:

> I’d say institutional frameworks really define what students see as success.  
> So naturally, learners tend to **gravitate toward** exam-driven goals to stay ahead.  
> The result? Education often shifts from genuine curiosity to a more **utilitarian pursuit** of marks.  
> Take **rote memorization** as an example — in many systems, students end up focusing on standardized answers instead of real, original analysis.

---

## Usage

When generating new speaking material, instruct the model:

> “Generate 4-sentence corpus for [Topic] following my ‘IELTS 8.5 Speaking Generation Rules’.”

---

## Related Pages

- [[IELTS-Official-Speaking-Question-Set-Generator]]
- [[Oral-Fluency-First-Principles]]