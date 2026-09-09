#!/usr/bin/env python3
"""Block full-script work unless the selected episode has ERP GREEN status."""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[2]
EPISODES_ROOT = PROJECT_ROOT / "节目制作"


def read_status(board_path: Path) -> str | None:
    text = board_path.read_text(encoding="utf-8")
    match = re.search(r'^status:\s*"([^"]+)"', text, re.MULTILINE)
    return match.group(1).strip() if match else None


def main() -> int:
    parser = argparse.ArgumentParser(description="Check whether an episode may enter full-script work.")
    parser.add_argument(
        "--episode",
        required=True,
        help="Episode directory name, e.g. EP001-Ryan-Holiday; an absolute path is also accepted.",
    )
    parser.add_argument(
        "--action",
        choices=["full-script"],
        default="full-script",
        help="The gated action. v0.1 currently gates full-script work only.",
    )
    args = parser.parse_args()

    episode_path = Path(args.episode)
    if not episode_path.is_absolute():
        episode_path = EPISODES_ROOT / episode_path
    board_path = episode_path / "00-项目看板.md"
    if not board_path.is_file():
        print(f"FAIL: episode board not found: {board_path}")
        return 1

    status = read_status(board_path)
    if not status:
        print(f"FAIL: no frontmatter status found in {board_path}")
        return 1

    if "ERP GREEN" not in status.upper():
        print(
            "BLOCKED: full-script work requires ERP GREEN. "
            f"{episode_path.name} is currently: {status}. "
            "Continue research/ERP work or update the board only after evidence is complete."
        )
        return 1

    print(f"PASS: {episode_path.name} is {status}; full-script work is permitted.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
