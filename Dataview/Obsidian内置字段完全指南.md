---
type: dataview
category: reference
created: 2026-03-07
tags: [dataview, reference, metadata]
---

# Obsidian 内置字段完全指南

> Dataview 可以访问的 Obsidian 内置文件字段完整列表。

## 📁 文件元数据（file.*）

这些字段由 Obsidian 自动提供，所有笔记都有：

| 字段 | 类型 | 说明 | 示例 |
|------|------|------|------|
| `file.path` | string | 文件的完整路径 | `Books/The Design of Everyday Things.md` |
| `file.folder` | string | 文件所在文件夹 | `Books` |
| `file.name` | string | 文件名（不含扩展名） | `The Design of Everyday Things` |
| `file.link` | link | 文件的链接对象 | `[[The Design of Everyday Things]]` |
| `file.ext` | string | 文件扩展名 | `md` |
| `file.ctime` | date | 文件创建时间 | `2026-02-10T10:30:00` |
| `file.mtime` | date | 文件最后修改时间 | `2026-02-25T15:45:00` |
| `file.size` | number | 文件大小（字节） | `15360` |
| `file.tags` | array | 文件的所有标签 | `[[design], [psychology]]` |
| `file.frontmatter` | object | frontmatter 中的所有字段 | `{ title: "...", author: "..." }` |
| `file.inlinks` | array | 指向此文件的链接数组 | `[[link1]], [[link2]]` |
| `file.outlinks` | array | 此文件指向的链接数组 | `[[link3]], [[link4]]` |
| `file.aliases` | array | 文件的别名（frontmatter 中的 aliases） | `["别名1", "别名2"]` |
| `file.day` | date | 从文件名提取的日期（如果文件名是日期格式） | `2026-03-07` |

## 🔑 自定义元数据（frontmatter）

这些字段在 YAML frontmatter 中定义，只有添加了该字段的笔记才有：

### 示例 frontmatter

```yaml
---
title: "书名"
author: "作者"
created: 2026-03-07
rating: 5
tags: [design, psychology]
---
```

### 访问方式

```dataview
// 直接访问字段名
TABLE title, author, rating
FROM "Books"

// 通过 file.frontmatter 访问
TABLE file.frontmatter.title, file.frontmatter.author
FROM "Books"
```

## ⚠️ 常见错误：混淆内置字段和自定义字段

### 错误示例 1：使用 `created` 而非 `file.ctime`

```dataview
// ❌ 错误：created 是自定义字段，不是所有笔记都有
TABLE title, created
FROM ""
WHERE created >= date(today) - dur(7 days)

// ✅ 正确：使用 file.ctime（Obsidian 自动提供）
TABLE title, file.ctime
FROM ""
WHERE file.ctime >= date(today) - dur(7 days)
```

### 错误示例 2：使用 `tags` 而非 `file.tags`

```dataview
// ❌ 错误：tags 是自定义字段，需要先添加到 frontmatter
TABLE tags
FROM ""

// ✅ 正确：使用 file.tags（自动从 frontmatter 和内联标签收集）
TABLE file.tags
FROM ""
```

## 📋 内置字段 vs 自定义字段对比

| 功能 | 内置字段 | 自定义字段 |
|------|----------|------------|
| **是否存在** | 所有文件都有 | 只有添加了的文件才有 |
| **null 检查** | 通常不需要（如 `file.ctime`） | **必须检查**（如 `created`） |
| **访问方式** | `file.fieldname` | 直接 `fieldname` 或 `file.frontmatter.fieldname` |
| **示例** | `file.ctime`, `file.mtime`, `file.path` | `title`, `author`, `rating` |
| **用途** | 文件管理、时间查询 | 业务数据、内容元数据 |

## 🎯 实用查询模板

### 按创建时间查询

```dataview
// 使用 file.ctime（推荐）
TABLE title, file.ctime
FROM ""
WHERE file.ctime >= date(today) - dur(7 days)
SORT file.ctime DESC
```

### 按修改时间查询

```dataview
// 最近修改的文件
TABLE title, file.mtime
FROM ""
WHERE file.mtime >= date(today) - dur(7 days)
SORT file.mtime DESC
```

### 按文件大小查询

