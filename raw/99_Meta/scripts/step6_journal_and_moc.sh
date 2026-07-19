
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"

TODAY=$(date +%Y-%m-%d)



echo "╔═══════════════════════════════╗"

echo "║  第六步：Journal MOC + 自动化   ║"

echo "╚═══════════════════════════════╝"



# ═══════════════════════════════════

# Part A: Journal MOC

# ═══════════════════════════════════



# 用 printf 写文件，避免 heredoc 嵌套问题

{

printf '%s\n' '---'

printf '%s\n' 'tags: [moc, journal]'

printf '%s\n' "created: $TODAY"

printf '%s\n' '---'

printf '\n'

printf '%s\n' '# 📓 日志与反思 MOC'

printf '\n'

printf '%s\n' '## 最近日志'

printf '\n'

printf '%s\n' '```dataview'

printf '%s\n' 'TABLE file.cday as "创建日期"'

printf '%s\n' 'FROM "05_Journals/Daily"'

printf '%s\n' 'SORT file.name DESC'

printf '%s\n' 'LIMIT 30'

printf '%s\n' '```'

printf '\n'

printf '%s\n' '## 反思记录'

printf '\n'

printf '%s\n' '```dataview'

printf '%s\n' 'LIST'

printf '%s\n' 'FROM "05_Journals/Reflection"'

printf '%s\n' 'SORT file.name DESC'

printf '%s\n' '```'

printf '\n'

printf '%s\n' '## 本周新增'

printf '\n'

printf '%s\n' '```dataview'

printf '%s\n' 'LIST'

printf '%s\n' 'FROM "05_Journals"'

printf '%s\n' 'WHERE file.cday >= date(today) - dur(7 days)'

printf '%s\n' 'SORT file.cday DESC'

printf '%s\n' '```'

printf '\n'

printf '%s\n' '---'

printf '\n'

printf '%s\n' '> [!tip] 周日回顾流程'

printf '%s\n' '> 1. 扫一遍本周 Daily，标记有价值段落'

printf '%s\n' '> 2. 将可复用内容提取到对应 Area'

printf '%s\n' '> 3. 在 Reflection 写一条周总结'

} > "$ROOT/05_Journals/MOC-Journals.md"



echo "✅ Journal MOC 创建完成"



# ═══════════════════════════════════

# Part B: MOC 自动生成器

# ═══════════════════════════════════



MOC_SCRIPT="$ROOT/99_Meta/regenerate-mocs.sh"



# 用函数写 MOC 文件，避免所有 heredoc 问题

cat > "$MOC_SCRIPT" << 'REGEN_EOF'

#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"

TODAY=$(date +%Y-%m-%d)



echo "🔄 开始重建 MOC..."



# 通用 MOC 生成函数

# 参数: $1=文件路径 $2=标题 $3=tags $4=查询目录 $5=额外内容(可选)

write_simple_moc() {

  local file="$1" title="$2" tags="$3" query_dir="$4" extra="$5"

  local self_name=$(basename "$file" .md)



  {

    printf '%s\n' '---'

    printf 'tags: [%s]\n' "$tags"

    printf 'created: 2026-06-26\n'

    printf 'updated: %s\n' "$TODAY"

    printf '%s\n' '---'

    printf '\n# %s\n\n' "$title"

    printf '%s\n' '```dataview'

    printf '%s\n' "TABLE created, tags"

    printf 'FROM "%s"\n' "$query_dir"

    printf 'WHERE file.name != "%s"\n' "$self_name"

    printf '%s\n' 'SORT file.name ASC'

    printf '%s\n' '```'

    if [[ -n "$extra" ]]; then

      printf '\n%s\n' "$extra"

    fi

  } > "$file"



  echo "  ✅ $(basename "$file")"

}



# 多目录 MOC 生成函数（用 LIST 查询多个子目录）

