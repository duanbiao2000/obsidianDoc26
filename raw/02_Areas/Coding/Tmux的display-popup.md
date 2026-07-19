---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source:
---
支持，tmux 内置 `display-popup` 命令。

---

## 基本用法

```bash
# 打开一个浮动终端
Ctrl+b :display-popup

# 指定大小和命令
Ctrl+b :display-popup -w 80% -h 80% -E "zsh"
```

---

## 绑定快捷键

```bash
# ~/.tmux.conf

# Alt+p 打开浮动终端
bind -n M-p display-popup -w 80% -h 80% -E "zsh"

# 浮动 lazygit
bind -n M-g display-popup -w 90% -h 90% -E "lazygit"

# 浮动 yazi
bind -n M-y display-popup -w 90% -h 90% -E "yazi"
```

---

## 常用参数

| 参数 | 含义 |
|------|------|
| `-w` | 宽度（px 或 %） |
| `-h` | 高度（px 或 %） |
| `-E` | 执行命令，退出后关闭 popup |
| `-d` | 指定工作目录 |
| `-x` / `-y` | 弹窗位置 |

---

## 关闭 popup

```bash
Ctrl+d   # 或直接 exit
```

lazygit / yazi 这类工具配合 popup 体验很好，用完直接关，不污染主窗口布局。

---

问题本质：`display-popup` 每次都 spawn 新进程，需要让它 attach 到一个具名 session，不存在则创建。

---

## 解决方案

```bash
# ~/.tmux.conf

# 通用函数：attach-or-create named session in popup
bind -n M-p display-popup -w 80% -h 80% -E \
  "tmux new-session -As popup-shell"

bind -n M-g display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-lazygit -c '#{pane_current_path}' 'lazygit'"

bind -n M-y display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-yazi -c '#{pane_current_path}' 'yazi'"
```

`new-session -As <name>` 是核心：`-A` = attach if exists，`-s` = session name。session 存在就 attach，不存在就创建。

---

## 一个问题：lazygit/yazi 退出后 session 会销毁

因为进程退出 → session 消失 → 下次重新创建，状态丢失。

解决：用 shell 包一层，进程退出后不关闭 session：

```bash
bind -n M-g display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-lazygit -c '#{pane_current_path}' 'lazygit; exec zsh'"

bind -n M-y display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-yazi -c '#{pane_current_path}' 'yazi; exec zsh'"
```

`lazygit; exec zsh` = lazygit 退出后落回 shell，session 保持存活，下次 M-g 直接 attach 回来。

---

## 进阶：yazi 记住上次目录

yazi 有内置的 `--cwd-file` 支持，可以在关闭时写出当前目录：

```bash
bind -n M-y display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-yazi -c '#{pane_current_path}' \
  'yazi --cwd-file=/tmp/yazi-cwd; exec zsh'"
```

如果你还想让 popup 打开时 cd 到上次 yazi 所在目录：

```bash
bind -n M-y display-popup -w 90% -h 90% -E "
  tmux new-session -As popup-yazi -c '#{pane_current_path}' \
  'cwd=\$(cat /tmp/yazi-cwd 2>/dev/null); [ -d \"\$cwd\" ] && cd \"\$cwd\"; yazi --cwd-file=/tmp/yazi-cwd; exec zsh'
"
```

---

## 完整配置

```bash
# ~/.tmux.conf

# M-p: 持久 shell popup
bind -n M-p display-popup -w 80% -h 80% -E \
  "tmux new-session -As popup-shell"

# M-g: 持久 lazygit（退出后保留 session）
bind -n M-g display-popup -w 90% -h 90% -E \
  "tmux new-session -As popup-lazygit -c '#{pane_current_path}' 'lazygit; exec zsh'"

# M-y: 持久 yazi（记住上次目录）
bind -n M-y display-popup -w 90% -h 90% -E "
  tmux new-session -As popup-yazi -c '#{pane_current_path}' \
  'cwd=\$(cat /tmp/yazi-cwd 2>/dev/null); [ -d \"\$cwd\" ] && cd \"\$cwd\"; yazi --cwd-file=/tmp/yazi-cwd; exec zsh'
"
```

reload 配置后生效：`tmux source ~/.tmux.conf`
