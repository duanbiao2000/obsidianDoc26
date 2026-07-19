# Conversion Tracker

**Purpose**: Track which raw notes have been processed into the wiki.  
**Rule**: Never re-process a file marked as `done`.

**Status Legend**:

- `pending` — Not yet processed
- `in-progress` — Currently being converted
- `done` — Successfully converted to wiki
- `skipped` — Intentionally left in raw only

---

## Summary

| Status    | Count |
|-----------|-------|
| pending   | 0     |
| done      | 6     |
| skipped   | 0     |
| in-progress | 0   |

**Last Updated**: 2026-06-29

---

## Processed Files

| Raw Path | Wiki Page(s) Created | Status | Date | Notes |
|----------|----------------------|--------|------|-------|
| `raw/20_Prompts/copilot/custom/KM-万能笔记重构引擎.md` | `wiki/prompts/KM-Universal-Note-Restructuring-Engine.md` | done | 2026-06-29 | First batch - Prompts |
| `raw/20_Prompts/copilot/custom/提示词质量评估标准.md` | `wiki/prompts/Prompt-Quality-Assessment-Standard.md` | done | 2026-06-29 | First batch - Prompts |
| `raw/20_Prompts/copilot/custom/雅思8.5口语语料生成规则.md` | `wiki/prompts/IELTS-8.5-Speaking-Corpus-Generation-Rules.md` | done | 2026-06-29 | First batch - Prompts |
| `raw/20_Prompts/copilot/custom/雅思官方标准的完整口语套题.md` | `wiki/prompts/IELTS-Official-Speaking-Question-Set-Generator.md` | done | 2026-06-29 | First batch - Prompts |
| `raw/20_Prompts/copilot/custom/KM-4D笔记重构助手.md` | `wiki/prompts/KM-4D-Note-Restructuring-Assistant.md` | done | 2026-06-29 | Prompts-Batch-02 (KM Sub-batch) |
| `raw/20_Prompts/copilot/custom/KM-Zettelkasten卡片生成器.md` | `wiki/prompts/KM-Zettelkasten-Card-Generator.md` | done | 2026-06-29 | Prompts-Batch-02 (KM Sub-batch) |
| `raw/20_Prompts/copilot/custom/KM-全能知识精炼大师.md` | `wiki/prompts/KM-Universal-Knowledge-Refiner.md` + 4 concepts | done | 2026-06-29 | Multi-type: prompt + concepts |
| `raw/20_Prompts/copilot/custom/KM-知识图谱构建分析师.md` | `wiki/prompts/KM-Knowledge-Graph-Synapse-Builder.md` | done | 2026-06-29 | Prompts-Batch-02 |
| `raw/20_Prompts/copilot/custom/KM-笔记结构化处理器.md` | `wiki/prompts/KM-Note-Structuring-Engine.md` + 2 concepts | done | 2026-06-29 | Multi-type: prompt + concepts |
| `raw/02_Areas/English/Expression/动词短语为王.md` | `wiki/areas/English/Verb-Phrase-Mastery.md` | done | 2026-06-29 | English Expression Batch 01 |
| `raw/02_Areas/English/Expression/Lexical-Chunk.md` | `wiki/concepts/Lexical-Chunk-System.md` | done | 2026-06-29 | English Expression Batch 01 |
| `raw/02_Areas/English/Expression/Eliminate-Weak-Language.md` | `wiki/concepts/Eliminate-Weak-Language.md` | done | 2026-06-29 | English Expression Batch 01 |
| `raw/02_Areas/English/Expression/How-to-make-yourself-impressive-instead-of-clear.md` | `wiki/areas/English/Make-Yourself-Impressive.md` | done | 2026-06-29 | English Expression Batch 01 |
| `raw/02_Areas/English/Expression/最小语言单元Track-every-step.md` | `wiki/areas/English/Minimal-Language-Unit-Tracking.md` | done | 2026-06-29 | English Expression Batch 01 |
| `raw/02_Areas/English/Expression/从交谈中引申话题.md` | `wiki/concepts/Topic-Extension-Technique.md` | done | 2026-06-29 | English Expression Batch 01 |

---

## Instructions for Maintainers

When ingesting a file:

1. Check this table first.
2. If status is `done`, skip.
3. After successful conversion, add a new row with status `done`.

---

*This file is the single source of truth for incremental conversion.*