write_multi_moc() {

  local file="$1" title="$2" tags="$3"

  shift 3

  # 剩余参数: "标签|目录" 对

  local self_name=$(basename "$file" .md)



  {

    printf '%s\n' '---'

    printf 'tags: [%s]\n' "$tags"

    printf 'created: 2026-06-26\n'

    printf 'updated: %s\n' "$TODAY"

    printf '%s\n' '---'

    printf '\n# %s\n' "$title"

  } > "$file"



  for pair in "$@"; do

    local label="${pair%%|*}"

    local dir="${pair##*|}"

    {

      printf '\n## %s\n\n' "$label"

      printf '%s\n' '```dataview'

      printf '%s\n' 'LIST'

      printf 'FROM "%s"\n' "$dir"

      printf '%s\n' 'SORT file.name ASC'

      printf '%s\n' '```'

    } >> "$file"

  done



  echo "  ✅ $(basename "$file")"

}



# ───────────────────────────────────

# HOME.md

# ───────────────────────────────────

{

printf '%s\n' '---'

printf '%s\n' 'tags: [moc, home]'

printf '%s\n' 'created: 2026-06-26'

printf 'updated: %s\n' "$TODAY"

printf '%s\n' 'aliases: [主页, Dashboard]'

printf '%s\n' '---'

printf '\n%s\n' '# 🏠 知识库导航'

printf '\n%s\n' '## 🔥 活跃项目'

printf '%s\n' '- [[01_Projects/IELTS-Prep/MOC-IELTS|🎯 雅思备考]]'

printf '%s\n' '- [[01_Projects/Anki-Cards/MOC-Anki|🃏 Anki 卡片]]'

printf '%s\n' '- [[01_Projects/Software-Dev/MOC-Software-Dev|💻 软件开发]]'

printf '%s\n' '- [[01_Projects/道德经/MOC-道德经|☯ 道德经]]'

printf '\n%s\n' '## 🌱 持续领域'

printf '%s\n' '- [[02_Areas/Coding/MOC-Coding|⚙️ 编程与技术]]'

printf '%s\n' '- [[02_Areas/English/MOC-English|🗣️ 英语提升]]'

printf '%s\n' '- [[02_Areas/Philosophy/MOC-Philosophy|🧘 哲学与心性]]'

printf '%s\n' '- [[02_Areas/PKM/MOC-PKM|📝 知识管理]]'

printf '%s\n' '- [[02_Areas/Career/MOC-Career|💼 职业发展]]'

printf '\n%s\n' '## 📚 资源库'

printf '%s\n' '- [[03_Resources/Research/People/MOC-People|👤 人物笔记]]'

printf '%s\n' '- [[03_Resources/Research/books/MOC-Books|📖 书籍]]'

printf '%s\n' '- [[03_Resources/Research/Travel/MOC-Travel|✈️ 旅行]]'

printf '%s\n' '- [[03_Resources/Tools/MOC-Tools|🔧 工具箱]]'

printf '\n%s\n' '## ⚡ 速查'

printf '%s\n' '- [[30_WIKI/QuickRef/IELTS-Speaking-速查]]'

printf '%s\n' '- [[30_WIKI/QuickRef/IELTS-Writing-速查]]'

printf '%s\n' '- [[30_WIKI/QuickRef/Coding-命令速查]]'

printf '%s\n' '- [[30_WIKI/QuickRef/Prompt-速查]]'

printf '%s\n' '- [[30_WIKI/QuickRef/English-Expression-速查]]'

printf '\n%s\n' '## 📊 仪表板'

printf '%s\n' '- [[30_WIKI/Dataview/总览仪表板]]'

printf '%s\n' '- [[05_Journals/MOC-Journals|📓 日志]]'

printf '%s\n' '- [[30_WIKI/OKF/00_okf_bundle_index|OKF 概念]]'

printf '\n%s\n' '## 📥 Inbox'

printf '\n%s\n' '```dataview'

printf '%s\n' 'LIST'

printf '%s\n' 'FROM "00_Inbox"'

printf '%s\n' 'SORT file.mtime DESC'

printf '%s\n' 'LIMIT 10'

printf '%s\n' '```'

} > "$ROOT/HOME.md"

