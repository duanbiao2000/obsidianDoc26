#!/usr/bin/env python3
"""Advisory close-of-session check for the live handoff document.

It never edits content. Use --strict when a runtime should block session completion.
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[2]
HANDOFF = PROJECT_ROOT / "00-项目交接与实时状态.md"


def frontmatter_value(text: str, key: str) -> str | None:
    match = re.search(rf'^{re.escape(key)}:\s*"?([^"\n]+)"?', text, re.MULTILINE)
    return match.group(1).strip() if match else None


def main() -> int:
    parser = argparse.ArgumentParser(description="Check that the live handoff is ready to hand over.")
    parser.add_argument("--expect-date", help="Expected YYYY-MM-DD for last_updated and an update-log entry.")
    parser.add_argument("--strict", action="store_true", help="Return nonzero when advisory conditions are not met.")
    args = parser.parse_args()

    if not HANDOFF.is_file():
        print(f"FAIL: handoff file not found: {HANDOFF}")
        return 1

    text = HANDOFF.read_text(encoding="utf-8")
    warnings: list[str] = []
    last_updated = frontmatter_value(text, "last_updated")
    if not last_updated:
        warnings.append("frontmatter last_updated is missing")
    if "## 下一步 P0" not in text:
        warnings.append("no explicit '下一步 P0' section")
    if "## 更新日志" not in text:
        warnings.append("no update log section")
    if args.expect_date:
        if last_updated != args.expect_date:
            warnings.append(f"last_updated is {last_updated!r}, expected {args.expect_date!r}")
        if f"| {args.expect_date} |" not in text:
            warnings.append(f"no update-log entry for {args.expect_date}")

    if warnings:
        print("WARN: handoff close check")
        for warning in warnings:
            print(f"  - {warning}")
        print("Reminder: update the factual files first, then the live handoff; do not let this script invent content.")
        return 1 if args.strict else 0

    print(f"PASS: live handoff is structurally ready (last_updated: {last_updated}).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
