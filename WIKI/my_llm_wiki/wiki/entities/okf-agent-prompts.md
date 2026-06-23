---
type: entity
title: OKF Agent Prompts
created: 2026-06-22
updated: 2026-06-22
tags: [okf, ai-agents, prompt-engineering, knowledge-graph]
related: [okf-bundle, claude-chat-commands, context-engineering]
sources: ["Journals/2026-06-18 OKF bundle.md"]
---

# OKF Agent Prompts

The **OKF Agent Prompts** are a companion resource to the [[OKF Bundle]] format. They provide prompt templates and instructions for AI agents to effectively consume, traverse, and reason over OKF bundles as knowledge graphs.

## Purpose

While the OKF bundle format defines the structure of concept files and directories, the agent prompts define how an AI agent should:

- Start from `index.md` and discover the bundle's structure
- Traverse linked concept files to build a coherent knowledge graph
- Extract and synthesize information across multiple concept documents
- Maintain context about the domain while navigating subdirectories

## Usage

These prompts are designed to be used with any AI agent that supports file reading and Markdown parsing, including [[Claude Code]] and other LLM-based tools. The prompts guide the agent to treat the bundle as a structured knowledge base rather than a flat collection of files.

## Relationship

The OKF Agent Prompts are referenced directly from the OKF Bundle source as a linked companion resource. Together, they form a complete system: the bundle provides the structured knowledge, and the prompts provide the agent instructions for consuming it.
