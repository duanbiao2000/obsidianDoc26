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

> Enumerating key points and nuanced implications from the Neovim + Tmux workflow video.

My 2025 Neovim + Tmux Workflow As A DevOps Engineer (on Arch btw)

https://www.youtube.com/watch?v=73FobI8S8J0

Key points & nuances you can emulate from this workflow:

1. 核心哲学：极简、键盘中心、行业相关
    
    - 目标：少程序、少资源占用、少干扰，把脑力留给 DevOps 工作本身，而不是折腾环境。​
    - 所有选择（Arch、Cosmic、tmux 默认键位、LazyVim 精简配置、DevContainers）都围绕这个原则：**够用、稳定、跟实际工作强相关**。​
        
2. GitHub 作为“一切的中心”，Dotfiles 分层
    
    - 所有代码和 dotfiles 都放 GitHub，并维护多个层次的 dotfiles：一个“本机通用版”，一个“DevContainer 内精简版”。​
    - 启示：你可以把 Neovim/tmux/zsh 配置拆成：本机基础层 + 每个 DevContainer/项目的专用层，避免一个巨型 config 管天下。​
        
3. Arch + Cosmic：在“DIY”与“长期维护”之间取平衡
    
    - Arch 的理由：包新、AUR 丰富、Pacman + yay 装 CLI 工具极快；系统在满载录 4K、开浏览器、电容应用时 RAM 仍然很低。​
    - 窗管选择：从 Hyprland 换到 System76 的 Cosmic DE，因为 Cosmic 有公司背书、长期可维护，又兼具 tiling 和桌面 DE 的易用性（声音、蓝牙、工作区）。​
    - 微妙点：他拒绝依赖单人维护的大型项目（Hyprland），更信长期有资金、有团队的开源项目，这是一个“工程风险管理”的视角。​
        
4. Shell 策略：先 Bash，再 Zsh（自动补全只是 icing）
    
    - 强调：初学 DevOps/Linux 上来一定要把 Bash 学扎实，因为所有云/容器默认都是 Bash；Zsh 是“你已经能在任何机器上用 Bash 自如后”的升级。​
    - 启示：你可以继续玩 Zsh/Oh‑My‑Zsh，但要刻意保证自己在“纯 Bash 环境”里也不卡壳（至少常用命令、通配、脚本语法）。​
        
5. tmux：用默认键位 + 极简设置，当成 CLI 窗管
    
    - 他重点：
        - 用默认 tmux keybindings（对考试、服务器、他人环境都通用）。
        - 只用基本功能：sessions、windows、splits，不用 session-archiving 等复杂特性，保持 mental model 简单。
        - 每天清理会话，就像每天关浏览器标签，信息要么写进笔记，要么进书签，要么进 TODO，绝不堆在 session/tab 里。​
    - 这是一个值得模仿的“信息卫生”习惯。
        
6. DevContainers + DevPod：一 repo 一环境，主机永远干净
    
    - 本机不装 kubectl / flux / Python env 等大型工具，所有项目都用 `.devcontainer.json` 描述依赖，在 DevPod 里起容器环境，再在里面用 LazyVim 等工具开发。​
    - 好处：
        - 各项目依赖完全隔离，不会混；
        - 项目关闭时 `devpod delete`，环境完全清除；
        - 在企业/团队环境中可直接复用，用 VS Code 或 Browser IDE 也 OK。​
    - 他明确反对把大量时间花在 NixOS 上，因为几乎没有企业用它，而 DevContainers 已经在越来越多开源项目和公司里成为“标准开发环境描述”。​
        
7. LazyVim 使用策略：默认尽量原生，只按项目按需加 extras
    
    - 本机 Neovim 配置极其精简：主要是配色、关掉不需要的特性、加几个必备插件（Neo-tree、LazyGit、render-markdown 等），大量默认行为保持 LazyVim 原样。​
    - 在 DevContainer 中：按项目启用 `lazy-extras`（比如 Python/Markdown/YAML），只装该项目需要的 LSP/工具，避免一个全局 Neovim 装一堆没用语言支持。​
    - 启示：你可以把现在的 Neovim 大 config 切到“基础 + 按 project extras”，减少启动开销和心智负担。
        
8. 安全与浏览器：彻底解耦密码、书签与浏览器
    
    - 浏览器：从 Edge → qutebrowser → Firefox，最终选择 Firefox 主要是 YubiKey 支持和跨平台同步。​
    - 密码：改用 `pass`（GPG 加密 + YubiKey 存密钥），浏览器不再保存密码。
    - 书签：用 self‑hosted Linkding 管理，任何浏览器只当“薄壳”，可以随时换。​
    - 这是一个很 DevOps 式的“把状态从前端剥离”的思维：密码、书签是独立服务，不绑在 UI 上。
        
9. 笔记与可视化：Obsidian + Neovim + Zettelkasten
    
    - Obsidian 管理可视化笔记（Excalidraw、mind map）和日记，Neovim（+ LazyVim）编辑 Markdown，二者通过同一目录协作；继续使用自己的 Zettelkasten CLI 项目。​
        
10. AI 成为每日一两个小时的“协作伙伴”

- 工具：主要是 Claude，也用 DeepSeek 等；用途包括：健康分析、训练计划、学新技术、写/审查代码。​
- 提示：很多 prompt 长达“几页纸”，精细指定背景、约束和期待结构，而不是一句话随便问，这是他把 AI 真正融入 DevOps 工作流的关键。​

这些点合起来，其实是一套挺完整的原则：

- 配置要极简但行业相关。
- 环境要可复现、可丢弃（DevContainers）而不是在本机堆垃圾。
- 工具要解耦（浏览器 vs 密码/书签、Neovim vs Obsidian）。
- AI 要深度使用（长 prompt、系统性协作），而不是偶尔“搜一下答案”。

