#!/usr/bin/env python3
"""Read-only cross-reference validator for the project entry documents."""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[2]
AUTO_DIR = Path(__file__).resolve().parent
DEFAULT_POLICY = AUTO_DIR / "人物库硬约束.v0.1.json"


def load_policy(path: Path) -> dict:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception as exc:  # concise command-line failure is more useful here
        raise SystemExit(f"FAIL: cannot read policy {path}: {exc}")


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate project entry-point links.")
    parser.add_argument("--policy", type=Path, default=DEFAULT_POLICY)
    args = parser.parse_args()
    policy_path = args.policy if args.policy.is_absolute() else (Path.cwd() / args.policy)
    if not policy_path.exists() and args.policy == DEFAULT_POLICY:
        policy_path = DEFAULT_POLICY
    policy = load_policy(policy_path)

    canonical_relative = policy["canonical_formal_list"]
    canonical_filename = Path(canonical_relative).name
    files = {
        "root README": PROJECT_ROOT / "README.md",
        "agent contract": PROJECT_ROOT / "AGENT.md",
        "live handoff": PROJECT_ROOT / "00-项目交接与实时状态.md",
        "people-library README": PROJECT_ROOT / "人物库" / "README.md",
        "assets README": PROJECT_ROOT / "可复用资产" / "README.md",
        "skills index": PROJECT_ROOT / "可复用资产" / "skills" / "README.md",
        "automation README": PROJECT_ROOT / "可复用资产" / "自动化" / "README.md",
        "canonical formal list": PROJECT_ROOT / canonical_relative,
    }
    errors: list[str] = []
    for label, path in files.items():
        if not path.is_file():
            errors.append(f"missing {label}: {path.relative_to(PROJECT_ROOT)}")

    if errors:
        print("FAIL: project-link validation")
        for error in errors:
            print(f"  - {error}")
        return 1

    root_readme = files["root README"].read_text(encoding="utf-8")
    handoff = files["live handoff"].read_text(encoding="utf-8")
    people_readme = files["people-library README"].read_text(encoding="utf-8")
    assets_readme = files["assets README"].read_text(encoding="utf-8")
    agent = files["agent contract"].read_text(encoding="utf-8")

    required_snippets = [
        ("root README", root_readme, "AGENT.md"),
        ("root README", root_readme, "00-项目交接与实时状态.md"),
        ("root README", root_readme, canonical_filename),
        ("root README", root_readme, "skills/"),
        ("root README", root_readme, "自动化/"),
        ("people-library README", people_readme, canonical_filename),
        ("assets README", assets_readme, "skills/"),
        ("assets README", assets_readme, "自动化/"),
        ("AGENT.md", agent, "hook-manifest.v0.1.json"),
        ("live handoff", handoff, f'current_editorial_baseline: "{canonical_relative}"'),
    ]
    for label, content, snippet in required_snippets:
        if snippet not in content:
            errors.append(f"{label} does not contain required reference: {snippet}")

    entry_docs = [files["root README"], files["live handoff"], files["people-library README"]]
    filename_pattern = re.compile(r"100人候选名单-编排版-v\d+\.\d+\.md")
    for path in entry_docs:
        referenced = set(filename_pattern.findall(path.read_text(encoding="utf-8")))
        stale = sorted(name for name in referenced if name != canonical_filename)
        if stale:
            errors.append(f"stale formal-list filename in {path.name}: {', '.join(stale)}")

    if errors:
        print("FAIL: project-link validation")
        for error in errors:
            print(f"  - {error}")
        return 1

    print(
        "PASS: entry documents and canonical-list references agree on "
        f"{canonical_filename}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
