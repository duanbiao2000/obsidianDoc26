---
name: conversion-agent
version: 1.1
description: Complete skill bundle for Karpathy LLM Wiki conversion. Combines conversion flow, type decision, and multi-type strategy.
tags: [wiki, conversion, agent, knowledge-management]
priority: critical
---

# Conversion Agent Skill Bundle

This skill combines three specialized skills into one comprehensive agent capability.

**Important**: When processing a raw note, consider whether to trigger **Knowledge Explosion** (see `wiki/meta/guidelines/Knowledge-Explosion-Workflow.md`).

**Critical Rule**: When performing Knowledge Explosion, **you must first use `write_file` to save all generated pages to the workspace before responding to the user or generating the report.**

**MOC Maintenance**: After creating new pages, consider updating the corresponding MOC files (`MOC-Concepts.md`, `MOC-Meta.md`, `MOC-Areas.md`) using the script `wiki/meta/scripts/update-moc.py`.

## 1. Core Conversion Process

**When user says "Convert [raw/path]"**:

1. Read the raw file.
2. Decide page type(s) using the decision framework below.
3. Create high-quality wiki page(s) with correct YAML frontmatter.
4. Add 2–4 meaningful wikilinks per page.
5. Update `Conversion-Tracker.md`, `INDEX.md`, and `LOG.md`.
6. Report results clearly.

**Golden Rules**:
- Never modify anything in `raw/`.
- All work happens in `wiki/`.
- One note can generate multiple page types.

---

## 2. Page Type Decision Framework

### Available Types

| Type       | When to Use                                      |
|------------|--------------------------------------------------|
| `concept`  | Reusable idea, framework, principle, technique   |
| `prompt`   | Ready-to-use instruction template                |
| `entity`   | Specific person, tool, exam, organization        |
| `project`  | Work with goals and timeline                     |
| `quickref` | Table, list, or comparison                       |
| `source`   | Faithful compression of one long raw note        |
| `template` | Reusable note structure                          |

### Decision Tree (Follow in Order)

1. Is it a ready-to-use instruction? → `prompt` / `template`
2. Is it an abstract reusable idea? → `concept`
3. Is it a specific person/tool/exam? → `entity`
4. Does it describe a project? → `project`
5. Is it best as a table/list? → `quickref`
6. Is it a faithful summary of one note? → `source`

---

## 3. Multi-Type Conversion Strategy

**Recommended Patterns**:

| Raw Note Type             | Recommended Output                     |
|---------------------------|----------------------------------------|
| Prompt Engineering        | 1 `prompt` + 1–3 `concept`            |
| Expression Technique      | 1 `concept` (+ optional `prompt`)     |
| Style / Principle         | 1 `concept`                            |
| Framework / Mental Model  | 1 `concept`                            |
| Tool / Person / Exam      | 1 `entity`                             |
| Project Work              | 1 `project` + 1–2 `concept`           |
| Vocabulary / List         | 1 `quickref`                           |

**Rule**: Always prefer creating at least one `concept` when the content contains reusable knowledge.

---

## 4. Quality Standards

### General Requirements
- Minimum **2 outgoing wikilinks** per page
- Proper YAML frontmatter on every page
- High information density
- Clear justification when using multi-type conversion

### Wiki Style Requirements (必须遵循)
- 每篇笔记必须有清晰的定义或核心要点（概念类必须有 `## Definition`）
- 优先使用 bullet points，而非长段落
- 提供正例或反例（概念类笔记）
- 提取可复用单元（适合做 `quickref` 或 `template` 的内容要拆出来）
- 增加“为什么重要”或“使用场景”（强烈推荐）

### Optional Enhancements
- 增加版本号（适合经常迭代的内容）
- 添加“常见误区”
- 区分“底层原理”与“操作技巧”
- 添加“相关资源”

## 5. Output Format

After each conversion, report:

```markdown
**Conversion Summary**
- Created: [Page] (type: concept)
- Created: [Page] (type: prompt)
- Updated: Conversion-Tracker.md + INDEX.md
```