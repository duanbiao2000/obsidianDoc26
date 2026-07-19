# Karpathy LLM Wiki Conversion SOP & Spec

**Version**: 1.1  
**Date**: 2026-06-29  
**Status**: Strategic Reference Document  
**Owner**: User + Agent  

> **Important**: This document serves as **strategic overview and planning reference** only.  
> For real-time agent instructions and operational rules, always refer to **`wiki/SCHEMA.md`**.

---

## 1. Vision & Core Principles (Karpathy Model)

Andrej Karpathy's LLM Wiki treats notes as **source code** that an LLM **compiles** into a structured, queryable wiki (the "executable").

### Three-Layer Architecture

1. **Raw Layer** (`raw/`) — Immutable ground truth.
2. **Wiki Layer** (`wiki/`) — LLM-owned, synthesized, interlinked Markdown.
3. **Schema Layer** (`SCHEMA.md`) — Real-time operational rules.

---

## 2. Target Directory Structure

```
/
├── raw/                          # Immutable source material
├── wiki/                         # LLM-maintained knowledge base
│   ├── SCHEMA.md                 # Primary operational rules
│   ├── INDEX.md
│   ├── LOG.md
│   ├── OVERVIEW.md
│   ├── concepts/
│   ├── entities/
│   ├── projects/
│   ├── areas/
│   ├── prompts/
│   ├── templates/
│   ├── sources/
│   ├── syntheses/
│   ├── qa/
│   ├── quickref/
│   └── meta/
│       ├── guidelines/           # Strategic documents
│       ├── skills/               # Agent skills
│       ├── tracking/             # State tracking
│       └── templates/            # Page templates
└── 30_WIKI/                      # Existing wiki (reference only)
```

---

## 3. Page Types

All type definitions and decision rules are in:

→ **`wiki/meta/guidelines/Wiki-Page-Type-Guide.md`**

---

## 4. Strategic Batch Strategy

| Batch ID | Theme                        | Priority | Status   | Target Location       |
|----------|------------------------------|----------|----------|-----------------------|
| **P01**  | Prompts (已完成)             | Critical | Done     | `wiki/prompts/`       |
| **P02**  | Prompts (剩余)               | Critical | Pending  | `wiki/prompts/`       |
| **E01**  | English Expression           | High     | Pending  | `wiki/areas/English/` |
| **S01**  | IELTS Speaking Core          | High     | Pending  | `wiki/areas/English/` |
| **S02**  | IELTS Speaking Advanced      | High     | Pending  | `wiki/areas/English/` |
| **G01**  | Grammar                      | Medium   | Pending  | `wiki/concepts/`      |
| **C01**  | Coding & Career              | Medium   | Pending  | `wiki/areas/Coding/`  |
| **J01**  | Journals & Templates         | Low      | Pending  | `wiki/sources/`       |

**Execution Order**:

1. P02
2. E01
3. S01 + S02
4. Grammar / Coding / Career
5. Journals & Templates

---

## 5. Reference Documents

- **Real-time Rules**: `wiki/SCHEMA.md`
- **Type Definitions**: `wiki/meta/guidelines/Wiki-Page-Type-Guide.md`
- **Batch Planning**: `wiki/meta/guidelines/Full-Batch-Conversion-Plan.md`

*This document serves as strategic reference only.*
