
#!/usr/bin/env zsh

ROOT="/mnt/d/MyDocs/obsidianDoc26"

DASH="$ROOT/30_WIKI/Dashboard"



mkdir -p "$DASH"



echo "📦 准备创建 Dashboard 文件..."

echo ""

echo "⚠️ 警告：此脚本仅创建空白占位文件"

echo "    实际内容请从 ChatGPT 对话中复制粘贴"

echo ""



touch "$DASH/00_Capture.md"

touch "$DASH/01_Inbox.md"

touch "$DASH/02_Recent.md"

touch "$DASH/03_Tasks.md"

touch "$DASH/04_Projects.md"

touch "$DASH/05_Journals.md"

touch "$DASH/06_Health.md"



echo "✅ 占位文件已创建于: $DASH"

echo ""

echo "下一步:"

echo "  1. 用编辑器逐个打开 7 个 md 文件"

echo "  2. 复制对话中对应的代码块内容粘贴"

echo "  3. 替换根目录 HOME.md"

ls -la "$DASH/"

