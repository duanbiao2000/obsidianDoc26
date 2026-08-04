---
tags: [quickref, codex, tui]
created: 2026-08-04
---

# ⚡ Codex TUI Keymap 速查

> 适用版本：codex-cli 0.146.0（2026-08-04 本地安装）
> 来源：官方 Interactive mode 文档 + 本地 `codex` 二进制提取的 keymap 定义
> 查看 / 修改：TUI 内输入 `/keymap`；配置写入 `~/.codex/config.toml` 的 `[tui.keymap.*]`

## 一、最重要的命令（先掌握这 12 个）

| 命令 | 默认键 | 作用 |
| :--- | :--- | :--- |
| submit | Enter | **发送**当前输入框内容 |
| insert_newline | Shift+Enter（终端不认时用 Ctrl+J） | 输入框内**换行**，不发送 |
| queue | Tab | 任务运行中**排队**发送下一条提示，不用等上一轮结束 |
| interrupt_turn | /keymap 面板内可查 | **中断**当前正在进行的回合，立即停止 agent 执行 |
| open_transcript | /keymap 面板内可查 | 打开 **transcript 面板**，回看本轮完整对话与工具调用 |
| open_external_editor | /keymap 面板内可查（依赖 $VISUAL/$EDITOR） | 把当前草稿**转到外部编辑器**（vim 等）编辑，适合长输入 |
| copy | /keymap 面板内可查 | **复制最近一条 agent 回复**到剪贴板 |
| clear_terminal | /keymap 面板内可查 | **清空终端 UI**，界面不拥挤 |
| history_search_previous / next | /keymap 面板内可查 | 打开**输入历史搜索**，或在上/下一条历史匹配间移动 |
| edit_queued_message | /keymap 面板内可查 | **编辑已排队**但还没发出的消息 |
| toggle_vim_mode | /keymap 面板内可查 | 在输入框**开关 Vim 模式**（键盘流操作） |
| increase / decrease_reasoning_effort | /keymap 面板内可查 | 调高 / 调低**推理强度**，重活开高、快问开低 |

## 二、全部命令一览

### Global（全局）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.global.open_transcript` | 打开 transcript 面板 |
| `tui.keymap.global.open_external_editor` | 用外部编辑器打开当前草稿 |
| `tui.keymap.global.copy` | 复制最近一条 agent 回复 |
| `tui.keymap.global.clear_terminal` | 清空终端 UI |
| `tui.keymap.global.toggle_vim_mode` | 开关 Vim 输入模式 |
| `tui.keymap.global.toggle_fast_mode` | 开关 Fast mode |
| `tui.keymap.global.toggle_raw_output` | 开关 raw scrollback（原始输出模式） |
| `tui.keymap.global.toggle_side_conversation` | 在 side conversation 与主对话间切换 |

### Chat（会话控制）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.chat.interrupt_turn` | 中断当前回合 |
| `tui.keymap.chat.decrease_reasoning_effort` | 降低推理强度 |
| `tui.keymap.chat.increase_reasoning_effort` | 提高推理强度 |
| `tui.keymap.chat.edit_queued_message` | 编辑最近一条已排队消息 |

### Composer（输入框提交）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.composer.submit` | 提交当前草稿（发送） |
| `tui.keymap.composer.queue` | 运行中排队发送草稿 |
| `tui.keymap.composer.toggle_shortcuts` | 显示 / 隐藏快捷键浮层 |
| `tui.keymap.composer.history_search_previous` | 打开历史搜索 / 上一条匹配 |
| `tui.keymap.composer.history_search_next` | 下一条历史匹配 |

