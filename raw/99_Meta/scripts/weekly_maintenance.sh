
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"

TODAY=$(date +%Y-%m-%d)

WEEK=$(date +%Y-W%V)



echo "╔══════════════════════════════════════╗"

echo "║   知识库周度维护 — $WEEK            ║"

echo "╚══════════════════════════════════════╝"



# ───────────────────────────────────

# Step 1: 重建所有 MOC

# ───────────────────────────────────

echo ""

echo "【1/5】重建 MOC..."

zsh "$ROOT/99_Meta/regenerate-mocs.sh"



# ───────────────────────────────────

# Step 2: Inbox 状态报告

# ───────────────────────────────────

echo ""

echo "【2/5】Inbox 状态"

echo "───────────────────────────────"

inbox_count=$(find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' | wc -l)

echo "  当前文件数: $inbox_count"



if (( inbox_count > 15 )); then

  echo "  ⚠️  超过阈值 15，需要分流："

  find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' \

    -exec basename {} \; | sort | sed 's/^/    /'

elif (( inbox_count > 0 )); then

  echo "  ✅ 在阈值内，当前文件："

  find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' \

    -exec basename {} \; | sort | sed 's/^/    /'

else

  echo "  🎉 Inbox 已清零"

fi



# ───────────────────────────────────

# Step 3: 本周新增笔记统计

# ───────────────────────────────────

echo ""

echo "【3/5】本周新增/修改（近7天）"

echo "───────────────────────────────"

find "$ROOT" -name '*.md' \

  -not -path '*/.obsidian/*' \

  -not -path '*/04_Archive/*' \

  -newer "$ROOT/99_Meta/pathtree.txt" \

  2>/dev/null | while IFS= read -r f; do

  printf "  %s  %s\n" \

    "$(date -r "$f" +%m-%d 2>/dev/null || stat -c %y "$f" | cut -c6-10)" \

    "$(echo "$f" | sed "s|$ROOT/||")"

done | sort | tail -20



echo ""

echo "  本周新增总数: $(find "$ROOT" -name '*.md' \

  -not -path '*/.obsidian/*' \

  -not -path '*/04_Archive/*' \

  -newer "$ROOT/99_Meta/pathtree.txt" 2>/dev/null | wc -l) 个"



# ───────────────────────────────────

# Step 4: 健康检查

# ───────────────────────────────────

echo ""

echo "【4/5】健康检查"

echo "───────────────────────────────"



total=$(find "$ROOT" -name '*.md' -not -path '*/.obsidian/*' | wc -l)

no_fm=$(find "$ROOT" -name '*.md' -not -path '*/.obsidian/*' | while IFS= read -r f; do

  [[ "$(head -1 "$f" 2>/dev/null)" != "---" ]] && echo 1

done | wc -l)

empty=$(find "$ROOT" -name '*.md' -empty | wc -l)

archive=$(find "$ROOT/04_Archive" -name '*.md' | wc -l)



echo "  总 md 文件数    : $total"

echo "  缺少 frontmatter: $no_fm"

echo "  空文件          : $empty"

echo "  Archive 总数    : $archive"

echo ""

echo "  各区域文件数:"

for dir in \

  "$ROOT/00_Inbox" \

  "$ROOT/01_Projects" \

  "$ROOT/02_Areas" \

  "$ROOT/03_Resources" \

  "$ROOT/04_Archive" \

  "$ROOT/05_Journals" \

  "$ROOT/20_Prompts" \

  "$ROOT/30_WIKI"; do

  [[ -d "$dir" ]] || continue

  count=$(find "$dir" -name '*.md' | wc -l)

  name=$(basename "$dir")

  bar=$(printf '█%.0s' $(seq 1 $((count / 10 + 1))))

  printf "    %-20s %4d  %s\n" "$name" "$count" "$bar"

done



# ───────────────────────────────────

# Step 5: 更新 pathtree.txt（作为时间戳基准）

# ───────────────────────────────────

echo ""

echo "【5/5】更新目录快照"

find "$ROOT" -not -path '*/.obsidian/*' -not -path '*/node_modules/*' \

  | sort > "$ROOT/99_Meta/pathtree.txt"

echo "  ✅ pathtree.txt 已更新（$TODAY）"



# ───────────────────────────────────

# 周度总结

# ───────────────────────────────────

echo ""

echo "╔══════════════════════════════════════╗"

echo "║   周度维护完成                        ║"

echo "║                                      ║"

echo "║   接下来请手动完成：                   ║"

echo "║   □ 写一条本周 Reflection             ║"

echo "║   □ 处理 Inbox 超出的文件             ║"

echo "║   □ 给本周笔记补充 frontmatter        ║"

echo "╚══════════════════════════════════════╝"

