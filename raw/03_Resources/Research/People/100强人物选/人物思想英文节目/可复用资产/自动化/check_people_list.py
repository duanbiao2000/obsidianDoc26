#!/usr/bin/env python3
"""Read-only validator for the current formal 100-person list.

This script intentionally reads machine-readable constraints from
人物库硬约束.v0.1.json. It never edits the list or makes editorial decisions.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import unicodedata
from collections import Counter
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_POLICY = Path(__file__).with_name("人物库硬约束.v0.1.json")


def normalize(value: str) -> str:
    value = unicodedata.normalize("NFKD", value)
    value = "".join(ch for ch in value if not unicodedata.combining(ch))
    value = re.sub(r"\s+", " ", value).strip().casefold()
    return value


def load_policy(path: Path) -> dict:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        raise SystemExit(f"FAIL: policy file not found: {path}")
    except json.JSONDecodeError as exc:
        raise SystemExit(f"FAIL: invalid JSON in policy file {path}: {exc}")


def extract_rows(text: str) -> list[tuple[int, str]]:
    rows: list[tuple[int, str]] = []
    for line in text.splitlines():
        match = re.match(r"^\|\s*(\d+)\s*\|\s*\*\*(.*?)\*\*", line)
        if match:
            rows.append((int(match.group(1)), match.group(2).strip()))
    return rows


def primary_name(label: str) -> str:
    return re.split(r"[（(｜]", label, maxsplit=1)[0].strip()


def includes_any(label: str, choices: list[str]) -> bool:
    normalized_label = normalize(label)
    return any(normalize(choice) in normalized_label for choice in choices)


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate the formal people list.")
    parser.add_argument(
        "--policy",
        type=Path,
        default=DEFAULT_POLICY,
        help="Policy JSON path; defaults to 人物库硬约束.v0.1.json next to this script.",
    )
    args = parser.parse_args()

    policy_path = args.policy if args.policy.is_absolute() else (Path.cwd() / args.policy)
    if not policy_path.exists() and args.policy == DEFAULT_POLICY:
        policy_path = DEFAULT_POLICY
    policy = load_policy(policy_path)

    list_path = PROJECT_ROOT / policy["canonical_formal_list"]
    errors: list[str] = []
    if not list_path.exists():
        print(f"FAIL: canonical formal list not found: {list_path}")
        return 1

    text = list_path.read_text(encoding="utf-8")
    rows = extract_rows(text)
    ids = [number for number, _ in rows]
    labels = [label for _, label in rows]

    expected_count = int(policy["expected_person_count"])
    first_id, last_id = policy["expected_id_range"]
    expected_ids = list(range(int(first_id), int(last_id) + 1))

    if len(rows) != expected_count:
        errors.append(f"formal rows = {len(rows)}, expected {expected_count}")
    if ids != expected_ids:
        errors.append(f"IDs are not exactly {first_id}–{last_id} in order: {ids}")

    canonical_names = [normalize(primary_name(label)) for label in labels]
    duplicates = [name for name, count in Counter(canonical_names).items() if count > 1]
    if duplicates:
        errors.append("duplicate primary names: " + ", ".join(duplicates))

    filename_version = re.search(r"-v(\d+\.\d+)\.md$", list_path.name)
    title_version = re.search(r'^title:\s*".*?\bv(\d+\.\d+)', text, re.MULTILINE)
    if not filename_version or not title_version:
        errors.append("could not compare filename version with frontmatter title version")
    elif filename_version.group(1) != title_version.group(1):
        errors.append(
            "version mismatch: filename v"
            f"{filename_version.group(1)} vs title v{title_version.group(1)}"
        )

    for item in policy.get("required_current_members", []):
        if not any(includes_any(label, item["match_any"]) for label in labels):
            errors.append(f"required current member missing: {item['id']}")

    for item in policy.get("forbidden_members", []):
        matched = [label for label in labels if includes_any(label, item["match_any"])]
        if matched:
            errors.append(f"forbidden member present: {item['id']} ({'; '.join(matched)})")

    if errors:
        print("FAIL: formal people-list validation")
        for error in errors:
            print(f"  - {error}")
        return 1

    print(
        "PASS: formal people list | "
        f"{len(rows)} rows | IDs {first_id}–{last_id} | no duplicate primary names | "
        f"policy {policy.get('schema_version', 'unknown')}"
    )
    for item in policy.get("review_items", []):
        print(f"WARN: human review remains open — {item['id']}: {item['note']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