### Editor（输入框编辑）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.editor.insert_newline` | 插入换行 |
| `tui.keymap.editor.move_left` / `move_right` / `move_up` / `move_down` | 光标左 / 右 / 上 / 下 |
| `tui.keymap.editor.move_word_left` | 移到上一个词开头 |
| `tui.keymap.editor.move_word_right` | 移到下一个词末尾 |
| `tui.keymap.editor.move_line_start` / `move_line_end` | 移到行首 / 行尾 |
| `tui.keymap.editor.delete_backward` | 向左删一个字符 |
| `tui.keymap.editor.delete_forward` | 向右删一个字符 |
| `tui.keymap.editor.delete_backward_word` | 删除前一个词 |
| `tui.keymap.editor.delete_forward_word` | 删除后一个词 |
| `tui.keymap.editor.kill_line_start` | 删到行首 |
| `tui.keymap.editor.kill_whole_line` | 删除整行 |
| `tui.keymap.editor.kill_line_end` | 删到行尾 |
| `tui.keymap.editor.yank` | 粘贴 kill buffer（剪贴板） |

### Vim Normal（普通模式）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.vim_normal.enter_insert` | 光标后进入插入模式 |
| `tui.keymap.vim_normal.append_after_cursor` | 光标后追加 |
| `tui.keymap.vim_normal.append_line_end` | 行尾进入插入模式 |
| `tui.keymap.vim_normal.insert_line_start` | 行首非空字符处进入插入模式 |
| `tui.keymap.vim_normal.open_line_below` / `open_line_above` | 下方 / 上方新开一行并进入插入 |
| `tui.keymap.vim_normal.move_left` / `move_right` / `move_up` / `move_down` | 方向移动（上下可翻历史） |
| `tui.keymap.vim_normal.move_word_forward` / `move_word_backward` / `move_word_end` | 词间移动 |
| `tui.keymap.vim_normal.move_line_start` / `move_line_end` | 行首 / 行尾 |
| `tui.keymap.vim_normal.delete_char` | 删除光标处字符 |
| `tui.keymap.vim_normal.substitute_char` | 删除字符并进入插入模式 |
| `tui.keymap.vim_normal.delete_to_line_end` | 删到行尾 |
| `tui.keymap.vim_normal.change_to_line_end` | 改到行尾并进入插入模式 |
| `tui.keymap.vim_normal.yank_line` | 复制整行 |
| `tui.keymap.vim_normal.paste_after` | 光标后粘贴 |
| `tui.keymap.vim_normal.start_delete_operator` | 开始删除操作符，等待 motion |
| `tui.keymap.vim_normal.start_yank_operator` | 开始复制操作符，等待 motion |
| `tui.keymap.vim_normal.start_change_operator` | 开始修改操作符，等待 motion / 文本对象 |
| `tui.keymap.vim_normal.cancel_operator` | 取消待定操作符 |

### Vim Operator（操作符模式）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.vim_operator.delete_line` | 重复删除操作符删整行 |
| `tui.keymap.vim_operator.yank_line` | 重复复制操作符复制整行 |
| `tui.keymap.vim_operator.motion_left` / `motion_right` / `motion_up` / `motion_down` | 操作符方向 motion |
| `tui.keymap.vim_operator.motion_word_forward` / `motion_word_backward` / `motion_word_end` | 操作符词 motion |
| `tui.keymap.vim_operator.motion_line_start` / `motion_line_end` | 操作符行首 / 行尾 motion |
| `tui.keymap.vim_operator.select_inner_text_object` | 选择内部文本对象 |
| `tui.keymap.vim_operator.select_around_text_object` | 选择包含边界的文本对象 |
| `tui.keymap.vim_operator.cancel` | 取消待定操作符 |

### Vim Text Object（文本对象）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.vim_text_object.word` | 目标：当前单词 |
| `tui.keymap.vim_text_object.big_word` | 目标：当前 WORD（含标点） |
| `tui.keymap.vim_text_object.parentheses` | 括号 `()` 内 |
| `tui.keymap.vim_text_object.brackets` | 方括号 `[]` 内 |
| `tui.keymap.vim_text_object.braces` | 花括号 `{}` 内 |
| `tui.keymap.vim_text_object.double_quote` | 双引号内 |
| `tui.keymap.vim_text_object.single_quote` | 单引号内 |
| `tui.keymap.vim_text_object.backtick` | 反引号内 |
| `tui.keymap.vim_text_object.cancel` | 取消待定文本对象 |

