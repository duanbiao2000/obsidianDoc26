---
name: miyo-parse
description: Parse a local PDF or EPUB file into Markdown/text with the local Miyo CLI. Use this for document reading when Miyo is the selected Document Processor. The file can be anywhere on the filesystem and does not need to be indexed or copied into the vault.
metadata:
  copilot-enabled-agents: claude, codex, opencode
  copilot-builtin-version: "1"
---

# Parse a document locally with Miyo

Use Miyo to extract Markdown/text from one PDF or EPUB. Parsing runs locally,
works for files anywhere on the filesystem, and does not require the Miyo
service to be running.

## How to run

Find the absolute path to this SKILL.md file, then run the adjacent wrapper
with exactly one quoted file path.

On macOS or Linux:

```bash
sh "/absolute/path/to/this/skill/directory/miyo-parse.sh" "/absolute/path/to/document.pdf"
```

On Windows PowerShell:

```powershell
& "/absolute/path/to/this/skill/directory/miyo-parse.cmd" "C:\absolute\path\to\document.pdf"
```

The wrapper prints the parsed Markdown/text to stdout. Use that output to
answer the user's question.

## If it reports a problem

Report the error clearly and stop parsing that document. Never fall back to
`copilot-read-pdf` or any other cloud document parser: selecting Miyo is an
explicit local-processing choice. Do not retry in a loop.

If it reports that the Miyo CLI is not installed, say that pointing Copilot at a
remote Miyo server does not help here, and that the user's options are to
install Miyo on this machine or switch Settings → Copilot → Miyo → Document
Processor to Plus.
