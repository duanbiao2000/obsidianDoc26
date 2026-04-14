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
两种主流方案，选一个：

---

## 方案一：stow（推荐，最干净）

GNU Stow 的本质是**批量创建符号链接**，`~/dotfiles/` 里的结构镜像到 `~/`。

```bash
brew install stow   # macOS
# apt install stow  # Ubuntu
```

**目录结构设计：**
```
~/dotfiles/
  zsh/
    .zshrc
  tmux/
    .tmux.conf
  nvim/
    .config/
      nvim/
        init.lua
  bin/
    bin/
      deploy
      mkproject
```

**迁移现有配置：**
```bash
mkdir -p ~/dotfiles

# 移动文件（不是复制）
mv ~/.zshrc ~/dotfiles/zsh/.zshrc
mv ~/.tmux.conf ~/dotfiles/tmux/.tmux.conf
mv ~/.config/nvim ~/dotfiles/nvim/.config/nvim
mkdir -p ~/dotfiles/bin/bin
mv ~/bin/* ~/dotfiles/bin/bin/

# 用 stow 创建符号链接（在 dotfiles 目录下执行）
cd ~/dotfiles
stow zsh      # 创建 ~/.zshrc -> ~/dotfiles/zsh/.zshrc
stow tmux     # 创建 ~/.tmux.conf -> ~/dotfiles/tmux/.tmux.conf
stow nvim     # 创建 ~/.config/nvim -> ~/dotfiles/nvim/.config/nvim
stow bin      # 创建 ~/bin -> ~/dotfiles/bin/bin
```

**验证：**
```bash
ls -la ~/.zshrc
# ~/.zshrc -> ~/dotfiles/zsh/.zshrc  ✓
```

**git 管理：**
```bash
cd ~/dotfiles
git init
echo ".DS_Store" > .gitignore
git add .
git commit -m "init dotfiles"
gh repo create dotfiles --private --push
```

---

## 方案二：chezmoi（功能更强，适合多机器）

如果你有多台机器（公司+个人 Mac，或 Mac+Linux 服务器），chezmoi 更合适——支持模板、加密 secrets、机器差异化配置。

```bash
brew install chezmoi

# 初始化并迁移
chezmoi init
chezmoi add ~/.zshrc
chezmoi add ~/.tmux.conf
chezmoi add ~/.config/nvim

# 查看管理了什么
chezmoi managed

# 推到 github
chezmoi cd
git remote add origin git@github.com:you/dotfiles.git
git push -u origin main
```

**在新机器上恢复：**
```bash
chezmoi init git@github.com:you/dotfiles.git
chezmoi apply
```

一条命令还原全部配置。

---

## 选哪个

|            | stow  | chezmoi  |
| ---------- | ----- | -------- |
| 复杂度        | 低     | 中        |
| 多机器差异      | 不支持   | 支持模板     |
| 加密 secrets | 不支持   | 支持       |
| 符号链接       | 是（透明） | 否（复制+追踪） |
| 适合场景       | 单机/简单 | 多机/有敏感配置 |

**只有一台 Mac 做开发** → stow，够用且透明。  
**多台机器 + 有 API key 等敏感配置** → chezmoi。


---

# 迁移流程

核心问题：没有一个工具能自动知道"哪些是你的配置文件"，但可以用系统化方法覆盖所有遗漏。

---

## 第一步：审计现有配置文件

```bash
# 查看 ~/ 下所有点文件（直接配置文件）
ls -la ~/ | grep "^\."

# 查看 ~/.config 下所有目录（现代程序的配置位置）
ls -la ~/.config/

# 查看 ~/.local/share（数据目录，部分工具放配置）
ls -la ~/.local/share/
```

---

## 第二步：找出哪些文件还没被 stow 管理

```bash
# 检查某个文件是否是符号链接（已被 stow 管理）
file ~/.zshrc
# ~/.zshrc: symbolic link to ../dotfiles/zsh/.zshrc  ✓ 已管理
# ~/.zshrc: ASCII text  ✗ 未管理

# 批量检查所有点文件
for f in ~/.[^.]*; do
  if [ -L "$f" ]; then
    echo "✓ linked: $f -> $(readlink $f)"
  else
    echo "✗ raw:    $f"
  fi
done
```

---

## 第三步：高价值配置文件清单

根据你的工具栈，逐一确认：

```bash
# Shell
~/.zshrc
~/.zprofile
~/.zshenv

# Tmux
~/.tmux.conf

# Git（经常被遗漏）
~/.gitconfig
~/.gitignore_global

# SSH（注意：私钥不要放 git！）
~/.ssh/config          # ✓ 可以放
~/.ssh/id_rsa          # ✗ 绝对不要放

# 开发工具
~/.config/nvim/
~/.config/starship.toml
~/.config/alacritty/
~/.config/kitty/
~/.config/wezterm/
~/.config/lazygit/
~/.config/yazi/
~/.config/zoxide/

# 包管理器
~/.config/pip/pip.conf
~/.npmrc
~/.cargo/config.toml   # Rust

# 脚本目录
~/bin/
```

