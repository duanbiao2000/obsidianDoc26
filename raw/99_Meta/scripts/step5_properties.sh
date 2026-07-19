
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"



echo "╔═══════════════════════════════╗"

echo "║  第五步：Properties + 二进制    ║"

echo "╚═══════════════════════════════╝"



# ═══════════════════════════════════

# Part A: 批量添加 frontmatter

# ═══════════════════════════════════

echo ""

echo "=== Part A: 添加缺失的 frontmatter ==="



count_added=0

count_skipped=0



while IFS= read -r f; do

  first_line=$(head -1 "$f" 2>/dev/null)

  if [[ "$first_line" == "---" ]]; then

    ((count_skipped++))

    continue

  fi



  # 获取文件修改日期

  created=$(stat -c '%y' "$f" 2>/dev/null | cut -d' ' -f1)

  [[ -z "$created" ]] && created=$(date +%Y-%m-%d)



  # 根据路径推断 tags

  tag=""

  case "$f" in

    *IELTS-Prep/Speaking*)     tag="ielts, speaking" ;;

    *IELTS-Prep/Writing*)      tag="ielts, writing" ;;

    *IELTS-Prep/Listening*)    tag="ielts, listening" ;;

    *IELTS-Prep/Reading*)      tag="ielts, reading" ;;

    *IELTS-Prep/Vocabulary*)   tag="ielts, vocabulary" ;;

    *IELTS-Prep/Grammar*)      tag="ielts, grammar" ;;

    *IELTS-Prep/General*)      tag="ielts" ;;

    *Anki-Cards*)              tag="anki" ;;

    *Software-Dev*)            tag="software-dev" ;;

    *道德经*)                   tag="philosophy, 道德经" ;;

    *Areas/Coding*)            tag="coding" ;;

    *English/Expression*)      tag="english, expression" ;;

    *English/Pronunciation*)   tag="english, pronunciation" ;;

    *English/Style-Register*)  tag="english, register" ;;

    *English/TED*)             tag="english, ted" ;;

    *Philosophy*)              tag="philosophy" ;;

    *PKM*)                     tag="pkm" ;;

    *Career*)                  tag="career" ;;

    *transcript*)              tag="transcript" ;;

    *Research/books*)          tag="books" ;;

    *Research/Economics*)       tag="economics" ;;

    *Research/People*)         tag="people" ;;

    *Research/Travel*)         tag="travel" ;;

    *Research/youtube*)        tag="youtube" ;;

    *Tools*)                   tag="tools" ;;

    *Prompts*/Knowledge*)      tag="prompt, KM" ;;

    *Prompts*/Thinking*)       tag="prompt, TH" ;;

    *Prompts*/Writing*)        tag="prompt, WR" ;;

    *Prompts*/Role-Play*)      tag="prompt, RL" ;;

    *Prompts*/Tech-Dev*)       tag="prompt, TD" ;;

    *Prompts*/Learning*)       tag="prompt, LR" ;;

    *Prompts*/Meta*)           tag="prompt, meta" ;;

    *Prompts*/MISC*)           tag="prompt, misc" ;;

    *Prompts*/Data-Analysis*)  tag="prompt, data" ;;

    *Prompts*)                 tag="prompt" ;;

    *Journals/Daily*)          tag="journal, daily" ;;

    *Journals/Reflection*)     tag="journal, reflection" ;;

    *Templates*)               tag="template" ;;

    *WIKI/Dataview*)           tag="dataview" ;;

    *WIKI/OKF*)                tag="okf" ;;

    *Archive*)                 tag="archive" ;;

    *00_Inbox*)                tag="inbox" ;;

  esac



  # 写入

  tmpfile=$(mktemp)

  printf '%s\n' "---" > "$tmpfile"

  if [[ -n "$tag" ]]; then

    printf '%s\n' "tags: [$tag]" >> "$tmpfile"

  else

    printf '%s\n' "tags: []" >> "$tmpfile"

  fi

  printf '%s\n' "created: $created" >> "$tmpfile"

  printf '%s\n' "---" >> "$tmpfile"

  printf '\n' >> "$tmpfile"

  cat "$f" >> "$tmpfile"

  mv "$tmpfile" "$f"

  ((count_added++))



done < <(find "$ROOT" -name '*.md' \

  -not -path '*/.obsidian/*' \

  -not -path '*/node_modules/*' \

  -not -path '*30_WIKI/Excalidraw/Scripts/*')



echo "✅ 添加 frontmatter: ${count_added} 个文件"

echo "⏭️ 已有 frontmatter: ${count_skipped} 个文件"



# ═══════════════════════════════════

# Part B: 二进制文件集中

# ═══════════════════════════════════

echo ""

echo "=== Part B: PDF/EPUB 迁移 ==="



mkdir -p "$ROOT/90_Attachments/Books"



find "$ROOT" -type f \( -name '*.pdf' -o -name '*.epub' \) \

  -not -path '*/90_Attachments/*' | while IFS= read -r f; do

  mv -v "$f" "$ROOT/90_Attachments/Books/"

done



echo ""

echo "✅ 二进制文件迁移完成"

ls -lh "$ROOT/90_Attachments/Books/" 2>/dev/null



echo ""

echo "═══════════════════════════════"

echo "✅ 第五步完成"

echo "═══════════════════════════════"

