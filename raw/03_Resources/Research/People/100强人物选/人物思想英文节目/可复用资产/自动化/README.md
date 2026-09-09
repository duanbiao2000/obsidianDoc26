# 自动化校验｜v0.1

本目录只存放**机器可验证的、只读的安全检查**与其机器可读配置。它不负责研究、创作判断、人物取舍或自动修改项目文件；这些工作分别归 `skills/`、正式内容文件和 `AGENT.md`。

## 文件职责

| 文件 | 唯一职责 |
|---|---|
| `hook-manifest.v0.1.json` | 事件、命令、严重级别和失败处理的机器可读绑定表 |
| `人物库硬约束.v0.1.json` | 当前正式名单的机器可执行人数、保留/排除约束；不保存人物理由 |
| `check_session_start.py` | 确认项目入口文件存在，并显示本次应读的入口顺序 |
| `check_people_list.py` | 校验正式人物名单的数量、编号、去重、版本、保留/排除约束 |
| `check_project_links.py` | 校验入口文件、目录索引与当前正式名单文件名是否一致 |
| `check_episode_gate.py` | 在进入完整英文稿前检查对应 EP 是否为 `ERP GREEN` |
| `check_session_close.py` | 提醒实时交接文档是否具备交接所需的结构与当天更新记录 |

事件与命令的完整绑定关系只见 `hook-manifest.v0.1.json`，避免在多个文件重复维护同一张表。

## 使用方式

从项目根目录 `人物思想英文节目/` 执行：

```bash
python3 可复用资产/自动化/check_session_start.py
python3 可复用资产/自动化/check_people_list.py
python3 可复用资产/自动化/check_project_links.py
python3 可复用资产/自动化/check_episode_gate.py --episode EP001-Ryan-Holiday --action full-script
python3 可复用资产/自动化/check_session_close.py --expect-date YYYY-MM-DD --strict
```

当前运行环境将这些命令作为**可手动调用的 Hook 等价物**。如迁移到具备生命周期 Hook 的工具，可依据 manifest 绑定同一命令；不要为不同工具复制或改写校验逻辑。

## 输出语义

- `PASS`：结构性条件通过；
- `WARN`：需由 Agent/编辑判断和补充，不会自动写入任何文件；
- `BLOCKED`：当前操作不可继续，例如 ERP 不是 GREEN；
- `FAIL`：正式文件或约束不一致，须修复后再宣布完成。

## 维护边界

- 修改名单版本或用户明确的保留/排除决定时，先改正式名单，再更新 `人物库硬约束.v0.1.json`；
- 修改 Hook 事件或严重度时，只改 manifest，并在 `AGENT.md` 的变更记录中说明；
- 校验脚本必须使用 Python 标准库、保持只读、输出清楚的失败原因；
- 不能让脚本替 Agent 撰写交接状态、决定资料可信度，或自动处理版权判断。

变更记录：v0.1｜2026-08-28 创建。
