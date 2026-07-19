# Wiki Page Type Guide

**Version**: 1.2  
**Last Updated**: 2026-06-29  
**Purpose**: Official definitions and decision framework for all wiki page types.

---

## 1. Page Types Overview

| Type          | Purpose                                      | Can Generate Multiple? | Recommended Location     |
|---------------|----------------------------------------------|------------------------|--------------------------|
| `concept`     | Reusable ideas, frameworks, principles       | Yes (strongly encouraged) | `concepts/`             |
| `prompt`      | Ready-to-use instruction templates           | Yes                    | `prompts/`               |
| `entity`      | People, tools, organizations, exams          | Rarely                 | `entities/`              |
| `project`     | Specific projects with goals & timeline      | Yes                    | `projects/`              |
| `template`    | Reusable note structures                     | Rarely                 | `templates/`             |
| `source`      | Faithful 1:1 summary of a raw note           | Yes                    | `sources/`               |
| `synthesis`   | Cross-source analysis & integration          | No                     | `syntheses/`             |
| `qa`          | High-quality Q&A records                     | Rarely                 | `qa/`                    |
| `quickref`    | Tables, lists, comparisons, cheat sheets     | Rarely                 | `quickref/`              |
| `area`        | Domain homepage (MOC)                        | No                     | `areas/`                 |
| `overview`    | High-level strategic summary of a domain     | No                     | `areas/` or root         |

---

## 2. Decision Framework

### Step-by-Step Decision Tree

1. **Is it instructional / copy-paste ready?**  
   → `prompt` or `template`

2. **Is it an abstract, reusable idea or framework?**  
   → `concept` (primary choice)

3. **Is it a specific person, tool, exam, or organization?**  
   → `entity`

4. **Does it describe a project with goals and timeline?**  
   → `project`

5. **Is it best represented as a table or list?**  
   → `quickref`

6. **Is it a faithful compression of one long raw note?**  
   → `source`

7. **Does it synthesize multiple sources?**  
   → `synthesis`

8. **Is it a high-quality, reusable Q&A?**  
   → `qa`

9. **Is it a domain navigation page?**  
   → `area` (MOC) or `overview`

---

## 3. Multi-Type Conversion Strategy

**Recommended Output Combinations**:

| Raw Note Category             | Recommended Output                          | Example |
|-------------------------------|---------------------------------------------|--------|
| Prompt Engineering            | 1 `prompt` + 1–3 `concept`                 | KM-全能知识精炼大师 |
| Expression / Speaking         | 1 `concept` (+ optional `prompt`)          | 动词短语为王 |
| Style / Principle             | 1 `concept`                                | 纽约客风格 |
| Framework / Mental Model      | 1 `concept`                                | 第一性原理 |
| Tool / Person / Exam          | 1 `entity`                                 | IELTS |
| Project Work                  | 1 `project` + 1–2 `concept`                | 架构迁移项目 |
| Vocabulary / Comparison       | 1 `quickref`                               | 近义词替换表 |
| Long Technical Note           | 1 `source` + 1 `concept`                   | 复杂系统笔记 |

**Rule**: Always create at least one `concept` when the content contains reusable knowledge.

---

## 4. Content Requirements by Type

### `area` & `overview`

- `area`: 用于构建领域导航（MOC），应包含该领域的主要概念、实体、项目链接。
- `overview`: 用于对某个主题或领域进行战略性总结，通常由多个 `synthesis` 页面聚合而成。

---

## 5. Version Management

**Current Wiki Version**: 1.1  
**Last Major Update**: 2026-06-29

### Versioning Rules

- **Major version** (1.x → 2.x): Structural changes to wiki architecture or type system
- **Minor version** (1.0 → 1.1): Addition of new page types, significant guideline updates
- **Patch** (1.1.0 → 1.1.1): Bug fixes in guides or small improvements

### Change Log

- **v1.1 (2026-06-29)**: Added official `area` and `overview` type definitions; Introduced Skill system; Created `Wiki-Page-Type-Guide.md` v1.2
- **v1.0 (2026-06-29)**: Initial Karpathy LLM Wiki structure; Core page types defined

### How to Update Version

1. Update this section
2. Update `wiki/OVERVIEW.md` with new version
3. Announce major changes in `wiki/LOG.md`

---

*Maintained by Wiki Maintainer.*

**Recommended Templates**: Use the templates in `wiki/meta/templates/` when creating pages to maintain structural consistency.

**Knowledge Explosion**: When a note contains multiple high-value dimensions, consider triggering the Knowledge Explosion process (see `wiki/meta/guidelines/Knowledge-Explosion-Workflow.md`).
