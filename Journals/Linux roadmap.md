---
title:
date: 2026-03-03
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source: https://roadmap.sh/linux
---
- `/`: Root directory, the top level of the file system.
- `/home`: User home directories.
- `/bin`: Essential binary executables.
- `/sbin`: System administration binaries.
- `/etc`: Configuration files.
- `/var`: Variable data (logs, spool files).
- `/usr`: User programs and data.
- `/lib`: Shared libraries.
- `/tmp`: Temporary files.
- `/opt`: Third-party applications.

## 系统目录：/bin vs /usr/bin

|目录|主要用途|
|---|---|
|`/bin`|最基础、单用户模式下也必须可用的**核心命令**（如 `ls`、`cp`、`mv`、`bash` 等）。[[roadmap](https://roadmap.sh/linux)]​|
|`/usr/bin`|普通用户空间的大部分应用程序，可选的、体量更多的用户程序。整体是“用户程序和数据”的一部分。[[roadmap](https://roadmap.sh/linux)]​|

简单理解：

- `/bin` 更偏“系统启动和救援时也要能用的命令”，尽量精简。
- `/usr/bin` 是绝大多数日常命令所在的位置，包管理器安装的命令基本都丢这里。

## 用户目录：~/bin vs ~/.local/bin

这两个都属于“当前用户自己的可执行文件目录”，区别主要是历史习惯和 XDG 规范：

- `~/bin`：
    - 比较传统的做法，早期很多发行版会在检测到 `~/bin` 存在时自动加入 PATH。
    - 常见用法：自己写的小脚本、个人工具。
- `~/.local/bin`：
    - 符合 XDG Base Directory 规范的“本地用户可执行文件”目录，对应数据目录 `~/.local/share` 等。[[roadmap](https://roadmap.sh/linux)]​
    - 很多现代发行版默认把 `~/.local/bin` 加入 PATH，用来放用户级安装的程序（比如 `pip install --user`、某些工具的本地安装）。

对你来说可以这么用：

- **个人小脚本**：随便选一个（推荐 `~/.local/bin`，更“现代标准”）。
- 确保在 shell 配置里加 PATH（如果系统没帮你加）：

    bash

    `mkdir -p ~/.local/bin echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc   # 或 ~/.zshrc`

- 给脚本 `chmod +x` 后就能直接在终端里通过名字调用。