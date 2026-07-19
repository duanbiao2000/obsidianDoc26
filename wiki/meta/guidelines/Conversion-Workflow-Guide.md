# Conversion Workflow Guide

**Purpose**: Step-by-step instructions for manually converting raw notes into the Karpathy Wiki using LLM conversations.

---

## Recommended Workflow (Per Batch)

### Step 1: Choose a Batch
- Pick 5–15 related notes from one folder.
- Avoid mixing unrelated topics.

### Step 2: Check Tracker
Verify none of the files are already marked `done` in `wiki/meta/tracking/Conversion-Tracker.md`.

### Step 3: Prepare Conversion Prompt
Use the following template:

```markdown
You are following the Karpathy LLM Wiki rules in wiki/SCHEMA.md.

Task: Convert the following raw note(s) into the wiki.

Raw file(s):
{{list of raw paths}}

Instructions:
1. For each file, determine the best `type`.
2. Create high-quality wiki pages with proper YAML frontmatter.
3. Add at least 2 wikilinks per page.
4. Create `sources/` summaries for long notes.
5. Update `INDEX.md` and `LOG.md`.
6. After finishing, provide a list of files to mark as `done` in Conversion-Tracker.md.

Raw content:
{{paste content of 1-3 files at a time}}
```

### Step 4: Review & Apply
- Review LLM output.
- Copy generated Markdown to the correct `wiki/` subfolder.
- Update `INDEX.md` and `LOG.md` if needed.

### Step 5: Update Tracker
Add processed files to `Conversion-Tracker.md` with status `done`.

---

## Tips for Manual Conversion

- **Limit per message**: Paste 1–3 raw notes at a time.
- **Use source summaries**: For long notes, first create a `sources/` page.
- **Track progress**: Update the tracker **immediately** after each batch.
- **Link aggressively**: Connect new pages to existing ones.
- **Keep raw intact**: Never modify files in `raw/`.

---

*This guide focuses on operational workflow. For batch planning, see `Full-Batch-Conversion-Plan.md`.*