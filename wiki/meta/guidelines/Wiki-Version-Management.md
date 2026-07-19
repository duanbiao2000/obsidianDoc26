# Wiki Version Management

**Current Wiki Version**: 1.1  
**Last Major Update**: 2026-06-29

## Versioning Rules

- **Major version** (1.x → 2.x): Structural changes to wiki architecture or type system
- **Minor version** (1.0 → 1.1): Addition of new page types, significant guideline updates
- **Patch** (1.1.0 → 1.1.1): Bug fixes in guides or small improvements

## Change Log

### v1.3 (2026-07-01)

- Created `methods/` directory and migrated method-type pages
- Created `areas/MOC-Areas.md` and domain MOCs (`English.md`, `Career.md`)
- Unified template file naming (e.g., `*-Template.md`)
- Added Mermaid architecture diagram to `MOC-Wiki.md`
- Optimized `update-moc.py` script (v2.0)
- Updated `conversion-agent.skill.md` with MOC maintenance reminder
- Established Wiki version release mechanism (Changelog style)

### v1.0 (2026-06-29)

- Initial Karpathy LLM Wiki structure
- Core page types defined
- First version of conversion SOP

## How to Update Version

1. Update this file
2. Update `wiki/OVERVIEW.md` with new version
3. Announce major changes in `wiki/LOG.md`

---

*Maintained by Wiki Maintainer*
