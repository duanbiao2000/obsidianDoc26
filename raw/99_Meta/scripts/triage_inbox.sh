
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"



echo "📥 Inbox 分流助手"

echo ""



# 列出所有 Inbox 文件 + 前3行预览

find "$ROOT/00_Inbox" -maxdepth 1 -name '*.md' | sort | while IFS= read -r f; do

  name=$(basename "$f")

  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

  echo "📄 $name"

  echo "   预览:"

  head -5 "$f" 2>/dev/null | grep -v '^---' | grep -v '^$' \

    | head -3 | sed 's/^/   /'

  echo ""

  echo "   目标选项:"

  echo "   [c] Coding    [p] PKM       [e] English"

  echo "   [h] Philosophy [r] Career   [i] IELTS"

  echo "   [a] Archive   [s] Speaking  [w] Writing"

  echo "   [skip] 跳过"

  echo ""

done

