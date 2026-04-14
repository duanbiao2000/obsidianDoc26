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
底层需求：避免因为范式差异踩坑，让 Ubuntu 经验平滑迁移到 Arch。

---

## 最核心的思维转变

**Ubuntu：帮你做好一切 → Arch：你决定一切**

这不是缺点，是设计哲学，接受这一点后上手会快很多。

---

## 必须提前了解的差异

### 1. 包管理器
```bash
# Ubuntu
apt install / apt update && apt upgrade

# Arch
pacman -S          # 安装
pacman -Syu        # 更新全系统
pacman -Ss         # 搜索
pacman -R          # 卸载
pacman -Rns        # 卸载+清依赖（推荐）
```

**AUR（Arch User Repository）**：Ubuntu 没有对应概念，这是 Arch 最大优势，几乎所有软件都能找到：
```bash
yay -S 软件名    # AUR 助手，用法同 pacman
```

---

### 2. 滚动更新 vs 固定版本

Arch 是**滚动发行版**，没有"版本升级"概念，`pacman -Syu` 就是永远最新。

**实际影响：**
- 软件版本永远最新 ✅
- 偶尔更新后某个包出问题 ⚠️

**习惯：** 更新前看一眼 [Arch 新闻](https://archlinux.org/news/)，重大变更会提前公告。

---

### 3. 系统服务

```bash
# 两者相同，这点无缝迁移
systemctl start/stop/enable/disable/status 服务名
```

---

### 4. 配置文件位置略有差异

| | Ubuntu | Arch |
|--|--------|------|
| 网络 | Netplan | NetworkManager / systemd-networkd |
| 软件源 | `/etc/apt/sources.list` | `/etc/pacman.conf` |
| 用户服务 | `/etc/default/` | `/etc/` 或 `~/.config/` |

---

### 5. 没有 sudo 预装

纯净 Arch 装完默认没有 sudo，需要：
```bash
pacman -S sudo
visudo    # 添加你的用户
```
omarchy 安装脚本会处理这一步，了解即可。

---

### 6. Wiki 是第一资料

Ubuntu 遇到问题搜 Stack Overflow → Arch 遇到问题先查 **Arch Wiki**。

Arch Wiki 质量极高，大多数问题直接有答案，包括 fcitx5、Hyprland、v2ray 这些你已经在问的话题。

---

## 不需要担心的

- **命令行基础**：和 Ubuntu 完全一样，bash/grep/ssh 等无差异
- **文件系统结构**：`/etc` `/home` `/usr` 完全一致
- **Systemd**：两者相同

---

## 一句话总结

> Arch 的学习曲线在**安装阶段**，装完 omarchy 之后日常使用反而比 Ubuntu 更顺滑。你已有的 Linux 基础完全够用，主要补课点就是 pacman 用法 + 滚动更新心态。

---

## 系统空间对比

|环境|基础安装占用|
|---|---|
|Windows 11|25～35 GB|
|Ubuntu (GNOME)|8～12 GB|
|omarchy (Hyprland)|**3～5 GB**|

---

## 为什么 omarchy 这么小

- 无预装臃肿软件（Office、OneDrive、各种捆绑应用）
- Arch 哲学：只装你需要的
- Hyprland 本身极轻量

---

## 实际使用后的空间预估

|项目|占用|
|---|---|
|系统基础|3～5 GB|
|常用软件（浏览器/终端/编辑器）|2～3 GB|
|开发工具链（node/python/rust等）|视需求 3～10 GB|
|**日常总计**|**约 10～15 GB**|

对比 Windows 动辄 50～80 GB（含更新缓存、WinSxS），空间收益非常可观。

---

## 一个建议

全盘安装时分区方案推荐：

```
/boot/efi   512 MB
/           50～80 GB    # 系统+软件
/home       剩余全部     # 数据单独分区
```

`/home` 单独分区的好处：将来重装系统不影响个人数据。

---

# 保留现有数据分区的前提


## 可行的前提

**330G 的分区格式是 NTFS**，Linux 可以直接读写 NTFS，无需格式化。

---

## 安装时的操作

只格式化 145G 那个盘：

```
145G  →  格式化，装 Arch/omarchy
330G  →  保持 NTFS 不动，挂载使用
```

---

## 330G 在 omarchy 下如何挂载

**手动挂载（临时）：**
```bash
mount /dev/sdxY /mnt/data
```

**开机自动挂载（写入 fstab）：**
```bash
# 先查 UUID
blkid /dev/sdxY

# 写入 /etc/fstab
UUID=你的UUID  /mnt/data  ntfs-3g  defaults,uid=1000,gid=1000  0 0
```

安装 NTFS 支持：
```bash
pacman -S ntfs-3g
```

---

## ⚠️ 唯一风险点

安装 Arch 时分区操作要**非常小心**，确认格式化的是 145G 那个盘，**不要误操作 330G**。

建议安装前用 `lsblk` 确认两个分区的设备名：
```bash
lsblk
# 看清 sda/sdb 以及对应容量再操作
```

---

绰绰有余，145G 对 Arch 来说非常宽松。

---

## 分区方案建议

```
/boot/efi    512 MB    # EFI 引导
/            60～80 GB  # 系统 + 软件 + 包缓存
/home        剩余全部   # 个人配置、项目文件
```

---

## 空间消耗最大的几个场景

| 场景 | 占用 |
|------|------|
| 系统 + omarchy | 5～8 GB |
| 开发工具链 | 5～15 GB |
| pacman 包缓存（可定期清理） | 累积 3～10 GB |
| Docker 镜像（如果用） | 按需 |

**总计日常使用** 很难超过 60 GB，剩余空间作为 `/home` 完全够用。

---

## 一个习惯

定期清理 pacman 缓存，防止长期积累：

```bash
pacman -Sc      # 清理旧版本缓存
pacman -Scc     # 清理全部缓存
```

或者装 `paccache` 自动保留最近3个版本：

```bash
pacman -S pacman-contrib
paccache -r
```