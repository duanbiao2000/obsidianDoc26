# Karpathy LLM Wiki Conversion SOP & Spec

**Date**: 2026-06-29  
**Status**: Draft v1.0  
**Owner**: User + Agent  
**Goal**: Convert the entire Obsidian vault (except existing 30_WIKI content) into a Karpathy-style LLM Wiki — a persistent, interlinked, LLM-maintained knowledge base in structured Markdown.

---

## 1. Vision & Core Principles (Karpathy Model)

Andrej Karpathy's LLM Wiki treats notes as **source code** that an LLM **compiles** into a structured, queryable wiki (the "executable").

### Three-Layer Architecture

1. **Raw Layer** (`raw/`) — Immutable ground truth. Never modified by LLM.
2. **Wiki Layer** (`wiki/`) — LLM-owned, synthesized, interlinked Markdown pages. This is the "compiled" knowledge base.
3. **Schema Layer** (`SCHEMA.md` / `Claude.md`) — Instructions that make the LLM a disciplined wiki maintainer.

### Key Shifts from Current Vault

- **From**: Scattered folders + human navigation
- **To**: LLM-maintained, index-first, cross-linked encyclopedia
- **Raw notes stay** but become source material
- **Wiki pages** become the primary interface for agents and humans

---

## 2. Target Directory Structure

```
/
├── raw/                          # Immutable source material (Phase 1 migration)
│   ├── 01_Inbox/
│   ├── 01_Projects/
│   ├── 02_Areas/
│   ├── 03_Resources/
│   ├── 04_Archive/
│   ├── 05_Journals/
│   ├── 10_Templates/
│   ├── 20_Prompts/
│   ├── 90_Attachments/
│   └── 99_Meta/
│
├── wiki/                         # LLM-maintained Karpathy Wiki (NEW)
│   ├── SCHEMA.md                 # Core instructions (this document lives here too)
│   ├── INDEX.md                  # Master catalog + one-line summaries
│   ├── LOG.md                    # Append-only operation log
│   ├── OVERVIEW.md               # High-level synthesis & thesis
│   │
│   ├── concepts/                 # Core ideas, frameworks, techniques
│   ├── entities/                 # People, tools, organizations, models
│   ├── projects/                 # Active + archived projects
│   ├── areas/                    # Life areas (Career, English, PKM, etc.)
│   ├── prompts/                  # High-value prompt templates
│   ├── templates/                # Note templates & structures
│   ├── sources/                  # 1:1 summary pages of raw notes
│   ├── syntheses/                # Cross-source analysis
│   ├── qa/                       # High-quality Q&A records
│   ├── quickref/                 # Fast reference pages (from existing QuickRef)
│   └── meta/                     # Wiki maintenance pages
│
├── 30_WIKI/                      # Existing wiki content (EXEMPT from full conversion)
│   └── ... (keep as-is, link into new wiki)
│
└── HOME.md & Dashboard++.md      # Entry points (update links)
```

**Notes**:

- `raw/` is a **read-only** mirror of current content.
- `wiki/` becomes the new primary vault for agents.
- Existing `30_WIKI/` is preserved and gradually linked in.

---

## 3. Page Types & YAML Frontmatter

Every wiki page MUST have consistent frontmatter.

### Standard Frontmatter Template

```yaml
---
title: "Page Title"
type: concept | entity | project | area | prompt | template | source | synthesis | qa | overview | quickref
created: 2026-06-29
updated: 2026-06-29
status: active | archived | draft
sources: 
  - "[[raw/01_Projects/IELTS-Prep/Speaking/口语高分的底层逻辑.md]]"
  - "[[raw/02_Areas/English/Expression/动词短语为王.md]]"
tags: 
  - ielts
  - speaking
  - first-principles
confidence: high | medium | low
related: 
  - "[[概念: 口语流利度第一性原理]]"
  - "[[实体: IELTS 官方评分标准]]"
---
```

### Type Definitions

| Type       | Purpose                              | Example Filename                  | Subfolder     |
|------------|--------------------------------------|-----------------------------------|---------------|
| `concept`  | Core ideas, frameworks               | `口语流利度第一性原理.md`         | `concepts/`   |
| `entity`   | People, tools, orgs, models          | `Andrej-Karpathy.md`              | `entities/`   |
| `project`  | Projects & initiatives               | `IELTS-Super-Cards.md`            | `projects/`   |
| `area`     | Life domains                         | `English-Learning.md`             | `areas/`      |
| `prompt`   | High-value prompts                   | `雅思8.5口语语料生成规则.md`      | `prompts/`    |
| `template` | Reusable note structures             | `DailyNote.md`                    | `templates/`  |
| `source`   | Summary of one raw note              | `sources/口语高分的底层逻辑-summary.md` | `sources/` |
| `synthesis`| Cross-source analysis                | `IELTS-口语高分力场分析.md`       | `syntheses/`  |
| `qa`       | Valuable Q&A                         | `qa/如何构建口语力场.md`          | `qa/`         |
| `overview` | High-level thesis                    | `OVERVIEW.md`                     | root          |
| `quickref` | Fast lookup tables                   | `IELTS-Speaking-速查.md`          | `quickref/`   |

---

## 4. Naming & Linking Conventions

### File Naming

- Use **kebab-case** or **Title-Case** consistently (recommend `Title-Case.md` for readability).
- For Chinese content: keep original meaningful titles but add English slug when needed.
- Examples:
  - `口语流利度第一性原理.md`
  - `Andrej-Karpathy.md`
  - `IELTS-8.5-Speaking-Framework.md`

