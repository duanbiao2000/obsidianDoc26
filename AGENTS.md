# Vault 启动提醒

每次会话开始，先做这一步，再处理用户的其他请求：

1. 扫描 `raw/99_Meta/handoff/` 下所有 frontmatter `type: handoff` 且 `status: active` 的文件。
（忽略文件名以 `_` 开头的模板文件，如 `_模板.md`）
2. 若有：在本会话第一条回复的最开头，列出所有 handoff 任务清单（文件名 + frontmatter `task` 字段 + 该文件里的「下一步」），提示用户回复"继续 <任务名>"即可接上。
3. 若没有：无需提醒，正常开始。

## Handoff 约定（适用于任何任务）

- 位置：`raw/99_Meta/handoff/`；命名 `<任务名>-handoff.md`（中英文均可）。
- frontmatter 必填：`type: handoff`、`task: <一句话描述>`、`status: active|completed`、`created`、`updated`。
- 正文结构：当前位置 / 下一步 / 之后 / 关联文件。
- 任务完成时把 `status` 改为 `completed` 或删除文件，提醒自动失效。
- 模板见 `raw/99_Meta/handoff/_模板.md`；未来任何长期任务都按此创建，agent 启动时自动发现并提醒。
