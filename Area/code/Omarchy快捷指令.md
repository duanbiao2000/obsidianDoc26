Omarchy 的快捷键设计以 Super（Windows 键）为主，高度键盘导向，覆盖窗口管理、应用启动、工作流和系统控制。随时按 Super + K 查看完整列表。learn.omacom+1

## 窗口与工作区

|快捷键|功能|
|---|---|
|Super + 1/2/3/4|跳转到对应工作区 [[learn.omacom](https://learn.omacom.io/2/the-omarchy-manual/53/hotkeys)]​|
|Super + Alt + Tab|下一个工作区 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Shift + 1/2/3/4|移动当前窗口到指定工作区 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Arrow|焦点移动到相邻窗口 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Shift + Arrow|窗口交换位置 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + = / -|窗口左右增长 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Shift + = / -|窗口上下增长 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|

## 应用与工具启动

|快捷键|功能|
|---|---|
|Super + Return|终端（Ghostty） [[dominickm](https://dominickm.com/omarchy-first-contact-keyboard-guide/)]​|
|Super + B|浏览器 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Shift + B|浏览器（隐私模式） [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + F|文件管理器 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + N|Neovim [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + M|音乐（Spotify） [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + Space|应用启动器（Rofi） [[zdnet](https://www.zdnet.com/article/omarchy-linux-distro-makes-hyprland-usable/)]​|

## 系统与媒体控制

|快捷键|功能|
|---|---|

|快捷键|功能|
|---|---|
|Super + Alt + Space|Omarchy 控制菜单 [[reddit](https://www.reddit.com/r/omarchy/comments/1ojarl8/need_help_with_shortcut_keys/)]​|
|Super + Escape|锁屏/挂起/重启/关机 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Super + W|关闭窗口 [[learn.omacom](https://learn.omacom.io/2/the-omarchy-manual)]​|
|Ctrl + Alt + Del|关闭所有窗口 [[learn.omacom](https://learn.omacom.io/2/the-omarchy-manual)]​|
|Print Screen|区域截屏 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Alt + Print Screen|区域录屏 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|
|Ctrl + F1 / F2|亮度调节 [[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​|

## 编辑器与特殊工作流

- Neovim：Ctrl + W W（侧边栏与编辑器间跳转）、Space G G（Git 控制）、Space S G（文件内容搜索）。[[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​
- 文件管理器：Space（文件预览）、Backspace（返回上级目录）、Ctrl + L（跳转路径）。[[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​
- 表情输入：CapsLock + M + 字母（如 M Y 为 👍、M N 为 👎），自定义在 ~/.XCompose。[[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​

这些快捷键基于 Hyprland 配置，可在 ~/.config/hypr/bindings.conf 修改。[[acrogenesis.github](https://acrogenesis.github.io/omarchy-cheat-sheet/)]​

---

**Reconstructed query:**

> What is the architectural relationship between Wayland and Hyprland in the Linux display stack, and how do they differ in role and scope?

---

One is a protocol. The other is an implementation.

**Wayland** is a specification — it defines _how_ an application talks to the display system. It replaces X11 as the communication contract between apps and the compositor. Wayland itself does nothing on its own; it is a standard, not a program.

**Hyprland** is a Wayland compositor — a program that _implements_ the Wayland protocol and does the actual work: managing windows, handling input, rendering everything you see on screen.

The relationship in the Linux display stack:

```
Hardware (GPU)
      ↓
Kernel (DRM/KMS)
      ↓
Compositor  ←── this is where Hyprland lives
  implements Wayland protocol
      ↓
Applications (talk to compositor via Wayland)
```

An analogy: Wayland is HTTP. Hyprland is nginx — one defines the rules, the other runs the server.

**Other compositors that also implement Wayland:**

|Compositor|Character|
|---|---|
|Sway|i3-compatible, stable, minimal|
|Hyprland|Highly customizable, eye candy, active dev|
|KWin (KDE)|Full desktop environment compositor|
|Mutter (GNOME)|Full desktop environment compositor|

Hyprland's distinction is not _what_ it is — all compositors do the same structural job — but _how_ opinionated and extensible it is. That is why setups like Omarchy are built around it specifically.

---

**IELTS vocabulary:**

| Word/Phrase     | Meaning                                      |
| --------------- | -------------------------------------------- |
| _specification_ | a detailed technical standard or definition  |
| _implements_    | puts a standard into actual working code     |
| _contract_      | a defined agreement both sides must follow   |
| _analogy_       | a comparison that explains by similarity     |
| _opinionated_   | enforces specific design choices by default  |
| _extensible_    | designed to be expanded or customised easily |