```dataview
// 最大的文件
TABLE title, file.size
FROM ""
SORT file.size DESC
LIMIT 10
```

### 按文件夹分组

```dataview
// 每个文件夹的笔记数量
TABLE
  file.folder,
  count(rows) AS "笔记数"
FROM ""
GROUP BY file.folder
SORT count(rows) DESC
```

### 查找孤立笔记（没有反向链接）

```dataview
TABLE title, file.path
FROM ""
WHERE length(file.inlinks) = 0
```

### 查找连接最多的笔记

```dataview
TABLE title, length(file.inlinks) AS "被引用次数"
FROM ""
SORT length(file.inlinks) DESC
LIMIT 10
```

## 🔄 字段映射关系

| 主题 | 常用自定义字段 | 对应的内置字段 |
|------|----------------|----------------|
| **时间** | `created`, `completed`, `due` | `file.ctime`, `file.mtime` |
| **标识** | `title`, `name` | `file.name` |
| **分类** | `category`, `folder` | `file.folder` |
| **标签** | `tags`（自定义） | `file.tags`（自动收集） |
| **链接** | `related_*` | `file.inlinks`, `file.outlinks` |

## 💡 最佳实践

### 1. 时间相关查询

**使用 `file.ctime` 作为默认选择**：
- ✅ 所有文件都有
- ✅ 不需要 null 检查
- ✅ 性能更好（Obsidian 索引）

**使用自定义 `created` 字段的场景**：
- 需要记录"内容创建时间"而非"文件创建时间"
- 文件复制/移动后保持原时间
- 与外部系统同步（如从 Notion 导入）

### 2. 标签处理

```dataview
// 方式1：使用 file.tags（推荐）
TABLE title, file.tags
FROM "Books"
WHERE file.tags INCLUDES "design"

// 方式2：直接使用 tags（需要 frontmatter 中定义）
TABLE title, tags
FROM "Books"
WHERE tags INCLUDES "design"
```

### 3. 混合使用内置字段和自定义字段

```dataview
// 组合查询
TABLE
  title,
  file.ctime AS "文件创建",
  created AS "内容创建",
  author
FROM "Books"
WHERE file.ctime >= date(today) - dur(30 days)
WHERE rating != null
SORT rating DESC
```

## 🔍 调试技巧

### 查看所有内置字段

```dataview
TABLE WITHOUT ID
  file.name,
  file.ctime,
  file.mtime,
  file.size,
  file.folder,
  file.tags
FROM ""
LIMIT 5
```

### 查看所有自定义字段

```dataw
TABLE WITHOUT ID
  file.frontmatter
FROM ""
LIMIT 5
```

### 检查字段是否存在

```dataview
TABLE WITHOUT ID
  title,
  typeof(created) AS "created类型",
  typeof(file.ctime) AS "file.ctime类型"
FROM "Books"
LIMIT 5
```

## 📚 快速参考

### 常用内置字段速查

```dataview
// 文件路径
file.path           // 完整路径
file.folder         // 文件夹
file.name           // 文件名（不含扩展名）

// 时间
file.ctime          // 创建时间
file.mtime          // 修改时间

// 元数据
file.tags           // 所有标签
file.inlinks        // 反向链接
file.outlinks       // 外部链接
file.size           // 文件大小

// 链接对象
file.link           // 文件链接
```

### null 安全性速查

| 字段类型 | 是否需要 null 检查 |
|----------|-------------------|
| `file.ctime` | ❌ 不需要（所有文件都有） |
| `file.mtime` | ❌ 不需要（所有文件都有） |
| `file.path` | ❌ 不需要（所有文件都有） |
| `file.size` | ❌ 不需要（所有文件都有） |
| `file.tags` | ❌ 不需要（可能为空数组，但不是 null） |
| `created` | ✅ 需要（自定义字段） |
| `author` | ✅ 需要（自定义字段） |
| `rating` | ✅ 需要（自定义字段） |

## 🔗 相关资源

- [[Dataview查询指南]] - 完整语法参考
- [[Dataview错误处理最佳实践]] - 错误处理技巧
- [Dataview 官方文档 - Metadata](https://blacksmithgu.github.io/obsidian-dataview/data-annotations/)