echo "  ✅ HOME.md"



# ───────────────────────────────────

# MOC-IELTS.md

# ───────────────────────────────────

write_multi_moc "$ROOT/01_Projects/IELTS-Prep/MOC-IELTS.md" \

  "🎯 IELTS 备考 MOC" "moc, ielts" \

  "🗣️ Speaking|01_Projects/IELTS-Prep/Speaking" \

  "✍️ Writing|01_Projects/IELTS-Prep/Writing" \

  "👂 Listening|01_Projects/IELTS-Prep/Listening" \

  "📖 Reading|01_Projects/IELTS-Prep/Reading" \

  "📝 Vocabulary|01_Projects/IELTS-Prep/Vocabulary" \

  "📐 Grammar|01_Projects/IELTS-Prep/Grammar" \

  "🎯 General|01_Projects/IELTS-Prep/General"



# 追加速查入口

{

printf '\n%s\n' '## ⚡ 速查入口'

printf '%s\n' '- [[30_WIKI/QuickRef/IELTS-Speaking-速查]]'

printf '%s\n' '- [[30_WIKI/QuickRef/IELTS-Writing-速查]]'

} >> "$ROOT/01_Projects/IELTS-Prep/MOC-IELTS.md"



# ───────────────────────────────────

# 简单 MOC（单目录查询）

# ───────────────────────────────────

write_simple_moc "$ROOT/02_Areas/Coding/MOC-Coding.md" \

  "⚙️ 编程与技术 MOC" "moc, coding" "02_Areas/Coding" \

  "## 相关

- [[01_Projects/Software-Dev/MOC-Software-Dev]]

- [[30_WIKI/QuickRef/Coding-命令速查]]"



write_simple_moc "$ROOT/02_Areas/Philosophy/MOC-Philosophy.md" \

  "🧘 哲学与心性 MOC" "moc, philosophy" "02_Areas/Philosophy" \

  "## 道德经专题

- [[01_Projects/道德经/MOC-道德经]]"



write_simple_moc "$ROOT/02_Areas/PKM/MOC-PKM.md" \

  "📝 知识管理 MOC" "moc, pkm" "02_Areas/PKM"



write_simple_moc "$ROOT/02_Areas/Career/MOC-Career.md" \

  "💼 职业发展 MOC" "moc, career" "02_Areas/Career"



write_simple_moc "$ROOT/03_Resources/Research/People/MOC-People.md" \

  "👤 人物笔记 MOC" "moc, people" "03_Resources/Research/People"



write_simple_moc "$ROOT/03_Resources/Research/books/MOC-Books.md" \

  "📖 书籍笔记 MOC" "moc, books" "03_Resources/Research/books"



write_simple_moc "$ROOT/03_Resources/Tools/MOC-Tools.md" \

  "🔧 工具箱 MOC" "moc, tools" "03_Resources/Tools"



write_simple_moc "$ROOT/01_Projects/Anki-Cards/MOC-Anki.md" \

  "🃏 Anki 卡片 MOC" "moc, anki" "01_Projects/Anki-Cards" \

  "## 相关提示词

- [[20_Prompts/copilot/custom/FSRS增强版Anki抽认卡生成器]]

- [[20_Prompts/copilot/custom/Learning/LR-Anki闪卡生成器和知识萃取专家_Flashcards插件版]]

- [[20_Prompts/copilot/custom/Learning/LR-Obsidian2Anki题目生成]]"



write_simple_moc "$ROOT/01_Projects/道德经/MOC-道德经.md" \

  "☯ 道德经专题 MOC" "moc, 道德经, philosophy" "01_Projects/道德经"



