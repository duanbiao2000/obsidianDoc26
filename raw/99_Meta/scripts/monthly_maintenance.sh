
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"

TODAY=$(date +%Y-%m-%d)

MONTH=$(date +%Y-%m)



echo "╔══════════════════════════════════════╗"

echo "║   知识库月度维护 — $MONTH           ║"

echo "╚══════════════════════════════════════╝"



# ───────────────────────────────────

# Step 1: 全库备份

# ───────────────────────────────────

echo ""

echo "【1/6】全库备份"

BACKUP_DIR="/mnt/d/MyDocs"

BACKUP_FILE="obsidianDoc26_monthly_${MONTH}.tar.gz"



tar -czf "$BACKUP_DIR/$BACKUP_FILE" \

  -C "$BACKUP_DIR" obsidianDoc26/ \

  --exclude='.obsidian' \

  --exclude='.git' \

  --exclude='node_modules' \

  --exclude='obsidianDoc26_*.tar.gz' \

  2>/dev/null



if [[ -f "$BACKUP_DIR/$BACKUP_FILE" ]]; then

  size=$(du -h "$BACKUP_DIR/$BACKUP_FILE" | cut -f1)

  echo "  ✅ 备份完成: $BACKUP_FILE ($size)"

else

  echo "  ❌ 备份失败"

fi



# 清理3个月前的月度备份

find "$BACKUP_DIR" -name 'obsidianDoc26_monthly_*.tar.gz' -mtime +90 | while IFS= read -r f; do

  echo "  🗑️  清理旧备份: $(basename "$f")"

  rm "$f"

done



# ───────────────────────────────────

# Step 2: Archive 审查

# ───────────────────────────────────

echo ""

echo "【2/6】Archive 审查（文件数量）"

archive_count=$(find "$ROOT/04_Archive" -name '*.md' | wc -l)

echo "  当前 Archive: $archive_count 个文件"

echo ""

echo "  最老的20个文件（考虑永久删除）:"

find "$ROOT/04_Archive" -name '*.md' -printf '%T+ %f\n' 2>/dev/null \

  | sort | head -20 | sed 's/^/    /'



# ───────────────────────────────────

# Step 3: 空文件清理

# ───────────────────────────────────

echo ""

echo "【3/6】清理空文件"

empty_count=0

find "$ROOT" -name '*.md' -empty -not -path '*/.obsidian/*' | while IFS= read -r f; do

  echo "  🗑️  $(echo "$f" | sed "s|$ROOT/||")"

  rm "$f"

  ((empty_count++))

done

echo "  共清理: ${empty_count} 个空文件"



# ───────────────────────────────────

# Step 4: 补全缺失 frontmatter

# ───────────────────────────────────

echo ""

echo "【4/6】补全缺失 frontmatter"

count_added=0



find "$ROOT" -name '*.md' \

  -not -path '*/.obsidian/*' \

  -not -path '*/90_Attachments/*' | while IFS= read -r f; do



  first_line=$(head -1 "$f" 2>/dev/null)

  [[ "$first_line" == "---" ]] && continue



  created=$(stat -c '%y' "$f" 2>/dev/null | cut -d' ' -f1)

  [[ -z "$created" ]] && created=$(date +%Y-%m-%d)



  tag=""

  case "$f" in

    *IELTS-Prep/Speaking*)   tag="ielts, speaking" ;;

    *IELTS-Prep/Writing*)    tag="ielts, writing" ;;

    *IELTS-Prep/Listening*)  tag="ielts, listening" ;;

    *IELTS-Prep/Reading*)    tag="ielts, reading" ;;

    *IELTS-Prep/Vocabulary*) tag="ielts, vocabulary" ;;

    *IELTS-Prep/Grammar*)    tag="ielts, grammar" ;;

    *IELTS-Prep/General*)    tag="ielts" ;;

    *Areas/Coding*)          tag="coding" ;;

    *English/Expression*)    tag="english, expression" ;;

    *English/Pronunciation*) tag="english, pronunciation" ;;

    *English/Style-Register*)tag="english, register" ;;

    *English/TED*)           tag="english, ted" ;;

    *Philosophy*)            tag="philosophy" ;;

    *PKM*)                   tag="pkm" ;;

    *Career*)                tag="career" ;;

    *transcript*)            tag="transcript" ;;

    *Research/books*)        tag="books" ;;

    *Research/Travel*)       tag="travel" ;;

    *Tools*)                 tag="tools" ;;

    *Prompts*/Knowledge*)    tag="prompt, KM" ;;

    *Prompts*/Thinking*)     tag="prompt, TH" ;;

    *Prompts*/Writing*)      tag="prompt, WR" ;;

    *Prompts*/Role-Play*)    tag="prompt, RL" ;;

    *Prompts*/Tech-Dev*)     tag="prompt, TD" ;;

    *Prompts*/Learning*)     tag="prompt, LR" ;;

    *Journals/Daily*)        tag="journal, daily" ;;

    *Journals/Reflection*)   tag="journal, reflection" ;;

    *Archive*)               tag="archive" ;;

    *00_Inbox*)              tag="inbox" ;;

    *)                       tag="" ;;

  esac



  tmpfile=$(mktemp)

  printf '%s\n' "---" > "$tmpfile"

  printf 'tags: [%s]\n' "$tag" >> "$tmpfile"

  printf 'created: %s\n' "$created" >> "$tmpfile"

  printf '%s\n' "---" >> "$tmpfile"

  printf '\n' >> "$tmpfile"

  cat "$f" >> "$tmpfile"

  mv "$tmpfile" "$f"

  ((count_added++))

done



echo "  ✅ 补全 frontmatter: ${count_added} 个文件"



# ───────────────────────────────────

# Step 5: 重复文件检测

# ───────────────────────────────────

echo ""

echo "【5/6】重复文件检测（同名文件）"

echo "  以下文件名在不同目录中重复出现:"

find "$ROOT" -name '*.md' -not -path '*/.obsidian/*' \

  -not -path '*/04_Archive/*' \

  | xargs -I{} basename {} \

  | sort | uniq -d \

  | while IFS= read -r name; do

    echo ""

    echo "  📄 $name"

    find "$ROOT" -name "$name" \

      -not -path '*/.obsidian/*' \

      | sed "s|$ROOT/||" | sed 's/^/      /'

  done



# ───────────────────────────────────

# Step 6: 重建 MOC + 更新快照

# ───────────────────────────────────

echo ""

echo "【6/6】重建 MOC"

zsh "$ROOT/99_Meta/regenerate-mocs.sh"



find "$ROOT" -not -path '*/.obsidian/*' \

  | sort > "$ROOT/99_Meta/pathtree.txt"

echo "  ✅ pathtree.txt 已更新"



# ───────────────────────────────────

# 月度总结

# ───────────────────────────────────

echo ""

echo "╔══════════════════════════════════════╗"

echo "║   月度维护完成 — $MONTH             ║"

echo "║                                      ║"

echo "║   手动待办：                          ║"

echo "║   □ 审查 Archive 最老文件，决定删除   ║"

echo "║   □ 检查重复文件列表，决定合并/删除   ║"

echo "║   □ 回顾本月 Reflection，提炼精华     ║"

echo "║   □ 评估各 Project 是否仍活跃        ║"

echo "╚══════════════════════════════════════╝"

