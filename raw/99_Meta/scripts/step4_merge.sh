
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"



echo "╔═══════════════════════════════╗"

echo "║  第四步：合并重复笔记           ║"

echo "╚═══════════════════════════════╝"



# 通用合并函数

merge_files() {

  local target="$1"

  local tag="$2"

  local title="$3"

  shift 3

  local sources=("$@")



  # 写 frontmatter

  printf '%s\n' "---" > "$target"

  printf '%s\n' "tags: [$tag]" >> "$target"

  printf '%s\n' "created: $(date +%Y-%m-%d)" >> "$target"

  printf '%s\n' "merged_from:" >> "$target"

  for s in "${sources[@]}"; do

    printf '%s\n' "  - $(basename "$s" .md)" >> "$target"

  done

  printf '%s\n' "---" >> "$target"

  printf '\n%s\n\n---\n' "# $title" >> "$target"



  # 逐个追加内容

  for s in "${sources[@]}"; do

    if [[ -f "$s" ]]; then

      printf '\n## 来源: %s\n\n' "$(basename "$s" .md)" >> "$target"

      awk 'BEGIN{skip=0} /^---$/{skip++; if(skip<=2) next} skip>=2{print}' "$s" >> "$target"

      mv -v "$s" "$ROOT/04_Archive/"

    fi

  done

}



# 组1: grep.app

echo ""

echo "--- 组1: grep.app 合并 ---"

merge_files \

  "$ROOT/02_Areas/Coding/grep.app搜索指南.md" \

  "coding, tools, search" \

  "grep.app 代码搜索指南" \

  "$ROOT/02_Areas/Coding/grep.app代码搜索引擎使用策略.md" \

  "$ROOT/02_Areas/Coding/grep.app-使用策略.md" \

  "$ROOT/02_Areas/Coding/grep.app-vs-github-search.md"

echo "✅ grep.app 合并完成"



# 组2: Sourcegraph

echo ""

echo "--- 组2: Sourcegraph 合并 ---"

merge_files \

  "$ROOT/02_Areas/Coding/Sourcegraph搜索指南.md" \

  "coding, tools, search" \

  "Sourcegraph 代码搜索指南" \

  "$ROOT/02_Areas/Coding/Sourcegraph-代码搜索指南.md" \

  "$ROOT/02_Areas/Coding/Sourcegraph进阶.md"

echo "✅ Sourcegraph 合并完成"



# 组3: Collocation

echo ""

echo "--- 组3: Collocation 合并 ---"

merge_files \

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation搭配系统.md" \

  "ielts, vocabulary, collocation" \

  "Collocation 搭配系统" \

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation固定搭配.md" \

  "$ROOT/01_Projects/IELTS-Prep/Vocabulary/Collocation-的系统分类.md"

echo "✅ Collocation 合并完成"



# 组4: 语域

echo ""

echo "--- 组4: 语域合并 ---"

merge_files \

  "$ROOT/02_Areas/English/Style-Register/语域系统.md" \

  "english, register, style" \

  "语域系统 (Register)" \

  "$ROOT/02_Areas/English/Style-Register/语域切换-(Register).md" \

  "$ROOT/02_Areas/English/Style-Register/语域差异.md"

echo "✅ 语域合并完成"



# 组5: 纽约客 — 添加互链

echo ""

echo "--- 组5: 纽约客互链 ---"

see_also='



---



## See Also — 纽约客系列

- [[纽约客风格]] — 口语角度

- [[纽约客_既聪明又诚实的气质]] — 表达角度

- [[聪明且诚实表达示例]] — 实例

- [[纽约客写作风格]] — 写作角度

'



for f in \

  "$ROOT/01_Projects/IELTS-Prep/Speaking/纽约客风格.md" \

  "$ROOT/02_Areas/English/Expression/纽约客_既聪明又诚实的气质.md" \

  "$ROOT/02_Areas/English/Expression/聪明且诚实表达示例.md" \

  "$ROOT/01_Projects/IELTS-Prep/Writing/纽约客写作风格.md"; do

  if [[ -f "$f" ]]; then

    if ! grep -q "See Also — 纽约客系列" "$f" 2>/dev/null; then

      printf '%s' "$see_also" >> "$f"

      echo "  ✅ 已添加互链: $(basename "$f")"

    else

      echo "  ⏭️ 已有互链: $(basename "$f")"

    fi

  else

    echo "  ⚠️ 文件不存在: $f"

  fi

done



# 组6: 认知偏差 — 添加互链

echo ""

echo "--- 组6: 认知偏差互链 ---"

bias_see='



---



## See Also

- [[认知偏差列表]] — 系统化列表

- [[认知偏差-村上春树风格]] — 文学化表达

'



for f in \

  "$ROOT/02_Areas/PKM/认知偏差列表.md" \

  "$ROOT/02_Areas/PKM/认知偏差-村上春树风格.md"; do

  if [[ -f "$f" ]]; then

    if ! grep -q "See Also" "$f" 2>/dev/null; then

      printf '%s' "$bias_see" >> "$f"

      echo "  ✅ 已添加互链: $(basename "$f")"

    else

      echo "  ⏭️ 已有互链: $(basename "$f")"

    fi

  else

    echo "  ⚠️ 文件不存在: $f"

  fi

done



echo ""

echo "═══════════════════════════════"

echo "✅ 第四步完成"

echo "═══════════════════════════════"

