#!/usr/bin/env python3
"""
Find Orphan Notes in Wiki
扫描 wiki 目录，找出没有被任何页面链接的孤岛笔记。
"""

import re
from pathlib import Path

WIKI_ROOT = Path("wiki")

# 需要排除的管理类文件关键词
EXCLUDE_KEYWORDS = [
    "MOC-", "INDEX", "Onboarding", "Architecture", 
    "Changelog", "Final-Structure-Guide", "Wiki-Note-Quality-Checklist",
    "Knowledge-Explosion-Constraints", "Knowledge-Explosion-Workflow",
    "MOC-Maintenance-Guide", "Wiki-Architecture"
]

def find_orphans():
    all_notes = set()
    linked_notes = set()

    # 收集所有 .md 文件
    for md_file in WIKI_ROOT.rglob("*.md"):
        all_notes.add(md_file.stem)

    # 收集所有被链接的笔记
    for md_file in WIKI_ROOT.rglob("*.md"):
        try:
            content = md_file.read_text(encoding="utf-8", errors="ignore")
            links = re.findall(r'\[\[([^\]|]+)', content)
            for link in links:
                linked_notes.add(link.strip())
        except Exception:
            continue

    # 计算孤岛
    orphans = all_notes - linked_notes

    # 排除管理类文件
    orphans = [
        o for o in orphans 
        if not any(keyword in o for keyword in EXCLUDE_KEYWORDS)
    ]

    return sorted(orphans)


if __name__ == "__main__":
    orphans = find_orphans()
    
    if orphans:
        print("=== 发现孤岛笔记 ===\n")
        for orphan in orphans:
            print(f"- [[{orphan}]]")
        print(f"\n共发现 {len(orphans)} 个孤岛笔记。")
    else:
        print("未发现孤岛笔记。")