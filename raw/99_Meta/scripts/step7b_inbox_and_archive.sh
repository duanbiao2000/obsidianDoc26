
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"



echo "╔═══════════════════════════════╗"

echo "║  收尾清理 Part B               ║"

echo "╚═══════════════════════════════╝"



# ═══════════════════════════════════

# 2. 归档合并后的原始文件残留

# ═══════════════════════════════════

echo ""

echo "--- 归档合并原始文件 ---"



files_to_archive=(

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation固定搭配.md"

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation-的系统分类.md"

  "$ROOT/02_Areas/English/Style-Register/语域切换-(Register).md"

  "$ROOT/02_Areas/English/Style-Register/语域差异.md"

  "$ROOT/02_Areas/Coding/grep.app代码搜索引擎使用策略.md"

  "$ROOT/02_Areas/Coding/grep.app-使用策略.md"

  "$ROOT/02_Areas/Coding/grep.app-vs-github-search.md"

  "$ROOT/02_Areas/Coding/Sourcegraph-代码搜索指南.md"

  "$ROOT/02_Areas/Coding/Sourcegraph进阶.md"

)



for f in "${files_to_archive[@]}"; do

  if [[ -f "$f" ]]; then

    mv -v "$f" "$ROOT/04_Archive/"

  else

    echo "  ⏭️  不存在(已处理): $(basename "$f")"

  fi

done



# ═══════════════════════════════════

# 3. 迁移 epub/pdf

# ═══════════════════════════════════

echo ""

echo "--- 迁移 epub/pdf ---"



mkdir -p "$ROOT/90_Attachments/Books"



find "$ROOT" -type f \( -name '*.pdf' -o -name '*.epub' \) \

  -not -path '*/90_Attachments/*' \

  -not -path '*/.obsidian/*' | while IFS= read -r f; do

  mv -v "$f" "$ROOT/90_Attachments/Books/"

done



echo ""

echo "Books/ 内容:"

ls -lh "$ROOT/90_Attachments/Books/" 2>/dev/null || echo "  (空)"



# ═══════════════════════════════════

# 4. Inbox 剩余文件归位

# ═══════════════════════════════════

echo ""

echo "--- Inbox 剩余归位 ---"



# → PKM

for f in \

  "Steel-man-the-core-argument.md" \

  "understand-one-thing.md" \

  "Raction-and-Feedback.md" \

  "突破停滞：圆圈图学习与成长指南——区分"引力问题"与"可控变量".md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/02_Areas/PKM/"

done



# → Philosophy

for f in \

  "Knowledge-and-Experience.md" \

  "Recognizing-emotional-&-behavioral-patterns.md" \

  "如何建立不求回报的深度连接.md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/02_Areas/Philosophy/"

done



# → Career

for f in \

  "Be-unforgettable-to-be-valuable.md" \

  "Stop-us-pulling-in-different-directions-and-falling-apart.md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/02_Areas/Career/"

done



# → Coding

for f in "long-horizon-tasks.md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/02_Areas/Coding/"

done



# → IELTS General

for f in \

  "Empirical-evidence.md" \

  "formative-assessment（形成性评估）.md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/01_Projects/IELTS-Prep/General/"

done



# → Tools

for f in "Archive在线搜索技巧-在线音频.md"; do

  src="$ROOT/00_Inbox/$f"

  [[ -f "$src" ]] && mv -v "$src" "$ROOT/03_Resources/Tools/"

done



# ═══════════════════════════════════

# 5. 最终统计

# ═══════════════════════════════════

echo ""

echo "═══════════════════════════════"

echo "📊 最终统计"

echo ""



inbox_left=$(find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' | wc -l)

archive_total=$(find "$ROOT/04_Archive" -name '*.md' | wc -l)

books_total=$(ls "$ROOT/90_Attachments/Books/" 2>/dev/null | wc -l)

total_md=$(find "$ROOT" -name '*.md' -not -path '*/.obsidian/*' | wc -l)



echo "总 md 文件数 : $total_md"

echo "Inbox 剩余   : $inbox_left 个"

echo "Archive 总数 : $archive_total 个"

echo "Books 附件   : $books_total 个"

echo ""

echo "各区域文件数:"

for dir in "$ROOT"/0[0-9]_*/ "$ROOT"/1[0-9]_*/ "$ROOT"/2[0-9]_*/ "$ROOT"/3[0-9]_*/; do

  [[ -d "$dir" ]] || continue

  count=$(find "$dir" -name '*.md' | wc -l)

  printf "  %-30s %d\n" "$(basename "$dir")" "$count"

done



echo ""

if (( inbox_left == 0 )); then

  echo "🎉 Inbox 已清零！"

else

  echo "📥 Inbox 剩余文件:"

  find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' -exec basename {} \; | sort

fi

echo "═══════════════════════════════"

