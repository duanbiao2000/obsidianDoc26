# Karpathy LLM Wiki - SCHEMA (Agent Instructions)

**Version**: 1.2  
**Last Updated**: 2026-06-29  
**Purpose**: This is the **single source of truth** for all LLM Wiki maintenance rules. Any Agent or human performing conversion work **must** follow this document.

> **Critical**: Before any conversion work, load:
> `wiki/meta/skills/conversion-agent.skill.md`

---

## Core Directive

You are the **Wiki Maintainer**.  
Your job is to compile raw sources into a high-quality, interlinked knowledge base.

**Golden Rules** (Strictly Enforced):
1. Never modify anything in `raw/`.
2. All work happens only in `wiki/`.
3. Follow `wiki/meta/guidelines/Wiki-Page-Type-Guide.md` for type decisions.
4. One raw note can generate multiple page types.

---

## Directory Structure

```
wiki/
├── SCHEMA.md          # This file
├── INDEX.md           # Master catalog (read this first for navigation)
├── LOG.md             # Append-only operation history
├── OVERVIEW.md        # High-level synthesis & evolving thesis
├── concepts/          # Core ideas, frameworks, principles
├── entities/          # People, tools, organizations, models
├── projects/          # Projects and initiatives
├── areas/             # Life domains (English, Career, PKM, etc.)
├── prompts/           # High-value reusable prompts
├── templates/         # Note templates & structures
├── sources/           # One-page summaries of raw notes
├── syntheses/         # Cross-source analysis
├── qa/                # High-quality Q&A records
├── quickref/          # Fast reference tables
└── meta/              # Wiki maintenance & tracking files
```

---

## Page Frontmatter Standard

Every wiki page **must** start with this YAML block:

```yaml
---
title: "Clear Descriptive Title"
type: concept | entity | project | area | prompt | template | source | synthesis | qa | overview | quickref
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active | archived | draft
sources:
  - "[[raw/path/to/original.md]]"
tags: [tag1, tag2]
confidence: high | medium | low
related:
  - "[[Related Page 1]]"
  - "[[Related Page 2]]"
---
```

**Required fields**: `title`, `type`, `created`, `updated`, `status`

---

## Ingest Workflow (When user says "Ingest [raw/path]")

1. Read the raw file completely.
2. **Use `page-type-decision.skill.md`** to determine the best page type(s).
3. Evaluate whether to trigger **Knowledge Explosion** (see `Knowledge-Explosion-Workflow.md`).
4. Create or update the appropriate page(s) in the correct subfolder.
5. Add at least **2 wikilinks** to other wiki pages.
6. Create a `sources/` summary page if the original is long (>800 words).
7. Update `INDEX.md` with a one-line description.
8. Append an entry to `LOG.md` in this format:
   ```markdown
   - [2026-06-29] Ingested: raw/xxx.md → wiki/concepts/xxx.md (created)
   ```
9. Report exactly what was created/updated (including type decisions and whether Knowledge Explosion was triggered).

---

## Query Workflow

1. Always start by reading `INDEX.md`.
2. Read the most relevant pages.
3. Synthesize an answer with inline citations (`[[Page Name]]`).
4. Offer to save the result as a new `qa/` or `synthesis/` page.

---

## Naming Conventions

- Use **Title Case** for filenames (e.g., `Oral-Fluency-First-Principles.md`)
- For Chinese content, keep the original meaningful title when possible.
- Use kebab-case only when necessary for clarity.
- Never use spaces in filenames.

---

## Linking Rules

- Use Obsidian `[[wikilinks]]` everywhere.
- Minimum **2 outgoing links** per page.
- Prefer semantic links when possible.
- End every page with a **Related Pages** section.

---

## Content Quality Standards

- Keep pages focused (ideal length: 300–800 words).
- Every factual claim should cite a source.
- Use callouts for contradictions and open questions:
  ```markdown
  > **CONTRADICTION**: This claim conflicts with [[Previous Analysis]].
  > **OPEN QUESTION**: How does X interact with Y?
  ```
- Write for **future LLM consumption** — be explicit and structured.

---

## Incremental Conversion Rules

- Before ingesting any raw file, check `wiki/meta/Conversion-Tracker.md`.
- Mark files as processed immediately after successful conversion.
- Never re-process a file that is already marked `done`.

---

## Maintenance Commands (for LLM)

- `lint` → Scan for orphans, broken links, and contradictions.
- `update-index` → Rebuild `INDEX.md`.
- `audit [page]` → Compare a wiki page against its raw sources.

---

*This schema evolves. Update it when new patterns emerge.*