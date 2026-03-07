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
---
Obsidian CLI 是用于控制 Obsidian 笔记应用的命令行工具，主要有官方内置 CLI（Obsidian 1.12+ 版本）和第三方工具（如 Yakitrak/obsidian-cli）两种。sspai+1

## 官方 Obsidian CLI 示例（内置，需 Catalyst 许可证启用）

这些命令需要在 Obsidian 设置中开启 CLI，并在 Vault 目录下运行。默认针对当前工作目录的 Vault。help.obsidian+1

- 打开今日每日笔记：`obsidian daily`
    
- 搜索笔记：`obsidian search query="会议笔记"` 
    
- 创建笔记并打开：`obsidian create name="新笔记" content="# 标题\n正文" open`
    
- 追加任务到每日笔记：`obsidian daily:append content="- [ ] 买菜"`
    
- 列出所有任务：`obsidian tasks`
    
- 读取当前文件：`obsidian read`
    
- 执行 Obsidian 命令：`obsidian command id="editor:toggle-bold"`
    
