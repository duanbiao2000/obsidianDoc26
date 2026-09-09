#!/usr/bin/env python3
"""Session-start reminder and entry-file presence check."""
from __future__ import annotations

import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[2]


def frontmatter_value(text: str, key: str) -> str | None:
    match = re.search(rf'^{re.escape(key)}:\s*"?([^"\n]+)"?', text, re.MULTILINE)
    return match.group(1).strip() if match else None


def main() -> int:
    agent = PROJECT_ROOT / "AGENT.md"
    handoff = PROJECT_ROOT / "00-项目交接与实时状态.md"
    root_readme = PROJECT_ROOT / "README.md"
    missing = [path.name for path in (agent, handoff, root_readme) if not path.is_file()]
    if missing:
        print("FAIL: missing project entry file(s): " + ", ".join(missing))
        return 1

    handoff_text = handoff.read_text(encoding="utf-8")
    baseline = frontmatter_value(handoff_text, "current_editorial_baseline") or "not declared"
    active = frontmatter_value(handoff_text, "current_active_episode") or "not declared"
    print("SESSION START — read in order: AGENT.md → 00-项目交接与实时状态.md → task-specific formal files → applicable skill.")
    print(f"Current editorial baseline: {baseline}")
    print(f"Current active episode: {active}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
