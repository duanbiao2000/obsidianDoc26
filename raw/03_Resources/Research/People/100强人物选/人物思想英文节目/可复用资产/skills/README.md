# Skills｜可复用任务技能索引 v0.1

Skills 是按任务触发的执行协议。它们不复述 `AGENT.md` 的长期规则，也不替代现有研究/写作规范；每个 Skill 只负责把一种工作从输入推进到明确产出，并指定必须调用的正式文件与校验。

| Skill | 何时调用 | 该 Skill 的唯一产出责任 |
|---|---|---|
| `person-pool-change` | 加入、移出、重排或版本化正式人物名单 | 合规的人物库变更及其校验、索引和交接更新 |
| `episode-readiness` | 新人物研究、单集立项、补 ERP | 可判断 `GREEN / AMBER / RED` 的准备材料包 |
| `technical-person` | 开发计算机科学、软件工程、系统/语言设计人物 | 技术解释链、设计取舍与专业复核记录 |
| `creator-performer` | 开发演员、导演、音乐人、运动员、设计师 | 作品证据图、过程材料与版权路径 |
| `bilibili-freshness` | 判断平台重复度、寻找非陈词滥调切口 | 可审计的 B站站内新鲜度结论 |
| `english-script` | ERP GREEN 后进入完整英文口播 | 可录制、可回溯来源的英文口播稿与交接状态更新 |
| `handoff-close` | 每次有实质变更的工作结束前 | 已同步的实时交接状态与可继续的下一步 |

## 组合原则

- 单集通用流程先调用 `episode-readiness`；人物类型 Skill 只是其扩展，不替代它。
- `technical-person` 和 `creator-performer` 由人物类型二选一；如跨界人物确实同时需要，两者分别产出各自证据，不合并偷省。
- `bilibili-freshness` 在研究期调用；`english-script` 只在脚本期调用。
- `person-pool-change` 与 `handoff-close` 是横向技能：前者处理正式名单，后者处理任何实质工作的收尾。

所有 Agent 的选用和收尾义务由 `../../AGENT.md` 规定；Hook 事件由 `../自动化/hook-manifest.v0.1.json` 规定。

变更记录：v0.1｜2026-08-28 创建。
