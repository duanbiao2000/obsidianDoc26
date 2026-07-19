# Wiki Conversion Skills

This directory contains specialized skills for converting raw notes into a Karpathy-style LLM Wiki.

## Skill Files

| File | Description | When to Use |
|------|-------------|-------------|
| `conversion-agent.skill.md` | **Main Skill** (Recommended) | Most conversion tasks |
| `wiki-conversion.skill.md` | Core conversion workflow | When you want modular control |
| `page-type-decision.skill.md` | Type selection logic | When making complex type decisions |
| `multi-type-conversion.skill.md` | Multi-page extraction strategy | When maximizing value from one note |

## Recommended Usage

### Option 1: Single Skill (Simplest)

```markdown
Before starting any wiki conversion, load:
wiki/meta/skills/conversion-agent.skill.md
```

### Option 2: Modular Skills (More Control)

```markdown
Load the following skills in order:
1. wiki/meta/skills/wiki-conversion.skill.md
2. wiki/meta/skills/page-type-decision.skill.md  
3. wiki/meta/skills/multi-type-conversion.skill.md
```

## Key Principles

- One raw note can generate **multiple page types**
- Always follow `wiki/meta/Wiki-Page-Type-Guide.md`
- Prefer creating at least one `concept` when possible
- Never modify files in `raw/`

## Related Documents

- `wiki/meta/Wiki-Page-Type-Guide.md` — Official type definitions
- `wiki/SCHEMA.md` — Main wiki maintainer instructions
- `99_Meta/Karpathy-LLM-Wiki-Conversion-SOP.md` — High-level conversion SOP

---

*Last updated: 2026-06-29*