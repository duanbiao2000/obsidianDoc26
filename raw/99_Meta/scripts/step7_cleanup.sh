
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"



echo "╔═══════════════════════════════╗"

echo "║  收尾清理                      ║"

echo "╚═══════════════════════════════╝"



# ═══════════════════════════════════

# 1. 清理 99_Meta/scripts 下的异常文件

# ═══════════════════════════════════

echo ""

echo "--- 1. 清理 scripts 目录异常文件 ---"



SCRIPTS="$ROOT/99_Meta/scripts"



# 列出当前内容

echo "当前 scripts/ 内容:"

ls -la "$SCRIPTS/"



# 删除 [!note] 文件（如果是文件）

if [[ -f "$SCRIPTS/[!note]" ]]; then

  rm -v "$SCRIPTS/[!note]"

elif [[ -d "$SCRIPTS/[!note]" ]]; then

  rm -rfv "$SCRIPTS/[!note]"

fi



# 删除 grep.app 文件（如果是文件）

if [[ -f "$SCRIPTS/grep.app" ]]; then

  rm -v "$SCRIPTS/grep.app"

elif [[ -d "$SCRIPTS/grep.app" ]]; then

  rm -rfv "$SCRIPTS/grep.app"

fi



echo "清理后 scripts/ 内容:"

ls -la "$SCRIPTS/"



# ═══════════════════════════════════

# 2. 处理合并后的原始文件残留

# ═══════════════════════════════════

echo ""

echo "--- 2. 归档合并后的原始文件 ---"



# Collocation 原始文件

for f in \

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation固定搭配.md" \

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation-的系统分类.md"; do

  if [[ -f "$f" ]]; then

    mv -v "$f" "$ROOT/04_Archive/"

    echo "  已归档: $(basename "$f")"

  fi

done



# 语域原始文件

for f in \

  "$ROOT/02_Areas/English/Style-Register/语域切换-(Register).md" \

  "$ROOT/02_Areas/English/Style-Register/语域差异.md"; do

  if [[ -f "$f" ]]; then

    mv -v "$f" "$ROOT/04_Archive/"

    echo "  已归档: $(basename "$f")"

  fi

done



# grep.app 原始文件

for f in \

  "$ROOT/02_Areas/Coding/grep.app代码搜索引擎使用策略.md" \

  "$ROOT/02_Areas/Coding/grep.app-使用策略.md" \

  "$ROOT/02_Areas/Coding/grep.app-vs-github-search.md"; do

  if [[ -f "$f" ]]; then

    mv -v "$f" "$ROOT/04_Archive/"

    echo "  已归档: $(basename "$f")"

  fi

done



# Sourcegraph 原始文件

for f in \

  "$ROOT/02_Areas/Coding/Sourcegraph-代码搜索指南.md" \

  "$ROOT/02_Areas/Coding/Sourcegraph进阶.md"; do

  if [[ -f "$f" ]]; then

    mv -v "$f" "$ROOT/04_Archive/"

    echo "  已归档: $(basename "$f")"

  fi

done



# ═══════════════════════════════════

# 3. 迁移 epub/pdf 到 90_Attachments/Books

# ═══════════════════════════════════

echo ""

echo "--- 3. 迁移 epub/pdf ---"



mkdir -p "$ROOT/90_Attachments/Books"



find "$ROOT" -type f \( -name '*.pdf' -o -name '*.epub' \) \

  -not -path '*/90_Attachments/*' \

  -not -path '*/.obsidian/*' | while IFS= read -r f; do

  mv -v "$f" "$ROOT/90_Attachments/Books/"

done



echo ""

echo "90_Attachments/Books/ 内容:"

ls -lh "$ROOT/90_Attachments/Books/" 2>/dev/null || echo "  (空)"



# ═══════════════════════════════════

# 4. Inbox 剩余文件决策

# ═══════════════════════════════════

echo ""

echo "--- 4. 处理 Inbox 剩余文件 ---"



# 可以明确归位的

declare -A inbox_map

inbox_map=(

  ["Steel-man-the-core-argument.md"]="$ROOT/02_Areas/PKM"

  ["understand-one-thing.md"]="$ROOT/02_Areas/PKM"

  ["Empirical-evidence.md"]="$ROOT/01_Projects/IELTS-Prep/Writing"

  ["formative-assessment（形成性评估）.md"]="$ROOT/01_Projects/IELTS-Prep/General"

  ["Knowledge-and-Experience.md"]="$ROOT/02_Areas/Philosophy"

  ["long-horizon-tasks.md"]="$ROOT/02_Areas/Coding"

  ["Recognizing-emotional-&-behavioral-patterns.md"]="$ROOT/02_Areas/Philosophy"

  ["Raction-and-Feedback.md"]="$ROOT/02_Areas/PKM"

  ["Stop-us-pulling-in-different-directions-and-falling-apart.md"]="$ROOT/02_Areas/Career"

  ["Be-unforgettable-to-be-valuable.md"]="$ROOT/02_Areas/Career"

  ["如何建立不求回报的深度连接.md"]="$ROOT/02_Areas/Philosophy"

  ["突破停滞：圆圈图学习与成长指南——区分"引力问题"与"可控变量".md"]="$ROOT/02_Areas/PKM"

  ["Archive在线搜索技巧-在线音频.md"]="$ROOT/03_Resources/Tools"

)



for fname in "${(@k)inbox_map}"; do

  src="$ROOT/00_Inbox/$fname"

  dst="${inbox_map[$fname]}"

  if [[ -f "$src" ]]; then

    mv -v "$src" "$dst/"

  fi

done



# ═══════════════════════════════════

# 5. 最终统计

# ═══════════════════════════════════

echo ""

echo "═══════════════════════════════"

echo "📊 最终统计"

echo ""

echo "Inbox 剩余: $(find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' | wc -l) 个"

echo "Archive 总数: $(find "$ROOT/04_Archive" -name '*.md' | wc -l) 个"

echo "Books 附件: $(ls "$ROOT/90_Attachments/Books/" 2>/dev/null | wc -l) 个"

echo ""

echo "各区域文件数:"

for dir in "$ROOT"/0[0-9]_*/; do

  count=$(find "$dir" -name '*.md' | wc -l)

  printf "  %-35s %d\n" "$(basename "$dir")" "$count"

done

echo "═══════════════════════════════"

