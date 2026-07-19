---
tags: []
created: 2026-06-26
---


---

tags: [quickref, coding]

created: 2026-06-26

---

# ⚡ 编程命令速查

## Tmux

| 操作 | 快捷键 |

|------|--------|

| 新建会话 | `tmux new -s name` |

| 离开会话 | `Ctrl-b d` |

| 恢复会话 | `tmux attach -t name` |

| 新窗口 | `Ctrl-b c` |

| 水平分割 | `Ctrl-b "` |

| 垂直分割 | `Ctrl-b %` |

| 切换窗格 | `Ctrl-b o` |

| 关闭窗格 | `Ctrl-b x` |

| 列出会话 | `tmux ls` |

→ [[Tmux操作]] | [[Tmux的display-popup]]

## Git

| 场景 | 命令 |

|------|------|

| 交互式暂存 | `git add -p` |

| 修改上次提交 | `git commit --amend` |

| 查看分支图 | `git log --oneline --graph --all` |

| 暂存当前工作 | `git stash` |

| 恢复暂存 | `git stash pop` |

| 挑选提交 | `git cherry-pick <hash>` |

→ [[Git-Best-Practices]]

## 搜索工具

| 工具 | 用途 |

|------|------|

| grep.app | 全网开源代码搜索 |

| Sourcegraph | 精确代码导航 |

| `rg` (ripgrep) | 本地快速搜索 |

→ [[grep.app代码搜索引擎使用策略]] | [[Sourcegraph-代码搜索指南]]

## Neovim

→ [[LazyVim配置教学]]

→ [[My-2025-Neovim-+-Tmux-Workflow-As-A-DevOps-Engineer]]
