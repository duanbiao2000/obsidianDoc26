---
title: "Prompt-Quality-Assessment-Standard"
type: prompt
created: 2026-06-29
updated: 2026-06-29
status: active
sources:
  - "[[raw/20_Prompts/copilot/custom/提示词质量评估标准.md]]"
tags: [prompt, quality-assessment, prompt-engineering]
confidence: high
related:
  - "[[KM-Universal-Note-Restructuring-Engine]]"
  - "[[Prompt-Engineering-Best-Practices]]"
---

# Prompt-Quality-Assessment-Standard

**Type**: Evaluation Framework  
**Category**: Prompt Engineering & Maintenance

## Overview

A systematic scoring framework for evaluating and improving Copilot-style prompts across five dimensions.

---

## Scoring Dimensions

### 1. Functionality (30 points)

- Clear goal definition
- Comprehensive scenario coverage
- Error and boundary handling

### 2. Effectiveness (30 points)

- Output quality and accuracy
- Consistency across uses
- Efficiency (minimal iteration needed)

### 3. Maintainability (20 points)

- Clear internal structure and documentation
- Rich usage examples
- Parameter explanations

### 4. Reusability (10 points)

- Modular design
- General applicability across contexts

### 5. Usage Frequency (10 points)

- Based on actual `view-count`

---

## Quality Levels

| Level | Score   | Description                          |
|-------|---------|--------------------------------------|
| **S** | 90-100  | Excellent, high-frequency, clear     |
| **A** | 80-89   | Good, reliable, well-documented      |
| **B** | 70-79   | Acceptable, needs minor improvement  |
| **C** | 60-69   | Incomplete, unstable                 |
| **D** | 0-59    | Unusable, requires major rework      |

---

## Evaluation Workflow

### Weekly Review

- Score new and modified prompts
- Record results in dated assessment reports

### Monthly Comprehensive Review

- Use Dataview queries to analyze all prompts
- Identify patterns in low-quality prompts
- Plan batch improvements

---

## Cleanup Triggers

Prompts are considered for archiving when:

- Long-term unused (`view-count = 0` after 2026-06-30)
- Quality score < 60 with no improvement
- High functional overlap with better alternatives
- High maintenance cost

---

## Related Pages

- [[KM-Universal-Note-Restructuring-Engine]]
- [[Prompt-Engineering-Best-Practices]]
