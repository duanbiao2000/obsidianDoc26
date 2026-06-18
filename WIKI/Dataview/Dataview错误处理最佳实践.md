---
type: dataview
category: best-practices
created: 2026-03-07
tags: [dataview, troubleshooting, null-safety]
---

# Dataview 错误处理最佳实践

> 常见错误及解决方案，确保查询稳定运行。

## 🔴 常见错误：`Cannot call type 'null' as a function`

### 错误原因

当笔记的字段（如 `created`, `due`, `completed`）为 `null` 或不存在时，直接使用日期函数会导致错误：

```dataview
// ❌ 错误：某些笔记的 created 字段为 null
TABLE title, created
FROM ""
WHERE created >= date(today) - dur(7 days)
```

**错误信息**:

```
Dataview: Every row during operation 'where' failed with an error;
- Cannot call type 'null' as a function
```

## ✅ 解决方案：Null 检查

### 方法 1: WHERE 子句中检查

在日期比较之前，先检查字段是否存在：

```dataview
// ✅ 正确
TABLE title, created
FROM ""
WHERE created != null
  AND created >= date(today) - dur(7 days)
SORT created DESC
```

### 方法 2: 使用 COALESCE 提供默认值

```dataview
// ✅ 使用默认日期
TABLE title, coalesce(created, date("1970-01-01")) AS "创建日期"
FROM ""
WHERE coalesce(created, date("1970-01-01")) >= date(today) - dur(7 days)
```

### 方法 3: 限制数据源范围

```dataview
// ✅ 只查询有该字段的文件夹
TABLE title, created
FROM "Books"
WHERE created >= date(today) - dur(7 days)
```

## 📋 检查清单

### 日期字段查询

| 字段 | Null 检查示例 |
|------|-------------|
| `created` | `WHERE created != null AND created >= ...` |
| `completed` | `WHERE completed != null AND completed >= ...` |
| `due` | `WHERE due != null AND due >= ...` |
| `started` | `WHERE started != null AND started >= ...` |
| `target_end` | `WHERE target_end != null AND target_end >= ...` |

### 日期运算

```dataview
// ❌ 错误：可能导致 null 运算
TABLE (completed - started).format("d天")
FROM "Books"

// ✅ 正确：先检查字段
TABLE (completed - started) AS "时长"
FROM "Books"
WHERE completed != null AND started != null
```

### 列表操作

```dataview
// ✅ 检查列表是否存在再展开
FLATTEN tags AS tag
WHERE tag != null
```

## 🎯 最佳实践模板

### 按时间范围查询

```dataview
TABLE title, created
FROM "Books"
WHERE created != null
  AND created >= date(today) - dur(7 days)
SORT created DESC
```

### 计算时间差

```dataview
TABLE
  title,
  (completed - started) AS "时长(天)"
FROM "Work"
WHERE completed != null
  AND started != null
  AND completed > started
SORT (completed - started) DESC
```

### 日期范围筛选

```dataview
TABLE title, due
FROM "Work"
WHERE due != null
  AND due >= date(today)
  AND due <= date(today) + dur(7 days)
SORT due ASC
```

### 数值计算（避免除零）

```dataview
TABLE
  title,
  actual_hours,
  estimated_hours,
  (actual_hours / estimated_hours) AS "比率"
FROM "Work"
WHERE actual_hours != null
  AND estimated_hours != null
  AND estimated_hours > 0  -- 避免除零
```

## 🚨 其他常见错误

### 1. 字段不存在

**错误**: `No such field`

```dataview
// ❌ 字段名拼写错误
TABLE titel  // 拼写错误
FROM "Books"

// ✅ 正确
TABLE title
FROM "Books"
```

### 2. 类型不匹配

**错误**: `Cannot perform arithmetic on type 'string'`

```dataview
// ❌ 字段是字符串类型
TABLE (actual_hours / estimated_hours)
FROM "Work"

// ✅ 确保字段是数值类型（在 frontmatter 中定义）
TABLE (actual_hours / estimated_hours)
FROM "Work"
WHERE actual_hours != null AND estimated_hours != null
```

### 3. 列表索引越界

**错误**: `Index out of bounds`

```dataview
// ❌ 列表为空时访问索引
TABLE tags[0]
FROM "Books"

// ✅ 使用 FLATTEN 或检查长度
TABLE tags
FROM "Books"
FLATTEN tags AS tag
WHERE tag != null
```

## 🔧 调试技巧

### 1. 逐步简化查询

```dataview
// 第1步：最简查询
TABLE title
FROM "Books"

// 第2步：添加字段
TABLE title, created
FROM "Books"

// 第3步：添加简单条件
TABLE title, created
FROM "Books"
WHERE created != null

// 第4步：添加复杂条件
TABLE title, created
FROM "Books"
WHERE created != null AND created >= date(today) - dur(7 days)
```

### 2. 使用 TABLE WITHOUT ID

```dataview
// 调试时查看所有字段
TABLE WITHOUT ID
  title,
  created,
  completed,
  reading_status
FROM "Books"
LIMIT 5
```

### 3. 检查数据类型

```dataview
// 查看字段类型
TABLE WITHOUT ID
  typeof(created) AS "类型",
  created
FROM "Books"
LIMIT 5
```

## 📊 性能优化

### 1. 限制查询范围

```dataview
// ✅ 好：只查询特定文件夹
FROM "Books"

// ❌ 差：查询整个库
FROM ""
```

### 2. 先过滤再运算

```dataview
// ✅ 好：先过滤再计算
TABLE title, (completed - started)
FROM "Books"
WHERE reading_status = "completed"
WHERE completed != null AND started != null

// ❌ 差：对所有行计算
TABLE title, (completed - started)
FROM "Books"
WHERE reading_status = "completed"
```

### 3. 使用 LIMIT

```dataview
// ✅ 限制结果数量
TABLE title, created
FROM ""
WHERE created != null
SORT created DESC
LIMIT 50
```

## 🔗 相关资源

- [[Dataview查询指南]] - 完整语法参考
- [[总览仪表板]] - 查询示例
- [Dataview 官方文档](https://blacksmithgu.github.io/obsidian-dataview/)

## ✅ 快速参考

### Null 检查模板

```dataview
// 日期字段
WHERE field != null AND field >= ...

// 数值字段
WHERE field != null AND field > 0

// 列表字段
FLATTEN list AS item
WHERE item != null

// 多字段检查
WHERE field1 != null
  AND field2 != null
  AND field1 >= field2
```

### 常用日期范围

```dataview
// 今天
WHERE date = date(today)

// 本周
WHERE date >= date(today) AND date <= date(today) + dur(7 days)

// 本月
WHERE dateformat(date, "yyyy-MM") = dateformat(date(today), "yyyy-MM")

// 最近 N 天
WHERE date != null AND date >= date(today) - dur(N days)
```