---

## 第四步：写一个审计脚本，一次看清全貌

```bash
#!/bin/bash
# ~/bin/dotfiles-audit

DOTFILES=~/dotfiles
echo "=== Unmanaged dotfiles in ~/ ==="
for f in ~/.[^.]*; do
  name=$(basename $f)
  [ "$name" = ".DS_Store" ] && continue
  [ "$name" = ".Trash" ] && continue
  [ "$name" = ".ssh" ] && continue    # 单独处理

  if [ -L "$f" ] && [[ $(readlink "$f") == *dotfiles* ]]; then
    echo "  ✓ $name"
  else
    echo "  ✗ $name  ← 未管理"
  fi
done

echo ""
echo "=== Unmanaged configs in ~/.config/ ==="
for d in ~/.config/*/; do
  name=$(basename $d)
  # 检查 dotfiles 里是否有对应目录
  if find $DOTFILES -name "$name" -type d | grep -q .; then
    echo "  ✓ $name"
  else
    echo "  ✗ $name  ← 未管理"
  fi
done
```

运行后直接看 `✗` 的条目，逐一决定是否纳入管理。

---

## 第五步：迁移遗漏文件的标准操作

```bash
# 通用迁移流程
migrate() {
  FILE=$1                          # 如 ~/.gitconfig
  PACKAGE=$2                       # 如 git
  DEST=~/dotfiles/$PACKAGE

  mkdir -p $DEST
  mv $FILE $DEST/$(basename $FILE)
  cd ~/dotfiles && stow $PACKAGE
  echo "✓ $(basename $FILE) migrated and linked"
}

# 使用
migrate ~/.gitconfig git
migrate ~/.gitignore_global git
migrate ~/.config/starship.toml starship  # 注意路径层级
```

**注意 `.config` 下的文件需要保留目录结构：**

```bash
# starship.toml 在 ~/.config/starship.toml
# dotfiles 里需要是：
mkdir -p ~/dotfiles/starship/.config
mv ~/.config/starship.toml ~/dotfiles/starship/.config/
cd ~/dotfiles && stow starship
# 结果：~/.config/starship.toml -> ~/dotfiles/starship/.config/starship.toml
```

---

## 持续保证不遗漏

```bash
# 装新工具后的习惯
# 1. 找到它的配置文件位置
# 2. 立即迁移到 dotfiles
# 3. stow 创建链接
# 4. git commit

# 加入 .zshrc 提醒（每次新建配置自动提示）
new-config() {
  echo "记得: mv $1 ~/dotfiles/xxx/ && stow xxx"
}
```

最终状态：`~/` 和 `~/.config/` 下所有配置文件都是符号链接，`ls -la` 一眼能看出来。真正的文件只存在于 `~/dotfiles/`，git 追踪，推到 GitHub。



你的直觉是对的，chezmoi 确实更适合长期使用。符号链接 vs 复制+追踪是核心差异。

---

## 符号链接（stow 的方式）

```
~/dotfiles/zsh/.zshrc    ←── 真实文件在这里
~/.zshrc                 ──→ 符号链接，指向上面那个文件
```

本质是**同一个文件有两个路径名**。编辑任何一个，另一个立即反映变化，因为它们是同一份数据。

```bash
vim ~/.zshrc          # 实际编辑的是 ~/dotfiles/zsh/.zshrc
vim ~/dotfiles/zsh/.zshrc  # 完全等价
```

**透明**的意思：你感知不到中间有任何东西，就像直接编辑原文件一样。

---

## 复制+追踪（chezmoi 的方式）

```
~/.local/share/chezmoi/dot_zshrc   ← chezmoi 的 source（真实管理的文件）
~/.zshrc                           ← 独立的副本（不是链接）
```

这是**两个独立的文件**。chezmoi 负责在它们之间同步。

```bash
vim ~/.zshrc              # 你在编辑副本
                          # source 还没变！

chezmoi diff              # 查看副本和 source 的差异
chezmoi re-add ~/.zshrc   # 把副本的改动同步回 source
chezmoi apply             # 把 source 的内容推到副本
```

---

## 为什么 chezmoi 要这样设计

因为它要在**写入 `~/.zshrc` 之前做处理**：

```
source 文件（模板）
  ↓ 渲染（填入变量、判断机器类型）
  ↓ 解密（如果有加密内容）
  ↓ 执行脚本（run_once_ 钩子）
最终写入 ~/.zshrc
```

符号链接做不到这个——链接是透明的，没有处理层。

**实际例子：**

```bash
# chezmoi source 里的模板文件
# ~/.local/share/chezmoi/dot_zshrc.tmpl

export EDITOR=nvim
{{ if eq .chezmoi.os "darwin" }}
export BROWSER=open
alias ls="ls -G"
{{ else }}
export BROWSER=xdg-open
alias ls="ls --color"
{{ end }}

# API key 加密存储
export ANTHROPIC_API_KEY={{ secret "anthropic_api_key" }}
```

