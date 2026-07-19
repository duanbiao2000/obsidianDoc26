# Full Batch Conversion Plan (Karpathy Wiki)

**Date**: 2026-06-29  
**Goal**: Systematic conversion of all high-value notes into the LLM Wiki using incremental manual batches.

---

## Batch Overview (Priority Order)

| Batch ID | Name | Source Folder | Estimated Files | Priority | Theme | Status |
|----------|------|---------------|------------------|----------|-------|--------|
| **P01** | Prompts-Batch-01 | `20_Prompts/copilot/custom/` | 8–12 | Critical | High-value prompts | ✅ Done (4 files) |
| **P02** | Prompts-Batch-02 | `20_Prompts/copilot/custom/` | 10–15 | Critical | Remaining prompts | Pending |
| **E01** | English-Expression | `02_Areas/English/Expression/` | 12–18 | High | Advanced expression | Pending |
| **S01** | IELTS-Speaking-Core | `01_Projects/IELTS-Prep/Speaking/` | 15–20 | High | Speaking mastery | Pending |
| **S02** | IELTS-Speaking-Advanced | `01_Projects/IELTS-Prep/Speaking/` | 15–20 | High | Part 2/3 + frameworks | Pending |
| **G01** | IELTS-Grammar | `01_Projects/IELTS-Prep/Grammar/` | 8–12 | Medium | Grammar patterns | Pending |
| **R01** | IELTS-Reading | `01_Projects/IELTS-Prep/Reading/` | 10–15 | Medium | Reading techniques | Pending |
| **C01** | Coding-Areas | `02_Areas/Coding/` | 12–18 | Medium | Software dev | Pending |
| **CR01** | Career-Development | `02_Areas/Career/` | 10–15 | Medium | Career & skills | Pending |
| **J01** | Daily-Journals | `05_Journals/Daily/` | 15–25 | Low | Recent journals | Pending |
| **T01** | Templates | `10_Templates/` | 8–12 | Low | Note templates | Pending |
| **A01** | Archive-HighValue | `04_Archive/` | 10–20 | Low | Selected archive notes | Pending |

---

## Detailed Batch Specifications

### P01 & P02 — Prompts (Critical)

**Source**: `raw/20_Prompts/copilot/custom/`

**Recommended Files for P02** (after P01):

- All remaining files in `copilot/custom/` except the 4 already converted
- Focus on `KM-*`, `TH-*`, `WR-*`, `RL-*`, `TD-*` series

**Target Wiki Folder**: `wiki/prompts/`

---

### E01 — English Expression (High)

**Source**: `raw/02_Areas/English/Expression/`

**Key Files**:

- `动词短语为王.md`
- `Lexical-Chunk.md`
- `从交谈中引申话题.md`
- `Eliminate-Weak-Language.md`
- `How-to-make-yourself-impressive-instead-of-clear.md`
- `最小语言单元Track-every-step.md`
- `纽约客既聪明又诚实的气质.md`

**Target**: `wiki/areas/English/` + `wiki/concepts/`

---

### S01 & S02 — IELTS Speaking (High)

**Source**: `raw/01_Projects/IELTS-Prep/Speaking/`

**S01 Focus**:

- Core frameworks (`口语流利度第一性原理.md`, `口语高分的底层逻辑.md`, `雅思高分口语力场分析.md`)
- Part 1 & Part 3 resources
- High-frequency question banks

**S02 Focus**:

- Part 2 cue cards
- `雅思口语10篇_Part2&3.md`
- `雅思口语360篇_Part1.md`
- `高频串题通用框架库.md`
- `每日口语笔记.md`

**Target**: `wiki/areas/English/` + `wiki/concepts/`

---

### G01, R01 — Grammar & Reading (Medium)

- Grammar: Focus on `中式语法盲区.md`, `名词化实用详解.md`, `句式多样性实例.md`
- Reading: Focus on technique files and symbol annotation guides

---

### C01 & CR01 — Coding & Career (Medium)

