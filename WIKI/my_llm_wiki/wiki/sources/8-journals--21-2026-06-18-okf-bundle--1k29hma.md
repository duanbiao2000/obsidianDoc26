---
type: source
title: "OKF Bundle: Open Knowledge Format for Agent-Readable Knowledge Graphs"
created: 2026-06-22
updated: 2026-06-22
tags: [okf, knowledge-management, ai-agents, markdown, yaml]
related: [nic-deville, okf-bundle, okf-agent-prompts, second-brain, para-method, notebooklm-obsidian-pipeline]
sources: ["Journals/2026-06-18 OKF bundle.md"]
authors: []
year: 2026
url: ""
venue: ""
---

# OKF Bundle: Open Knowledge Format for Agent-Readable Knowledge Graphs

This source explains the **Open Knowledge Format (OKF)**, a structured Markdown directory format designed for dual human readability and AI agent traversal. An OKF bundle is a directory of Markdown concept files covering one knowledge domain, each with YAML frontmatter and human-readable body text.

## Key Points

- **Structure**: Each concept gets its own `.md` file with YAML frontmatter (minimally `type`), organized hierarchically by subdomain within a root directory.
- **Dual Audience**: Humans read as a documentation tree; AI agents traverse as a knowledge graph starting from `index.md`.
- **Minimal Requirements**: Only the `type` field in YAML frontmatter is required; all other fields (title, description, resource, tags, timestamp) are extensible per use case.
- **Domain-Agnostic**: Examples given for sales (BigQuery tables/metrics), IELTS speaking, and personal blog/notes.

## Examples

The source provides a sales directory structure from Google Cloud documentation:

```
sales/
  index.md
  tables/
    index.md
    orders.md
    customers.md
  metrics/
    index.md
    weekly_active_users.md
```

And an IELTS speaking adaptation:

```
ielts_speaking/
  index.md
  concepts/
    band7_coherence.md
    lexical_chunks.md
  playbooks/
    mock_test_routine.md
```

## Real-World Implementation

Suganthan's public OKF bundle packages his blog (37 articles) and notes (16 notes) as concept documents, with a `log.md` for update history. The entire bundle is downloadable as `okf.tar.gz` and any agent can crawl from `index.md` to traverse the full knowledge graph without scraping HTML.

## Connections

- [[Nic Deville]]'s note-taking style is referenced as an example of the format.
- The source links to [[OKF agent提示词]] for companion agent prompts.
- [[雅思]] (IELTS) is used as an example domain.
