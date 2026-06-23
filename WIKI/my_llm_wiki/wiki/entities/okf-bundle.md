---
type: entity
title: OKF Bundle
created: 2026-06-22
updated: 2026-06-22
tags: [okf, knowledge-management, ai-agents, markdown, yaml]
related: [nic-deville, okf-agent-prompts, second-brain, para-method, notebooklm-obsidian-pipeline]
sources: ["Journals/2026-06-18 OKF bundle.md"]
---

# OKF Bundle

An **OKF Bundle** (Open Knowledge Format Bundle) is a structured directory of Markdown concept files covering one knowledge domain. Each concept is represented by a single `.md` file with YAML frontmatter and human-readable body text. The format is designed for dual consumption: humans read it as a documentation tree, while AI agents traverse it as a knowledge graph.

## Structure

- **Root directory**: Named after the knowledge domain (e.g., `sales/`, `ielts_speaking/`).
- **Subdomain directories**: Organize concepts by category (e.g., `tables/`, `metrics/`, `concepts/`, `playbooks/`).
- **`index.md`**: Entry point for the bundle, listing all subdirectories and linking to concept files.
- **Concept files**: Individual `.md` files with YAML frontmatter (minimally `type`) and Markdown body.
- **`log.md`** (optional): Change log tracking bundle updates over time.

## YAML Frontmatter

Only the `type` field is required. Common optional fields include:

- `title`: Human-readable name
- `description`: Brief summary
- `resource`: URL to original source or documentation
- `tags`: Array of keywords
- `timestamp`: ISO 8601 timestamp

## Design Goals

- **Agent-Readable Knowledge Graph**: Any AI agent can start from `index.md` and crawl linked concept files to build a complete knowledge graph without scraping HTML.
- **Human-Readable Documentation**: The same files serve as clear, organized documentation for human readers.
- **Domain-Agnostic**: Applicable to any field — sales, education, software engineering, personal notes.
- **Portable**: Entire bundles can be packaged as `tar.gz` for distribution.

## Examples

- **Google Cloud Sales Example**: A bundle with `tables/` and `metrics/` subdirectories for BigQuery datasets.
- **Suganthan's Public Bundle**: A real-world implementation packaging blog posts and notes as concept documents.
- **IELTS Speaking Bundle**: A proposed structure for organizing IELTS preparation concepts and playbooks.

## Relationship to Existing Wiki

OKF bundles introduce a new organizational layer (domain-level directories) that complements the existing entity/concept/source/query structure. While the wiki organizes knowledge by type, OKF organizes by domain — the two approaches can be combined.
