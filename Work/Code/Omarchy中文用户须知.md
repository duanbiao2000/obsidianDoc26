
>在迁移到omarchy后, 对于中文用户, 可能存在哪些需要特殊考虑的地方. 比如中文输入方案.  回答前先用英文对我的提问进行重构.(简练专业,适合反复快速输出) 回答也要英文. 另外我也在备考雅思,对有用的学习素材进行单独罗列

**Reconstructed query:**

> What are the China-specific configuration considerations when migrating to Omarchy on Arch Linux, covering input methods, fonts, locale, and related tooling?

---

Omarchy is an opinionated Hyprland-based setup. For Chinese users, the gaps fall into four areas:

**1. Input method** Omarchy ships no CJK input stack. You need to install one manually. The two viable paths:

- **Fcitx5** — broader ecosystem, more themes, better Wayland support today. Add `fcitx5-chinese-addons` + `fcitx5-rime` for flexible scheme support.
- **IBus + Rime** — lighter, equally stable under Hyprland.

Either way, set the three Wayland env vars in your shell profile:

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

And auto-start the daemon in your Hyprland config.

**2. Fonts** Omarchy's default font stack has no CJK fallback. Install at minimum:

- `noto-fonts-cjk` — comprehensive coverage
- `ttf-sarasa-gothic` — good for terminal/code with mixed CJK+Latin

**3. Locale** Arch defaults to `en_US.UTF-8` — add `zh_CN.UTF-8` to `/etc/locale.gen` and regenerate, even if your UI stays English. Prevents encoding issues in file names and some CLI tools.

**4. Network (China mainland only)** Several tools Omarchy relies on — Homebrew-style package fetching, GitHub-hosted dotfiles — hit GFW friction. Plan your proxy/mirror setup before the migration, not after.

---

