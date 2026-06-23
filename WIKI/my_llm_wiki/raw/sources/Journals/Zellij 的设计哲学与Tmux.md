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
这个问题的本质是：**工具替换的摩擦成本是否值得**，以及 zellij 的设计哲学是否真的更优，还是只是"新"。

---

## 核心哲学差异

**tmux** 是 Unix 哲学的产物：极简、可组合、把自己当管道而非产品。它的设计假设用户是高级用户，会读 man page，会写 shell 脚本，不需要被引导。

**zellij** 是后 IDE 时代的产物：有 UI、有 layout 文件、有插件系统、有 floating panes。它的设计假设用户想要开箱即用，不想花两天配置。

这个差异不是优劣，是**受众模型不同**。但它决定了两者的天花板和地板。

---

## 非大众视角的真实比较

### zellij 被低估的优势

**1. 布局即代码（Layout as Config）** zellij 的 KDL layout 文件是真正的 declarative workspace。你可以描述"启动时打开3个 pane，左边跑 server，右上跑 logs，右下是 shell"——这在 tmux 里需要脚本（tmuxinator / tmuxp）才能实现，且这些工具是第三方的，生态碎片化。

**2. 浮动 pane** 这一个功能就值得重新考虑。在 tmux 的瓦片世界里，你需要一个"临时 shell"就必须破坏现有布局或开新 window。zellij 的 floating pane 是真正的 scratch pad，不打扰当前工作区。

**3. Sixel / 图像渲染前景更好** zellij 在 Rust 生态下迭代速度快，对现代终端特性的跟进比 tmux 更积极。

**4. 多人 session 体验** 虽然 tmux 的 `attach` 也能多人共享，但 zellij 的权限模型（read-only guest）更细粒度。

### tmux 被低估的优势

**1. SSH 环境中的稳定性** 这是最关键的。在生产服务器、跳板机、资源受限环境里，tmux 几乎无处不在，二进制体积小，依赖少。zellij 的 Rust 二进制相对较大，且很多服务器没有。你能接受在生产环境 `curl | sh` 安装 zellij 吗？

**2. 脚本化能力** `tmux send-keys`、`tmux new-window -n`——这些是 shell 脚本的一等公民。很多 CI/CD 工具、开发脚本深度依赖 tmux 命令行 API。zellij 的 CLI 接口相对薄弱（截至目前）。

**3. 肌肉记忆的价值** 不要低估这个。在凌晨3点处理线上事故时，你不想思考按键。tmux 的 prefix+key 模型虽然反人类，但熟练后是零认知负担。

**4. 生态深度** neovim 的 `vim-tmux-navigator`、`toggleterm.nvim` 的 tmux 集成、wezterm 的 tmux 兼容——这个生态层是 zellij 尚未匹配的。

---

## 真正的风险点（很少被讨论）

**zellij 的 session 持久化模型更弱。** tmux 的 session 可以长期运行、detach、reattach，是"永远活着的进程"。zellij 在 resurrection 机制上仍在完善中。如果你把 terminal multiplexer 当"我的工作台一直开着"来用，zellij 目前不够可靠。

**zellij 的插件系统是 WASM。** 这听起来很现代，实际上意味着：插件生态现在很贫瘠，WASM 沙箱有性能开销，写插件的门槛比 tmux 脚本高得多。

---

## 结论：应该怎么选

|你的主要场景|建议|
|---|---|
|本地开发机，几乎不碰生产服务器|值得完全切换 zellij|
|频繁 SSH 到各种远程环境|保留 tmux 作为远程工具，本地可用 zellij|
|深度依赖 neovim + tmux 生态|迁移成本极高，不建议|
|写了大量 tmux 脚本的开发工作流|重写成本 > 收益|
|团队共享环境|强烈不建议引入 zellij|

**我的真实判断：** zellij 不是 tmux 的替代品，是一个不同假设下的不同工具。完全替换的前提是你的工作流几乎不涉及远程服务器，且你愿意放弃 tmux 生态换来更好的本地体验。如果你大量使用 SSH，zellij 会成为你在本地和远程之间来回切换心智模型的负担。

最务实的方案：**本地用 zellij，远程 SSH 进去之后继续用 tmux**——这不是妥协，这是正确的工具分层。

