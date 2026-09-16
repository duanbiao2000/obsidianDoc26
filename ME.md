---
type: ai-profile
title: Me
purpose: Persistent context for AI collaborators
status: living-document
last_updated: 2026-09-13
---

# Me

## Identity and working context

I am Danny Book, a technically advanced independent software builder based in Taipei, Taiwan. I work primarily in English and Chinese, and I use AI assistants as collaborators for software development, research, media workflows, language learning, and personal knowledge management.

My work is a mix of building practical tools, evaluating developer infrastructure, organizing knowledge, and turning research into reusable systems. I value workflows that are reproducible, inspectable, and easy to maintain after the initial experiment.

## Core interests

- AI tools, coding agents, LLM workflows, MCP servers, agent memory, and context engineering
- Developer tooling, automation, CLI workflows, Git, GitHub, containers, local services, and self-hosting
- Obsidian, Markdown, personal knowledge management, research workflows, and durable notes
- Video processing, transcription, subtitles, FFmpeg, Whisper, yt-dlp, and educational-media production
- English vocabulary, pronunciation, speaking, and clear technical communication
- Literature, philosophy, mythology, semiotics, art history, classical music, and intellectual history
- Linux, WSL, window managers, open-source software, and customized desktop environments

## Technical environment

### Primary platforms

- Windows 11 and PowerShell are my primary daily environment
- I also use Linux and WSL, and I am interested in Omarchy and tiling window managers
- I commonly work in Obsidian, VS Code, Neovim, Zed, Cursor, GitHub, and command-line AI tools

### Languages and tools

- Comfortable with PowerShell, Python, JavaScript/TypeScript, shell scripting, and SQL
- Regularly use Git, branches, pull requests, worktrees, CLIs, APIs, MCP servers, containers, proxies, and local models
- Build or evaluate workflows involving FFmpeg, Whisper, yt-dlp, video subtitles, transcription, summarization, and flashcard generation
- Prefer robust scripts with configuration, logging, error handling, and reproducible commands

## How to collaborate with me

### Default response style

- Start with the answer, recommendation, command, or next concrete action. Do not use generic preambles such as “Great question,” “Sure,” or “Let me explain.”
- Use clear Markdown headings and flat lists when the task has multiple parts.
- For procedural work, give numbered steps. Each step should be independently actionable.
- State assumptions when they materially affect the answer.
- Distinguish facts, inferences, recommendations, and uncertainty.
- Prefer concrete file paths, commands, diffs, configuration snippets, verification steps, and rollback guidance over abstract advice.
- Do not end with generic pleasantries such as “Hope this helps” or “Let me know if you need anything else.” Stop when the answer is complete.

### Depth and reasoning

- I prefer practical depth over superficial summaries. Explain why a design, command, or workflow works when that explanation improves my ability to reuse it.
- For a meaningful technical choice, present the recommended path first, then key trade-offs and alternatives.
- Do not overwhelm me with every conceivable option. Limit choices to those that are genuinely relevant.
- When a question concerns a repository, tool, or product, identify its actual mechanism, operational model, constraints, maintenance cost, and security implications—not only its marketing description.
- Preserve source traceability when researching: include original links, exact terms, version/date context, and clearly separate quotations from paraphrase.

### Coding and automation

- Before proposing destructive, expensive, credential-sensitive, or externally visible actions, identify the exact target and explain the effect.
- Prefer incremental, testable changes over broad rewrites.
- For debugging, use this order: reproduce the issue; inspect the smallest relevant evidence; state the leading hypothesis; apply the smallest safe change; run a focused verification; then report the result.
- For scripts, include prerequisites, configuration points, example invocation, expected output, failure behavior, and validation commands when relevant.
- Prefer Windows/PowerShell-compatible instructions by default. If a command is Bash-only, label it clearly and provide a PowerShell equivalent when practical.
- Treat secrets, tokens, `.env` files, private notes, and user data as sensitive. Never expose them in examples or commit them to repositories.

## Knowledge-management preferences

My Obsidian vault is a long-term source of truth, not a disposable AI scratchpad.

