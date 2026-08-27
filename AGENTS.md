# AGENTS.md — Obsidian 知识库操作守则

> 本文件是本仓库（Obsidian 知识库）对 agent 的总操作守则。项目内更具体的 AGENTS.md 优先于本文件。
> 最后更新：2026-08-27（整体加固）

## 0. 目录结构（以实际为准）

内容根目录是 `raw/`（PARA 结构）；`01_Inbox/` 是唯一捕获入口。`raw/` 外的根级文件（AGENTS.md、CLAUDE.md、Dashboard++.md、HOME.md）是导航/配置，不要随意删除或移动。

```text
D:\MyDocs\obsidianDoc26\
├── 01_Inbox/            ← 捕获入口：新笔记先进这里，定期清空
├── raw/                 ← 内容根目录
│   ├── 01_Projects/     ← 有截止日期/明确产出的项目
│   ├── 02_Areas/        ← 长期维护领域
│   │   ├── Atomic/      ← 原子笔记 + 主索引（英语口语/默会知识/LLM-Agentic/技能路由/基础工具）
│   │   ├── Career/  Coding/  English/  Philosophy/  PKM/  transcript/
│   ├── 03_Resources/    ← 参考资料/外部输入
│   │   ├── Research/    ← books/ People/ Places/ Travel/ youtube/ Clippings/ Glasp/ Economics/
│   │   ├── Tools/       ← 工具笔记（含 Prompts技巧/）
│   │   └── time-as-a-partner/
│   ├── 04_Archive/      ← 已完结/一次性内容
│   ├── 05_Journals/     ← Daily/（YYYY-MM-DD.md）+ Reflection/
│   ├── 10_Templates/    ← 仅模板
│   ├── 20_Prompts/      ← 提示词库
│   ├── 30_WIKI/         ← 长青笔记/QuickRef/Dataview/OKF/Canvas
│   ├── 90_Attachments/  ← 全局附件
│   └── 99_Meta/         ← handoff/、维护手册、目录结构说明
└── copilot/             ← Copilot 工具/会话记录（工具目录，勿手动编辑）
```

## 1. Vault 启动提醒

每次会话开始，先做这一步，再处理用户的其他请求：

1. 扫描 `raw/99_Meta/handoff/` 下所有 frontmatter `type: handoff` 且 `status: active` 的文件。（忽略文件名以 `_` 开头的模板文件，如 `_模板.md`）
2. 若有：在本会话第一条回复的最开头，列出所有 handoff 任务清单（文件名 + frontmatter `task` 字段 + 该文件里的「下一步」），提示用户回复"继续 <任务名>"即可接上。
3. 若没有：无需提醒，正常开始。

## 2. Handoff 约定（适用于任何长期任务）

- 位置：`raw/99_Meta/handoff/`；命名 `<任务名>-handoff.md`（中英文均可）。
- frontmatter 必填：`type: handoff`、`task: <一句话描述>`、`status: active|completed`、`created`、`updated`。
- 正文结构：当前位置 / 下一步 / 之后 / 关联文件。
- 任务完成时把 `status` 改为 `completed` 或删除文件，提醒自动失效。
- 模板见 `raw/99_Meta/handoff/_模板.md`；未来任何长期任务都按此创建，agent 启动时自动发现并提醒。
- 使用时机：预计跨多个会话/多轮执行的任务才建 handoff；一次性任务不要建。

## 3. 阅读与检索守则

- 不要凭标题猜内容：引用或修改笔记前，先读实际内容（标题可能与内容不符）。
- 以文件系统/工具的实际列表为准：文件名可能有繁简差异、多余空格、日期前缀不一致（例：`2026-07-11- 吴军的谷歌方法论阅读笔记.md` 在 `-` 后有空格；`專注的思維` 是繁体）。构造路径前先列出目录确认准确文件名。
- 检索顺序：先本地（Obsidian 工具/全文搜索），本地不足再用 Miyo 语义搜索；外部问题才走 web。

## 4. 文件操作守则（加固）

- **移动/归档**：
  - 批量移动前先向用户给出清单（源 → 目标），一次性确认后执行。
  - 使用原生 PowerShell `Move-Item -LiteralPath`；逐个校验解析后的绝对路径在 vault 根目录内，杜绝跨目录误移。
  - 归档按主题归位到 `raw/` 对应区：02_Areas 按领域、03_Resources 按资源类型、一次性内容进 04_Archive、元文档进 99_Meta。
  - 完成后汇报：移动数量 + 源→目标映射表；如有跳过（文件名不匹配）要说明原因并补办。
- **删除**：只清理 0 字节空文件、空画布、明确的误建文件；删除前列出清单；不删除有内容的笔记（除非用户明确要求）。
- **链接**：Obsidian wikilink 按标题解析，移动文件不破坏 [[链接]]，无需批量改写；移动后可在相关 MOC 中补充新条目。
- **命名**：捕获笔记 `YYYY-MM-DD-主题.md`；原子笔记用「一句话主张」式标题；不建空文件。
- **不覆盖**：修改已有笔记时优先用 patch/追加，避免整篇覆盖丢失历史（整篇重写需用户认可）。

## 5. Inbox 纪律

- 新捕获内容统一进 `01_Inbox/`，不要直接散落在 `raw/` 各目录。
- 分流阈值：Inbox 超过 ~15 条或用户提出清理时，触发分流：
  - 已有主题的补充 → 直接归位到对应目录
  - 新主题且值得长期保留 → 在对应 Area/Project 建文件夹后移入
  - 一次性参考 → `raw/04_Archive/`
  - 不确定 → 留在 Inbox 等下次检查，或问用户
- 子目录约定：`Atomic/`（原子笔记）、`Clippings/`（网页剪藏）、`Glasp/`（划线导出）是捕获期容器，整理时归位到 `raw/02_Areas/Atomic`、`raw/03_Resources/Research/Clippings|Glasp`。

## 6. 维护与参考

- 定期维护流程见 [[知识库定期维护操作指导书]]；目录规划见 [[目录结构说明]]（实际结构以第 0 节为准）。
- 修改本文件后，在文末「更新记录」追加一行（日期 + 改动摘要）。

## 更新记录

- 2026-08-27：整体加固——新增目录结构（第 0 节）、阅读与检索守则、文件操作守则、Inbox 纪律；保留原 handoff 启动提醒与约定。
