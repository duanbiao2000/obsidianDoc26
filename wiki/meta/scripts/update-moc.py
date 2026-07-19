#!/usr/bin/env python3
"""
MOC Update Scanner (Optimized)
更准确地扫描 wiki 目录，检测未被 MOC 收录的新页面。
"""

import re
from pathlib import Path
from collections import defaultdict

WIKI_ROOT = Path("wiki")

# MOC 文件与对应类型的映射
MOC_MAPPING = {
    "concept": WIKI_ROOT / "concepts/MOC-Concepts.md",
    "method": WIKI_ROOT / "meta/MOC-Meta.md",
    "template": WIKI_ROOT / "meta/MOC-Meta.md",
    "quickref": WIKI_ROOT / "meta/MOC-Meta.md",
}

# 明确排除的文件和目录
EXCLUDE_FILES = {
    "INDEX.md",
    "SCHEMA.md",
    "MOC-Wiki.md",
    "MOC-Concepts.md",
    "MOC-Meta.md",
    "MOC-Maintenance-Guide.md",
    "Wiki-Note-Quality-Checklist.md",
    "Knowledge-Explosion-Constraints.md",
    "Knowledge-Explosion-Workflow.md",
    "Wiki-Version-Management.md",
    "Wiki-Page-Type-Guide.md",
}

EXCLUDE_DIRS = {"skills", "templates", "tracking", "reports", "scripts", "guidelines"}


def get_page_type(file_path: Path) -> str | None:
    """从 frontmatter 中提取 type（更严格的解析）"""
    try:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
        
        # 必须匹配 frontmatter 中的 type
        match = re.search(
            r"^---\s*\n(.*?)\n---", 
            content, 
            re.DOTALL | re.MULTILINE
        )
        if not match:
            return None
            
        frontmatter = match.group(1)
        type_match = re.search(r"type:\s*(\w+)", frontmatter)
        return type_match.group(1) if type_match else None
        
    except Exception:
        return None


def should_exclude(file_path: Path) -> bool:
    """判断是否应该排除该文件"""
    if file_path.name in EXCLUDE_FILES:
        return True
    if any(part in EXCLUDE_DIRS for part in file_path.parts):
        return True
    return False


def get_page_title(file_path: Path) -> str:
    """尝试从 frontmatter 获取 title"""
    try:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
        match = re.search(r"title:\s*\"?([^\"]+)\"?", content)
        if match:
            return match.group(1).strip()
    except Exception:
        pass
    return file_path.stem


def scan_pages() -> dict[str, list[Path]]:
    """扫描所有需要被 MOC 管理的页面"""
    pages_by_type = defaultdict(list)

    for md_file in WIKI_ROOT.rglob("*.md"):
        if should_exclude(md_file):
            continue

        page_type = get_page_type(md_file)
        if page_type in MOC_MAPPING:
            pages_by_type[page_type].append(md_file)

    return pages_by_type


def check_moc_coverage(moc_path: Path, pages: list[Path]) -> list[Path]:
    """检查哪些页面尚未被 MOC 收录"""
    if not moc_path.exists():
        return pages

    try:
        content = moc_path.read_text(encoding="utf-8", errors="ignore")
    except Exception:
        return pages

    missing = []
    for page in pages:
        link = f"[[{page.stem}]]"
        if link not in content:
            missing.append(page)
    return missing


def main():
    print("=== MOC 更新扫描器 (Optimized) ===\n")

    pages_by_type = scan_pages()

    if not pages_by_type:
        print("未检测到需要管理的页面。")
        return

    has_updates = False

    for ptype, pages in pages_by_type.items():
        moc_path = MOC_MAPPING[ptype]
        missing = check_moc_coverage(moc_path, pages)

        if not missing:
            continue

        has_updates = True
        print(f"\n📌 需要更新: {moc_path.name} ({ptype})")
        print(f"   路径: {moc_path}")
        print(f"   发现 {len(missing)} 个未收录页面：\n")

        for page in missing:
            relative_path = page.relative_to(WIKI_ROOT)
            title = get_page_title(page)
            print(f"   - [[{page.stem}]] — {title}")
            print(f"     ({relative_path})")

    if not has_updates:
        print("所有页面均已被对应 MOC 收录。")

    print("\n=== 扫描完成 ===")
    print("请根据以上建议手动更新对应 MOC 文件。")


if __name__ == "__main__":
    main()