chezmoi apply 后生成的 `~/.zshrc`（Mac 上）：

```bash
export EDITOR=nvim
export BROWSER=open
alias ls="ls -G"
export ANTHROPIC_API_KEY=sk-ant-xxxxx  # 已解密
```

stow 永远做不到这件事，因为符号链接没有处理层。

---

## 直觉上理解两者的区别

```
stow:    文件 ═══════════════ 链接（同一个东西）
chezmoi: source → [处理层] → 副本（两个东西，中间有逻辑）
```

stow 的优势是简单透明，缺点是"所见即所得"——配置里不能有任何动态内容。

chezmoi 的代价是多了一个心智负担：**编辑完 `~/.zshrc` 后要记得 `chezmoi re-add`**，否则改动不会进入 source，下次 apply 会被覆盖回去。

这是新手最容易踩的坑。解决方法是养成习惯，或者直接编辑 source：

```bash
chezmoi edit ~/.zshrc     # 直接编辑 source，apply 后生效
# 比 vim ~/.zshrc + chezmoi re-add 更安全
```


---

具体操作流程，分三步。

---

## 第一步：选择加密后端

chezmoi 支持多种，最简单的是 **age**（现代加密工具）：

```bash
brew install age chezmoi

# 生成你的加密密钥对
age-keygen -o ~/.age/key.txt
# 输出类似：
# Public key: age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p

# 告诉 chezmoi 用这个密钥
cat >> ~/.config/chezmoi/chezmoi.toml << 'EOF'
[age]
  identity = "~/.age/key.txt"
  recipient = "age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p"
EOF
```

---

## 第二步：加密存储 API Key

```bash
# 将 secret 加密写入 chezmoi 管理的文件
chezmoi secret keyring set --service=anthropic --user=api_key
# 提示输入值：sk-ant-xxxxx
# 加密后存在 chezmoi source 里，git 里只有密文
```

或者用更直接的方式，创建加密文件：

```bash
# 创建专门存放 secrets 的加密文件
chezmoi add --encrypt ~/.anthropic_secrets

# 如果文件不存在，直接创建：
cat > /tmp/secrets << 'EOF'
export ANTHROPIC_API_KEY=sk-ant-xxxxx
export OPENAI_API_KEY=sk-xxxxx
EOF
chezmoi add --encrypt /tmp/secrets
mv /tmp/secrets ~/.anthropic_secrets
```

chezmoi source 里会生成：

```
~/.local/share/chezmoi/
  encrypted_anthropic_secrets.age   ← 密文，可以安全 push 到 github
```

---

## 第三步：在 .zshrc 模板里引用

```bash
# 编辑 zshrc 模板
chezmoi edit ~/.zshrc
```

在模板里加入：

```bash
# dot_zshrc.tmpl 内容

export EDITOR=nvim

# 引用加密文件的内容
{{ includeTemplate "encrypted_anthropic_secrets.age" . | decrypt }}

# 或者用 chezmoi 的 secret 函数直接内联
export ANTHROPIC_API_KEY={{ chezmoi secret keyring get --service=anthropic --user=api_key }}
```

apply 后 `~/.zshrc` 里是明文，但 git 里永远是密文。

---

## 完整验证流程

```bash
# 检查 source 里是密文
cat ~/.local/share/chezmoi/encrypted_anthropic_secrets.age
# -----BEGIN AGE ENCRYPTED FILE-----
# YWdlLWVuY3J5cHRpb24ub3JnL3YxCi0+IFgyNTUxOSB...  ← 看不懂的密文 ✓

# apply 到本机
chezmoi apply

# 验证本机是明文
source ~/.zshrc
echo $ANTHROPIC_API_KEY
# sk-ant-xxxxx  ✓

# push 到 github（密文安全）
cd ~/.local/share/chezmoi
git add . && git commit -m "add encrypted secrets"
git push
```

---

## 新机器恢复的完整流程

```bash
# 1. 安装工具
brew install age chezmoi

# 2. 把你的私钥复制过来（唯一需要手动传输的东西）
# 从旧机器：scp ~/.age/key.txt newmachine:~/.age/key.txt
# 或者用密码管理器存这个文件

# 3. 一键恢复所有配置
chezmoi init git@github.com:you/dotfiles.git
chezmoi apply
# 自动解密，自动生成所有配置文件 ✓
```

---

## 关键理解

```
github 上存的：      密文（age 加密，没有私钥无法解密）
本机 ~/.zshrc 里：   明文（chezmoi apply 时用私钥解密写入）
私钥位置：           ~/.age/key.txt（唯一需要保护的东西）
```

私钥是整个体系的根，建议同时备份到密码管理器（1Password / Bitwarden）。私钥丢了，加密的 secrets 就永久丢失了。