- Coding: `LazyVim配置教学.md`, `Linux-roadmap.md`, `Staff-Engineer必经之路.md`
- Career: `Career-Management-Skills.md`, `Future-Skills.md`, `Brutally-Honest-Advice-for-People-Moving-to-Australia-in-2026.md`

---

## Command-Line Scripts

### 1. Generate File List for a Batch

```bash
#!/bin/bash
# Usage: ./generate-batch-list.sh <source_folder> <batch_name>

SOURCE="$1"
BATCH_NAME="$2"

echo "# ${BATCH_NAME} - File List" > "${BATCH_NAME}-files.txt"
echo "Generated: $(date)" >> "${BATCH_NAME}-files.txt"
echo "" >> "${BATCH_NAME}-files.txt"

find "$SOURCE" -name "*.md" | sort >> "${BATCH_NAME}-files.txt"

echo "✅ File list saved to ${BATCH_NAME}-files.txt"
echo "Total files: $(wc -l < "${BATCH_NAME}-files.txt")"
```

**Example**:

```bash
chmod +x generate-batch-list.sh
./generate-batch-list.sh "raw/20_Prompts/copilot/custom" "Prompts-Batch-02"
```

---

### 2. Update Conversion Tracker (Append Mode)

```bash
#!/bin/bash
# Usage: ./update-tracker.sh <raw_path> <wiki_page> <status>

RAW_PATH="$1"
WIKI_PAGE="$2"
STATUS="${3:-done}"
DATE=$(date +%Y-%m-%d)

echo "| \`$RAW_PATH\` | \`$WIKI_PAGE\` | $STATUS | $DATE | Batch conversion |" >> wiki/meta/Conversion-Tracker.md

echo "✅ Tracker updated"
```

---

### 3. Prepare Conversion Prompt (One-liner)

```bash
#!/bin/bash
# Creates a ready-to-paste prompt for the next batch

BATCH_FILE="$1"
OUTPUT="conversion-prompt-$(basename $BATCH_FILE .txt).md"

cat > "$OUTPUT" << EOF
You are following the Karpathy LLM Wiki rules in wiki/SCHEMA.md.

Task: Convert the following raw notes into the wiki.

Files to process:
$(cat "$BATCH_FILE" | head -20)

Instructions:
1. For each file, determine the best \`type\`.
2. Create high-quality wiki pages with proper YAML frontmatter.
3. Add at least 2 wikilinks per page.
4. Create \`sources/\` summaries for long notes.
5. Update \`INDEX.md\` and \`LOG.md\`.
6. After finishing, provide a list of files to mark as \`done\` in Conversion-Tracker.md.

Please process 2–3 files at a time.
EOF

echo "✅ Conversion prompt saved to $OUTPUT"
```

---

### 4. Check Conversion Progress

```bash
#!/bin/bash
echo "=== Wiki Conversion Progress ==="
echo ""
echo "Total wiki pages:"
find wiki -name "*.md" | wc -l

echo ""
echo "Files by type:"
echo "prompts:     $(find wiki/prompts -name "*.md" 2>/dev/null | wc -l)"
echo "concepts:    $(find wiki/concepts -name "*.md" 2>/dev/null | wc -l)"
echo "areas:       $(find wiki/areas -name "*.md" 2>/dev/null | wc -l)"
echo "sources:     $(find wiki/sources -name "*.md" 2>/dev/null | wc -l)"

echo ""
echo "Tracker status:"
grep -E "done|pending" wiki/meta/Conversion-Tracker.md | wc -l
```

---

## Recommended Execution Order

1. **Complete P02** (Prompts) — highest reuse value
2. **E01** (English Expression) — foundational for language work
3. **S01 + S02** (IELTS Speaking) — core domain expertise
4. **G01 + R01** (Grammar & Reading)
5. **C01 + CR01** (Coding & Career)
6. **J01 + T01** (Journals & Templates) — lower priority

---

## Next Action

Would you like me to:

1. Generate the **detailed file list** for `Prompts-Batch-02`?
2. Create a ready-to-use **conversion prompt** for the next batch?
3. Generate shell scripts as actual executable files in `wiki/meta/scripts/`?

Just say which batch or action you want to start with.
