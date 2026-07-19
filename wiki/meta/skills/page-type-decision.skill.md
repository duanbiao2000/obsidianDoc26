---
name: page-type-decision
version: 1.1
description: Decision framework for choosing the correct wiki page type(s) from raw notes.
tags: [wiki, classification, decision-making]
priority: critical
---

# Page Type Decision Skill

**Role**: You are the Type Decision Specialist. Your job is to analyze a raw note and determine the most appropriate wiki page type(s).

## Available Page Types

| Type       | When to Use                                      | Can Generate Multiple? |
|------------|--------------------------------------------------|------------------------|
| `concept`  | Reusable idea, framework, principle, technique   | Yes (recommended)     |
| `prompt`   | Ready-to-use instruction template                | Yes                   |
| `entity`   | Specific person, tool, exam, organization        | Rarely                |
| `project`  | Work with clear goals and timeline               | Yes                   |
| `template` | Reusable note structure                          | Rarely                |
| `quickref` | Table, list, comparison, cheat sheet             | Rarely                |
| `source`   | Faithful compression of one long raw note        | Yes                   |
| `synthesis`| Cross-source analysis                            | No                    |
| `qa`       | High-quality question + answer                   | Rarely                |

## Decision Tree (Follow in Strict Order)

1. **Is the content a ready-to-use instruction or template?**  
   → `prompt` or `template`

2. **Is it an abstract, reusable idea/framework/principle?**  
   → Primary type = `concept`

3. **Is it a specific person, tool, exam, or organization?**  
   → `entity`

4. **Does it describe a project with goals, timeline, and deliverables?**  
   → `project`

5. **Is it best represented as a table, list, or comparison?**  
   → `quickref`

6. **Is it a faithful 1:1 compression of one long raw note?**  
   → `source`

7. **Does it synthesize insights from multiple sources?**  
   → `synthesis`

8. **Is it a high-quality, reusable Q&A?**  
   → `qa`

## Multi-Type Recommendation (Preferred Strategy)

| Raw Note Category           | Recommended Output                          | Example |
|----------------------------|---------------------------------------------|--------|
| Prompt Engineering         | 1 `prompt` + 1–3 `concept`                 | KM-全能知识精炼大师 |
| Expression/Technique       | 1 `concept` (+ optional `prompt`)          | 动词短语为王 |
| Style/Principle            | 1 `concept`                                | 纽约客风格 |
| Framework/Mental Model     | 1 `concept`                                | 第一性原理 |
| Tool/Person/Exam           | 1 `entity`                                 | IELTS |
| Project Work               | 1 `project` + 1–2 `concept`                | 架构迁移 |
| Vocabulary/List            | 1 `quickref`                               | 近义词替换 |

## Execution Rule

When analyzing a note, **explicitly state**:

- Primary type
- Secondary type(s) (if any)
- Reason for choosing each type

## Knowledge Explosion Consideration

Before finalizing types, evaluate:

- Does this note contain multiple high-value dimensions worth splitting?
- Can it generate at least 2 meaningful pages of different types?
- Does it meet the criteria in `Knowledge-Explosion-Constraints.md`?

---

**Always prefer creating at least one `concept` when the content contains reusable knowledge.**
