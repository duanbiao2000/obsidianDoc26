---
type: concept
title: Open Knowledge Format (OKF)
created: 2026-06-22
updated: 2026-06-22
tags: [okf, knowledge-management, ai-agents, markdown, yaml]
related: [okf-bundle, okf-agent-prompts, second-brain, para-method, notebooklm-obsidian-pipeline, nic-deville]
sources: ["Journals/2026-06-18 OKF bundle.md"]
---

# Open Knowledge Format (OKF)

The **Open Knowledge Format (OKF)** is a structured approach to organizing knowledge as a directory of Markdown concept files with YAML frontmatter. It is designed for dual consumption by humans and AI agents.

## Core Principles

1. **One Concept, One File**: Each distinct concept gets its own `.md` file, making the knowledge graph explicit and navigable.
2. **YAML Frontmatter as Metadata Layer**: The `type` field is the only required field; all other metadata is extensible per use case.
3. **Hierarchical Organization**: Subdomain directories group related concepts, with `index.md` files serving as entry points.
4. **Agent-First Design**: The structure is optimized for AI agents to traverse from `index.md` through linked files, building a complete knowledge graph without web scraping.
5. **Human-Readable Body**: The Markdown body contains prose, tables, examples, and links that are clear to human readers.

## Key Design Decisions

- **Minimal Required Schema**: Only `type` is mandatory in YAML frontmatter, making the format easy to adopt and extend.
- **Standard Markdown**: No custom syntax or proprietary tools required — any Markdown renderer or AI agent can process the files.
- **Portable**: Bundles can be packaged as `tar.gz` and distributed without dependencies on specific platforms or services.

## Applications

- **Documentation**: Technical documentation for APIs, databases, and systems (e.g., Google Cloud's BigQuery sales example).
- **Education**: Structured knowledge bases for exam preparation (e.g., IELTS speaking concepts and playbooks).
- **Personal Knowledge Management**: Packaging blog posts and notes as agent-readable concept documents (e.g., Suganthan's public bundle).
- **Enterprise Knowledge Graphs**: Domain-specific knowledge bases that AI agents can query and reason over.

## Comparison to Other Approaches

| Aspect | OKF | [[PARA Method]] | [[Second Brain]] |
|--------|-----|-----------------|------------------|
| Primary audience | Humans + AI agents | Humans | Humans |
| Structure | Domain directories with concept files | Projects, Areas, Resources, Archives | Linked notes |
| Metadata | YAML frontmatter | Folder-based | Tags and links |
| Agent support | First-class design | Incidental | Incidental |

## Open Questions

- How does OKF relate to existing wiki organizational principles (entity/concept/source/query)? Should OKF bundles become a new top-level category?
- Is OKF meant to replace or complement the current note-taking workflow? The source presents it as an export/consumption format, not a creation format.
- What agent tools (Claude Code, etc.) currently support OKF consumption? The source mentions "any agent" but doesn't specify tested implementations.
