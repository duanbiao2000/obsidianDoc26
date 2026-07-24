让我直接调用 MCP Obsidian 来获取工具列表，同时也看看我已知的工具定义。

根据我当前加载的 **MCP Obsidian 工具定义**，以下是所有可用工具的完整列表及说明：

---

## 🛠️ MCP Obsidian 工具清单（共 12 个）

### 📂 文件浏览类

| 工具名称                           | 功能说明                           |
| ------------------------------ | ------------------------------ |
| **obsidianListFilesInVault** | 列出 vault 根目录下的所有文件和文件夹         |
| **obsidianListFilesInDir**   | 列出指定目录下的所有文件和子文件（参数：dirpath） |

### 📖 文件读取类

| 工具名称 | 功能说明 |
|----------|----------|
| **obsidianGetFileContents** | 读取单个文件的完整内容（参数：filepath） |
| **obsidianBatchGetFileContents** | **批量读取**多个文件，以头部标题拼接返回（参数：filepaths 数组） |

### 🔍 搜索类

| 工具名称 | 功能说明 |
|----------|----------|
| **obsidianSimpleSearch** | **简单文本搜索**，支持上下文长度控制（参数：query, context_length） |
| **obsidianComplexSearch** | **高级搜索**，支持 JsonLogic 查询语法（如 glob 通配、regexp 正则、标签组合查询等） |

### ✍️ 文件编辑类

| 工具名称 | 功能说明 |
|----------|----------|
| **obsidianAppendContent** | **追加内容**到新建或已有文件的末尾（参数：filepath, content） |
| **obsidianPatchContent** | **精确插入/替换内容**到指定位置——支持按标题(Heading)、块引用(Block)、Frontmatter 字段定位（参数：target_type, target, operation, content） |
| **obsidianDeleteFile** | **删除文件或目录**（需确认参数 confirm: true） |

### 📅 周期性笔记类

| 工具名称 | 功能说明 |
|----------|----------|
| **obsidianGetPeriodicNote** | 获取指定周期类型（daily/weekly/monthly/quarterly/yearly）的当前笔记 |
| **obsidianGetRecentPeriodicNotes** | 获取最近若干个周期性笔记，支持限制条数和是否包含内容（参数：period, limit, include_content） |

### 🔄 变更追踪类

| 工具名称 | 功能说明 |
|----------|----------|
| **obsidianGetRecentChanges** | 获取最近修改的文件列表，支持按天数和数量过滤（参数：days, limit） |

---

## 📋 按使用场景推荐

| 你想做什么 | 推荐工具 |
|------------|----------|
| 查看某个文件夹的文件 | obsidianListFilesInDir |
| 读取笔记内容 | obsidianGetFileContents 或 obsidianBatchGetFileContents |
| 在笔记中搜索关键词 | obsidianSimpleSearch |
| 搜索带特定标签的笔记 | obsidianComplexSearch |
| 快速记录灵感 | obsidianAppendContent |
| 在指定标题下插入内容 | obsidianPatchContent（target_type: "heading"） |
| 查看今天的日记 | obsidianGetPeriodicNote（period: "daily"） |
| 查看近期修改的笔记 | obsidianGetRecentChanges |
| 删除废弃笔记 | obsidianDeleteFile |

---

如果你需要我演示某个工具的具体用法，或者要批量操作 01_Inbox 中的笔记（比如读取、整理、移动、归档），随时告诉我！