### Linking Rules

- Use Obsidian `[[wikilinks]]` everywhere.
- Minimum **2 outgoing links** per page.
- Use typed relationships where possible (future plugin support):
  - `[[Page|alias @supports]]`
  - `[[Page|alias @supersedes]]`
  - `[[Page|alias @references]]`

### Content Rules

- Every factual claim must have a source citation.
- Use `> **CONTRADICTION**` and `> **OPEN QUESTION**` callouts.
- Keep pages focused (aim for 300–800 words).
- End every page with a **"Related Pages"** section.

---

## 5. Conversion Workflow (SOP)

### Phase 0: Setup (One-time)

1. Create the `raw/` and `wiki/` directories.
2. Move/copy all non-`30_WIKI` content into `raw/`.
3. Create `wiki/SCHEMA.md` (copy this SOP into it).
4. Create initial `INDEX.md`, `LOG.md`, `OVERVIEW.md`.
5. Update `HOME.md` and dashboards to point to `wiki/INDEX.md`.

### Phase 1: Pilot (10–20 notes)

1. Pick high-value notes from `raw/01_Projects/IELTS-Prep/Speaking/`.
2. Ask Claude Code:  
   `"Ingest raw/01_Projects/IELTS-Prep/Speaking/口语高分的底层逻辑.md into the wiki using the SCHEMA.md rules."`
3. Review output, refine SCHEMA.md.

### Phase 2: Batch Conversion

Recommended batch strategy:

- Group by folder (e.g., all Speaking notes together).
- Use the **Conversion Prompt Template** below.

### Phase 3: Full Migration

- Prioritize: `20_Prompts`, `10_Templates`, `02_Areas/English`, `01_Projects/IELTS-Prep`.
- Archive old locations after successful conversion.

---

## 6. LLM Agent Instructions (SCHEMA.md content)

**Core Directive**:
> You are the Wiki Maintainer. Your job is to compile raw sources into a high-quality, interlinked personal encyclopedia. Never modify anything in `raw/`. All changes happen in `wiki/`.

**Ingest Workflow** (when user says "Ingest [path]"):

1. Read the raw file.
2. Decide page type(s).
3. Create/update appropriate page(s) in `wiki/`.
4. Create a `sources/` summary page if valuable.
5. Update `INDEX.md` (add one-line summary).
6. Append entry to `LOG.md`.
7. Add at least 2 wikilinks.
8. Report what was created/updated.

**Query Workflow**:

1. Read `INDEX.md` first.
2. Read relevant pages.
3. Synthesize answer with citations.
4. Offer to file result as a new `qa/` or `synthesis/` page.

**Lint Workflow** (run weekly):

- Find orphan pages.
- Find missing links.
- Flag contradictions.
- Suggest page merges.

---

## 7. Conversion Prompt Template (for Claude Code)

```markdown
You are following the Karpathy LLM Wiki SOP (see wiki/SCHEMA.md).

Task: Convert the following raw note into the wiki.

Raw file: `{{raw_path}}`

Instructions:
1. Analyze the content and decide the best `type`.
2. Create or update the appropriate wiki page(s).
3. Write high-quality, concise, interlinked Markdown.
4. Include proper YAML frontmatter.
5. Add at least 2 wikilinks to existing or new pages.
6. Create a `sources/` summary if the original is long.
7. Update INDEX.md and LOG.md.
8. Output the full new/updated file content.

Raw content:
{{raw_content}}
```

---

## 8. Prioritization & Phased Rollout

| Phase | Content Area                     | Priority | Estimated Pages | Notes |
|-------|----------------------------------|----------|------------------|-------|
| 1     | 20_Prompts (high-value)          | Critical | ~80             | Prompts are perfect for `prompts/` |
| 2     | 02_Areas/English/*               | High     | ~120            | Concepts + Expression |
| 3     | 01_Projects/IELTS-Prep/Speaking  | High     | ~90             | Core domain |
| 4     | 01_Projects/IELTS-Prep/* (rest)  | Medium   | ~150            | - |
| 5     | 02_Areas/Coding + Career         | Medium   | ~80             | - |
| 6     | 05_Journals + 04_Archive         | Low      | Many            | Summarize aggressively |

---

## 9. Exceptions & Special Cases

- **30_WIKI/**: Keep intact. Gradually create `wiki/` pages that link to or synthesize content from it.
- **HTML pages**: Convert key ones to Markdown (or keep as reference).
- **Images/Attachments**: Move to `raw/90_Attachments/` and reference via relative paths.
- **Daily Journals**: Convert to `sources/` summaries or keep in `raw/` with a synthesis page.

---

## 10. Success Metrics

- `wiki/INDEX.md` has > 300 entries within 30 days.
- Average page has ≥ 3 wikilinks.
- LLM can answer complex domain questions using only `wiki/` content.
- Old raw folders become "source of truth" only.

---

## 11. Next Actions (Immediate)

1. Create `raw/` and `wiki/` directories.
2. Copy this SOP into `wiki/SCHEMA.md`.
3. Run a pilot conversion on 5 notes.
4. Iterate on SCHEMA.md based on results.

---

**This document itself will live in `wiki/meta/Karpathy-LLM-Wiki-Conversion-SOP.md` once the wiki is initialized.**

---

*End of SOP*