在 Arch 基础上安装 Omarchy 之前，中文用户（尤其大陆用户）主要要提前准备三类东西：网络环境、中文输入/字体、本地化设置。[[github](https://github.com/omacom-io/omarchy-iso)]​

## 1. 网络与镜像

- 准备可正常访问 Arch 官方仓库和 AUR 的网络，必要时提前配置 VPN 或代理客户端（如 clash-verge-rev，通过 AUR 安装）。
    
- 了解 Omarchy 推荐用官方 ISO + 安装脚本的流程：先装纯 Arch，再用 `wget -qO- https://omarchy.org/install | bash` 一键部署，安装过程会持续 5–30 分钟取决于网络。注意 `-qO-` 是大写字母 O。[[ifixit](https://www.ifixit.com/Guide/Installing+Omarchy+on+Arch/190367)]​
    

## 2. 中文输入法与字体

- 知道 Omarchy 默认用 **fcitx5**，中文用户需要在系统装好后再补一些包：`fcitx5-rime`（输入法引擎）、以及一个 fcitx5 主题包（如 `fcitx5-skin-ori-git` 或其他 `fcitx5-skin-*`）。
    
- 为避免“半宽字”“怪异字形”，提前准备中文字体：`noto-fonts-cjk`、`wqy-zenhei`、`wqy-microhei`，装完后中文显示会正常很多。
    

## 3. 本地化与区域设置

- 安装后要启用简体中文 locale：取消 `/etc/locale.gen` 中 `zh_CN.UTF-8 UTF-8` 的注释，然后执行 `sudo locale-gen`，否则有些程序会出现中文显示或排序问题。
    
- 根据需要在桌面环境里切好时区和键盘布局，避免安装过程中选错导致时间或输入异常。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    

## 4. 硬件与启动介质

- 提前准备好 Omarchy ISO，使用 Balena Etcher 等工具把镜像写入 U 盘，用它来引导安装（部分机器可能需要关闭 Secure Boot 或调整启动顺序）。github+1
    
- 确认目标机器磁盘分区规划（是否整盘给 Omarchy、是否与其他系统共存），以免安装时误删数据。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    

你目前是打算在实体机上直装 Omarchy，还是先在虚拟机/WSL 里体验一下？


全盘装在实体机上，主要是“先备份，再确认硬件&BIOS，再准备启动盘和网络”。下面按安装前要做的准备点列出来。learn.omacom+2

## 1. 备份和磁盘规划

- 把目标机器上所有重要数据（系统盘、其他分区上的文档、照片等）先完整备份到外置硬盘或 NAS，Omarchy 全盘安装会清空所选磁盘上的分区和数据。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    
- 确认只打算给 Omarchy 用哪块硬盘（比如整块 NVMe 盘），安装时只选这一块，避免误选挂着数据的第二块盘。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    

## 2. 硬件与兼容性

- CPU 需要 64 位 Intel/AMD 架构，ARM（包括大部分平板或 Apple Intel 之前的 M1/M2 系列）目前不在官方支持范围内。[[docs.docuwriter](https://docs.docuwriter.ai/omarchy-user-docs/78777)]​[[youtube](https://www.youtube.com/watch?v=vQDwtsS1doM)]​
    
- 实际运行需求不高：4GB 内存、20–30GB 可用磁盘就能正常跑，当然 8GB+ 内存、SSD 会体验更好。[[reddit](https://www.reddit.com/r/omarchy/comments/1mssby2/system_requirements/)]​
    

## 3. BIOS/UEFI 设置

- 提前进 BIOS 关闭 Secure Boot 和（如有单独选项）TPM，否则 Omarchy 安装器可能直接拒绝安装或无法从 USB 启动。learn.omacom+1
    
- 确认启动模式为 UEFI，关闭 Legacy/CSM，安装完成后让该安装盘排在启动顺序第一位。[[learn.omacom](https://learn.omacom.io/2/the-omarchy-manual/50/getting-started)]​
    

## 4. 启动 U 盘与镜像

- 从官网先下载最新 Omarchy ISO（注意区分 X86_64 版本）。[[omarchy](https://omarchy.org/)]​
    
- 准备一个 8GB 以上的 U 盘，在 Windows/macOS 用 Rufus 或 balenaEtcher 把 ISO 写入（Linux 下可用 balenaEtcher 或命令行工具），写入完成后建议安全弹出再插回测试能否启动。[[youtube](https://www.youtube.com/watch?v=vQDwtsS1doM)]​learn.omacom+1
    

## 5. 网络环境（特别是国内）

- 安装过程需要联网下载软件包，目标机器最好能接网线；如果只能用 Wi‑Fi，提前确认网卡在 Linux 下工作正常（有的 Wi‑Fi 6/7 模块在 6GHz 频段有兼容问题）。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    
- 大陆环境如果需要代理，最好在另一台机器上提前准备好代理服务或路由器层面的透明代理，这样安装过程中的包下载会顺利很多。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    

## 6. 中文和本地化准备

- 安装完成后，需要手动启用 `zh_CN.UTF-8` locale、安装中文字体和输入法；可以把要装的包名先记下来（如 `noto-fonts-cjk`、`wqy-zenhei`、`fcitx5-rime` 等），方便首次进入系统后直接一波装完。
    
- 记住安装过程中选择键盘布局和时区时，用英文布局填写密码会更稳，中文环境后面再配。[[guides.frame](https://guides.frame.work/Guide/Omarchy+Linux+Installation+on+the+Framework+Desktop/568)]​
    



**IELTS-relevant vocabulary from above:**

| Word/Phrase              | Meaning                                          |
| ------------------------ | ------------------------------------------------ |
| _opinionated_            | having strong built-in design choices            |
| _viable_                 | practical and workable                           |
| _ecosystem_              | the wider community of tools around a technology |
| _fallback_               | a backup option when the primary fails           |
| _comprehensive coverage_ | including all or nearly all cases                |
| _friction_               | resistance that slows a process down             |
|                          |                                                  |