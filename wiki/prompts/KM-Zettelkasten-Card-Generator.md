---
title: "KM-Zettelkasten-Card-Generator"
type: prompt
created: 2026-06-29
updated: 2026-06-29
status: active
sources:
  - "[[raw/20_Prompts/copilot/custom/KM-Zettelkasten卡片生成器.md]]"
tags: [prompt, knowledge-management, zettelkasten, atomic-notes]
confidence: high
related:
  - "[[KM-4D-Note-Restructuring-Assistant]]"
  - "[[KM-Universal-Note-Restructuring-Engine]]"
  - "[[Zettelkasten-Atomic-Card-System]]"
---

# KM-Zettelkasten-Card-Generator

**Type**: Knowledge Management Prompt  
**Category**: Atomic Note Creation

## Role

**Knowledge Synthesizer / Zettelkasten Expert**

**Task**: Transform `{activeNote}` into `{cardCount}` atomic cards using **Feynman Simplification**.

---

## Card Axioms

- **Atomicity**: One core idea per card.
- **Self-Sufficiency**: Understandable without parent context.
- **Linkage**: Explicitly connect to previous/next concepts in `{activeNote}`.
- **Feynman Test**: Explain it so a 12-year-old understands the mechanism.

---

## Metadata & Tagging Spec

- **ID**: `{timestamp}` + `A/B/C` suffix.
- **Title**: `[Core Claim] ([Primary Question])`
- **Tags**: 5–8 total (1 Method + 1 Level + 2 Domain + 1 Actionable)
  - *Method*: `#feynman`, `#first-principles`, `#mental-model`
  - *Level*: `#foundation`, `#intermediate`, `#advanced`
  - *Action*: `#actionable`, `#decision-making`, `#problem-solving`

---

## Standard Card Template

```markdown
## 卡片 {序号}

**ID:** `{timestamp}{suffix}` | **Tags:** {Tags}
**Title:** **{Title}** ^{anchor}

**[Definition]**
{One jargon-free sentence explaining the essence}.

**[Feynman Deconstruction]**

- **L1 (Surface)**: {Simple "What"}.
- **L2 (Mechanism)**: {Deep "Why"}.
- **L3 (Action)**: {Immediate "How"}.

**[Application]**

- **Scenario ✅**: {Best use case}.
- **Antipattern ❌**: {Common misuse + Consequence}.

**[Connectivity]**

- **Prerequisite**: [[#^prev_anchor]] (Why it's needed).
- **Derivative**: [[#^next_anchor]] (What it enables).
- **Comparison**: [[#^peer_anchor]] (Key difference).
```

---

## Quality Audit Checklist

- [ ] **Jargon Check**: Is every technical term translated or analogized?
- [ ] **Atomic Check**: Does this card contain only ONE distinct thesis?
- [ ] **Logic Flow**: Do the cards follow an `Entry → Mastery` progression?
- [ ] **Link Density**: 2–6 links per card. Avoid cycles.

---

## Quick Trigger Scenarios

- **Scenario A (Concept)**: Focus on `Definition` + `Analogy`.
- **Scenario B (Method)**: Focus on `Mechanism` + `Steps` + `Pitfalls`.
- **Scenario C (System)**: Generate 7–10 interconnected cards mapping the entire `{activeNote}` topology.

---

## Related Pages

- [[KM-4D-Note-Restructuring-Assistant]]
- [[KM-Universal-Note-Restructuring-Engine]]
- [[Zettelkasten-Atomic-Card-System]]