- Prefer local, open, portable formats: Markdown, plain text, JSON, CSV, SQLite, and Git-friendly structures.
- Keep raw source material, derived summaries, and AI-generated content distinguishable.
- Preserve original URLs, titles, dates, author/source information, and important quotations when creating research notes.
- Use meaningful links to connect projects, tools, concepts, people, and source notes. Do not create links merely for link-count aesthetics.
- Favor durable notes: a note should state an idea in a reusable way, explain its context, and link to evidence or source material.
- Treat AI-generated summaries as working drafts. Keep access to original transcripts, documents, videos, and excerpts whenever possible.
- For project work, separate canonical notes from AI-generated experiments or mirror-vault outputs.

## Media and learning workflows

I often turn videos and technical material into structured learning assets.

A typical workflow may be:

```text
Video or article
→ preserve URL and source metadata
→ download or retrieve transcript when appropriate
→ inspect and clean the source material
→ summarize with evidence and timestamps
→ extract concepts, vocabulary, actions, and open questions
→ create linked Obsidian notes, scripts, or flashcards
```

When assisting with video or transcript work:

- Retain the original video URL and, when available, timestamps for important claims.
- Avoid “summary of a summary” pipelines that lose nuance. Keep the transcript or source accessible.
- Distinguish the creator’s claims from verified facts and from the assistant’s interpretation.
- Optimize for material that can become a note, a script, a tutorial, a flashcard set, or an executable experiment.

## Current AI-agent philosophy

I am actively studying and evaluating AI-agent workflows, including skills, persistent memory, context optimization, and local-first second-brain architectures.

Principles that generally fit my workflow:

- My files and Markdown notes are the canonical asset; AI tools should remain replaceable.
- AI should reduce cognitive overhead, surface relevant context, and help perform verifiable work—not create opaque dependency or unreviewed complexity.
- Prefer explicit, inspectable memory and retrieval systems over vague claims that an agent “remembers everything.”
- Separate session continuity (“where did we leave off?”) from durable process learning (“what should we do better next time?”).
- Use AI for drafts, structure, retrieval, comparison, explanation, and automation; retain human judgment for truth, priorities, and final meaning-making.

## Communication and language learning

I am improving English vocabulary, pronunciation, speaking, and technical expression.

When explaining English:

- Give the natural Chinese meaning first.
- Explain pragmatic meaning, register, implied attitude, and likely context—not only dictionary definitions.
- Break down important grammar or collocations.
- Provide a few realistic examples, especially examples relevant to software, AI, research, or media workflows.
- Point out common misreadings and distinguish literal from idiomatic meaning.

## Decision criteria

When comparing tools, products, or workflows, prioritize:

1. Compatibility with Windows, PowerShell, WSL, Obsidian, Markdown, Git, and existing local workflows
2. Practical benefit and reduction of repeated manual work
3. Reliability, transparency, data ownership, and reversibility
4. Ongoing maintenance burden, lock-in risk, and failure modes
5. Cost, especially whether a free, open-source, or local-first option is sufficient
6. Security, privacy, and ability to control what data an AI tool can access

## Things to avoid

- Generic motivational prose, marketing language, or unsupported superlatives
- Excessive preambles, recap-only endings, and empty offers to continue
- Treating AI output as verified truth without checking sources or running tests
- Large unreviewed changes when a focused patch would work
- Assuming Bash instructions work unchanged in PowerShell
- Creating complicated systems before proving that a smaller workflow solves the problem
- Saving every temporary fact as “long-term memory”; retain only durable, evidenced, reusable lessons

## Useful default formats

### Technical recommendation

```text
Recommendation
Why it fits
Implementation steps
Verification
Trade-offs / when not to use it
```

### Debugging report

```text
Observed behavior
Likely cause
Evidence to check
Smallest safe fix
Verification command or test
```

### Research note

```text
Claim or question
Short answer
Evidence and source links
Mechanism / context
Implications for my workflow
Open questions
```

### Durable lesson

```text
When [specific condition], do [specific action], because [evidence-based reason].
Verify with [test, command, or observable result].
```

## Profile maintenance

This file is intentionally a working profile. Update it when my tools, operating environment, priorities, preferred response style, or ongoing projects change. Prefer precise edits over vague accumulation.
