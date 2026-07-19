---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---


当然，下面给你一些**能直接拿去改造**的实例，分别对应 `fd/find`、`rg/grep`、`git`、`ffmpeg` 四类场景。下面这些组合都体现了 `fzf` 的核心思路：先把候选项列出来，再交给你交互筛选。[[juejin](https://juejin.cn/post/7301573649328898063)]

## 1) fd / find：快速找文件再打开

适合你做项目、找脚本、找字幕文件时用。`fd` 的写法更简洁，`find` 兼容性更强。[[cnblogs](https://www.cnblogs.com/jigsawecho/p/19855887)]

bash

`vim "$(fd --type f | fzf)"`

bash

`code "$(find . -type f | fzf)"`

bash

`less "$(fd --type f --extension srt | fzf)"`

这类命令的逻辑很简单：`fd` 或 `find` 负责列出文件，`fzf` 负责挑一个，最后交给编辑器或查看器。[[aslamosama.github](https://aslamosama.github.io/first.html)]

## 2) rg / grep：先搜内容，再筛结果

这特别适合“我记得某段话，但不知道在哪个文件”这种情况。常见做法是让 `rg` 输出匹配行，再交给 `fzf` 继续过滤。[[juejin](https://juejin.cn/post/7301573649328898063)]

bash

`rg -n "subtitle" . | fzf`

bash

`rg -n "error|warn|fail" logs/ | fzf`

bash

`selected=$(rg -n "关键词" . | fzf) echo "$selected"`

如果你想进一步定位到文件并打开，可以把 `fzf` 选中的结果解析出来再跳转。[[blog.csdn](https://blog.csdn.net/gitblog_00138/article/details/151446474)]

## 3) git：选分支、选提交、选文件

这是 `fzf` 最经典的组合之一，特别适合经常切分支、挑提交、挑改动文件的人。[[segmentfault](https://segmentfault.com/a/1190000011328080)]

## 选分支切换

bash

`git branch | fzf | xargs git checkout`

## 选提交查看

bash

`git log --oneline | fzf`

## 选暂存/未暂存文件

bash

`git diff --name-only | fzf`

## 选文件后加入暂存区

bash

`git add "$(git status --short | awk '{print $2}' | fzf)"`

这些例子都体现了同一个套路：`git` 先吐出一个列表，`fzf` 让你快速挑目标。[[martin-brennan](https://www.martin-brennan.com/git-shortcuts-with-fzf/)]

## 4) ffmpeg：先选文件，再批处理

`ffmpeg` 本身不负责交互，但它很适合和 `fzf` 搭配做“先选中目标，再执行处理”。这对你做视频、字幕、音频处理尤其实用。[[cnblogs](https://www.cnblogs.com/jigsawecho/p/19855887)]

## 转码单个文件

bash

`ffmpeg -i "$(fd --type f --extension mp4 | fzf)" out.mp4`

## 批量挑字幕文件做处理

bash

`file="$(fd --type f --extension srt | fzf)" echo "$file"`

## 先选视频，再抽音频

bash

`f="$(fd --type f --extension mp4 | fzf)" ffmpeg -i "$f" -vn -c:a copy "${f%.*}.m4a"`

## 多选后批处理

bash

`fd --type f --extension mp4 | fzf -m | while read -r f; do   ffmpeg -i "$f" -vn -c:a copy "${f%.*}.m4a" done`

如果你经常做字幕、素材整理、批量转码，这一类组合会非常省时间。[[aslamosama.github](https://aslamosama.github.io/first.html)]

## 5) 适合你日常的实战模板

你这种工作流里，最实用的不是“炫技命令”，而是固定几条高频入口。[[juejin](https://juejin.cn/post/7301573649328898063)]

## 找项目里的脚本

bash

`code "$(fd --type f --extension py --extension sh | fzf)"`

## 找字幕文件并预览

bash

`fzf --preview 'sed -n "1,120p" {}'`

## 找包含某关键词的文件

bash

`rg -l "SenseVoice|Whisper|FunASR" . | fzf`

## 挑一个视频素材再处理

bash

`ffmpeg -i "$(fd --type f --extension mov --extension mp4 | fzf)" out.mp4`

## 6) 最值得先记的三条

如果只记三条，先记这几个：

bash

`fd --type f | fzf rg -n "关键词" . | fzf git branch | fzf`

这三条基本就覆盖了“找文件、找内容、找 git 目标”的主流场景。[[blog.csdn](https://blog.csdn.net/gitblog_00475/article/details/151446162)]

如果你要，我下一步可以直接给你整理一份 **Windows / PowerShell / WSL 下可用的 fzf 配置片段**，包括 `Ctrl+T`、`Ctrl+R`、`Alt+C` 和你常用的 `fd + rg + git` alias。[[blog.csdn](https://blog.csdn.net/gitblog_01056/article/details/151445758)]