write_simple_moc "$ROOT/01_Projects/Software-Dev/MOC-Software-Dev.md" \

  "💻 软件开发项目 MOC" "moc, software-dev" "01_Projects/Software-Dev" \

  "## 相关

- [[02_Areas/Coding/MOC-Coding|→ 编程与技术 MOC]]"



# ───────────────────────────────────

# MOC-English.md（多子目录）

# ───────────────────────────────────

write_multi_moc "$ROOT/02_Areas/English/MOC-English.md" \

  "🗣️ 英语提升 MOC" "moc, english" \

  "Expression / 表达|02_Areas/English/Expression" \

  "Pronunciation / 发音|02_Areas/English/Pronunciation" \

  "Style & Register / 风格与语域|02_Areas/English/Style-Register" \

  "TED 提取|02_Areas/English/TED-Extraction" \

  "Transcript|02_Areas/transcript"



{

printf '\n%s\n' '## ⚡ 速查'

printf '%s\n' '- [[30_WIKI/QuickRef/English-Expression-速查]]'

} >> "$ROOT/02_Areas/English/MOC-English.md"



# ───────────────────────────────────

# MOC-Travel.md

# ───────────────────────────────────

write_simple_moc "$ROOT/03_Resources/Research/Travel/MOC-Travel.md" \

  "✈️ 旅行内容 MOC" "moc, travel" "03_Resources/Research/Travel" \

  "## 模板

- [[10_Templates/环球旅行口播稿模板]]"



# ───────────────────────────────────

echo ""

echo "═══════════════════════════════"

echo "🔄 所有 MOC 重建完成 ($TODAY)"

echo "═══════════════════════════════"

REGEN_EOF



chmod +x "$MOC_SCRIPT"

echo "✅ MOC 生成器已保存: $MOC_SCRIPT"



# 首次执行

echo ""

zsh "$MOC_SCRIPT"



# ═══════════════════════════════════

# Part C: Shell Alias

# ═══════════════════════════════════

echo ""

echo "=== Part C: 添加 Shell 快捷方式 ==="



ALIAS_BLOCK='

# === Obsidian 知识库自动化 ===

export OBS_ROOT="/mnt/d/MyDocs/obsidianDoc26"

alias obsregen="zsh \$OBS_ROOT/99_Meta/regenerate-mocs.sh"

alias obsinbox="echo \"📥 Inbox: \$(find \$OBS_ROOT/00_Inbox -maxdepth 1 -name *.md | wc -l) 个文件\" && find \$OBS_ROOT/00_Inbox -maxdepth 1 -name *.md -exec basename {} \; | sort | head -15"

alias obshealth="echo \"总文件: \$(find \$OBS_ROOT -name *.md -not -path */.obsidian/* | wc -l)\" && echo \"Inbox: \$(find \$OBS_ROOT/00_Inbox -maxdepth 1 -name *.md | wc -l)\" && echo \"空文件: \$(find \$OBS_ROOT -name *.md -empty | wc -l)\""

alias obstree="find \$OBS_ROOT -maxdepth 2 -type d -not -path */.obsidian/* | sort | sed s:\$OBS_ROOT/::"

'



if ! grep -q "Obsidian 知识库自动化" ~/.zshrc 2>/dev/null; then

  printf '%s\n' "$ALIAS_BLOCK" >> ~/.zshrc

  echo "✅ Alias 已添加到 ~/.zshrc"

  echo "   运行 source ~/.zshrc 生效"

else

  echo "⏭️ Alias 已存在，跳过"

fi



echo ""

echo "╔═══════════════════════════════════════════╗"

echo "║  全部完成！                                ║"

echo "║                                           ║"

echo "║  可用命令（source ~/.zshrc 后）:             ║"

echo "║    obsregen   — 重建所有 MOC               ║"

echo "║    obsinbox   — 查看 Inbox 状态            ║"

echo "║    obshealth  — 知识库健康检查              ║"

echo "║    obstree    — 查看目录结构                ║"

echo "╚═══════════════════════════════════════════╝"

