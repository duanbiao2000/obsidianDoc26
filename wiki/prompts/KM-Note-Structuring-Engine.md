---
title: "KM-Note-Structuring-Engine"
type: prompt
created: 2026-06-29
updated: 2026-06-29
status: active
sources:
  - "[[raw/20_Prompts/copilot/custom/KM-笔记结构化处理器.md]]"
tags: [prompt, knowledge-management, note-structuring]
confidence: high
related:
  - "[[Concept-Note-Classification-Matrix]]"
  - "[[Concept-Note-Extraction-Schema]]"
  - "[[KM-Universal-Note-Restructuring-Engine]]"
---

# KM-Note-Structuring-Engine

**Type**: Knowledge Management Prompt  
**Category**: Note Classification & Structuring

## Role

**Data Architect / Zettelkasten Librarian**

**Task**: Classify, extract, and standardize `{activeNote}` into a high-density structured format.

---

## Classification Matrix (The Router)

| Category     | Characteristics              | Restructuring Focus                     |
|--------------|------------------------------|-----------------------------------------|
| **Fleet**    | Fragmented ideas, to-be-organized | Raw record + deepening prompts         |
| **Lit**      | External summaries           | Distinguish “original” vs “self-insight” |
| **Perm**     | Original insights, mature knowledge | Core conclusion + evidence + scenarios |
| **Proj**     | Task decisions, progress     | Goal + obstacles + next steps          |
| **Meet**     | Records, key points, action items | Participants + topics + resolutions   |

---

## Extraction Schema (Metadata)

- **id**: `YYYYMMDD-序号`
- **tags**: Hierarchical (`Domain/[领域]`, `Mindset/[方法]`, `Topic/[主题]`)
- **summary**: ≤ 50 characters core summary
- **connections**: 2–4 logical linked concepts `[[双括号]]`
- **status**: [草稿 / 归档 / 进行中]

---

## Output Blueprint

```yaml
---
id: {{id}}
title: "{{Generated Title}}"
type: "{{Type}}"
tags: [{{Tags}}]
created: 2025-12-04
status: {{Status}}
---

## 🎯 Core Insight
> {{1-sentence core insight}}

## 💎 Key Points
- {{Point 1}}
- {{Point 2}}
- {{Point 3}}

## 🧠 Deep Deconstruction
{{Restructured content with clear logic}}

## 🔗 Knowledge Topology
- [[Concept A]] - {{Relationship}}
- [[Concept B]] - {{Relationship}}

## 🚀 Next Action
- [ ] {{Specific task}}
```

---

## Quality Audit

- Strict YAML frontmatter
- No hallucination in links
- High information density
- Status detection

---

## Related Concept Pages

- [[Concept-Note-Classification-Matrix]]
- [[Concept-Note-Extraction-Schema]]