### Pager（滚动 / 翻页）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.pager.scroll_up` / `scroll_down` | 上 / 下滚一行 |
| `tui.keymap.pager.page_up` / `page_down` | 上 / 下翻一页 |
| `tui.keymap.pager.half_page_up` / `half_page_down` | 上 / 下半页 |
| `tui.keymap.pager.jump_top` / `jump_bottom` | 跳到顶部 / 底部 |
| `tui.keymap.pager.close` | 关闭 pager 浮层 |
| `tui.keymap.pager.close_transcript` | 关闭 transcript 面板 |

### Approval（权限审批）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.approval.open_fullscreen` | 全屏查看审批详情 |
| `tui.keymap.approval.open_thread` | 打开审批对应的来源线程 |
| `tui.keymap.approval.approve` | 批准主选项 |
| `tui.keymap.approval.approve_for_session` | 本次会话内批准 |
| `tui.keymap.approval.approve_for_prefix` | 按 exec-policy 前缀批准 |
| `tui.keymap.approval.deny` | 明确拒绝 |
| `tui.keymap.approval.decline` | 拒绝并附修改意见 |
| `tui.keymap.approval.cancel` | 取消审批 / 请求 |

### List（列表选择）

| 配置键 | 作用 |
| :--- | :--- |
| `tui.keymap.list.move_up` / `move_down` | 列表上 / 下移动 |
| `tui.keymap.list.move_left` / `move_right` | 列表横向移动 |
| `tui.keymap.list.page_up` / `page_down` | 翻页 |
| `tui.keymap.list.jump_top` / `jump_bottom` | 跳第一项 / 最后一项 |
| `tui.keymap.list.accept` | 确认当前选择 |
| `tui.keymap.list.cancel` | 取消并关闭选择视图 |

## 三、不可自定义的固定键（fixed.*）

以下行为由 Codex 内部固定，不在 `/keymap` 可改范围内：

| 固定键 | 作用 |
| :--- | :--- |
| `fixed.paste_image` | Ctrl+V 粘贴图片，附加到下一条消息 |
| `fixed.slash_command` | 输入 `/` 打开命令弹窗 |
| `fixed.shell_command` | 输入 `!` 直接执行 shell 命令 |
| `fixed.backtrack` | 回溯上一步 |
| `fixed.interrupt_or_quit` | 中断或退出 |
| `fixed.quit` | 退出 |
| `fixed.cycle_collaboration_mode` | 切换协作模式 |
| `fixed.previous_agent` | 切到上一个 agent |
| `fixed.connector_mentions` | 连接器提及 |
| `fixed.transcript_edit_previous` / `edit_next` / `confirm_edit` | transcript 内编辑上 / 下一条 / 确认 |

## 四、如何改键

TUI 内输入 `/keymap` 可交互式改键：搜索动作 → 捕获新键 → 写入 `~/.codex/config.toml`。也可以手写配置，例如把换行键改为 Shift+Enter：

```toml
[tui.keymap.editor]
insert_newline = "shift-enter"
```

键值写法：`ctrl-a`、`shift-enter`、`alt-x`、`page-down`、`f13`–`f24` 等；只支持 ctrl / alt / shift 修饰键加可打印 ASCII 或功能键。改完重启 Codex 生效。

## 五、默认键位速记（官方文档）

| 键 | 作用 |
| :--- | :--- |
| Enter | 发送消息 |
| Shift+Enter | 输入框内换行 |
| Ctrl+J | 换行的可靠替代（终端不传 Shift+Enter 时用，ASCII 换行符） |
| Ctrl+U | 清空当前行 |
| Ctrl+W | 向前删除一个词 |
| Tab | 自动补全（运行中为排队发送） |

> 备注：不同版本 keymap 会有增减，以上命令清单对应 0.146.0；以你本机 `/keymap` 面板实际显示为准。
