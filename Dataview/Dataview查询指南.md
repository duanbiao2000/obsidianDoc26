---
type: dataview
category: guide
created: 2026-03-07
tags: [dataview, guide, tutorial]
---

# Dataview 查询指南

> Dataview 插件的完整使用指南，包括语法、示例和最佳实践。

## 📖 基础语法

### TABLE 查询

```sql
TABLE field1, field2
FROM "source"
WHERE condition
SORT field ASC/DESC
LIMIT number
```

**示例**:
```dataview
TABLE title, author, rating
FROM "Books"
WHERE rating >= 4
SORT rating DESC
LIMIT 10
```

### LIST 查询

```dataview
LIST field
FROM "source"
WHERE condition
```

**示例**:
```dataview
LIST title
FROM "Work"
WHERE status = "todo"
```

### TASK 查询

```dataview
TASK
WHERE condition
GROUP BY field
```

**示例**:
```dataview
TASK
  FROM "Work" OR "Projects" OR "Journals"
  WHERE !completed
  WHERE due <= date(today)
  GROUP BY file.folder
```

## 🔍 常用运算符

### 比较运算符
- `=` : 等于
- `!=` : 不等于
- `>` : 大于
- `<` : 小于
- `>=` : 大于等于
- `<=` : 小于等于

### 逻辑运算符
- `AND` : 且
- `OR` : 或
- `NOT` : 非

### 字符串匹配
- `INCLUDES` : 包含（字符串或列表）
- `CONTAINS` : 包含（子字符串）
- `STARTSWITH` : 以...开头
- `ENDSWITH` : 以...结尾

### 函数
- `date(string)` : 转换为日期
- `sum(field)` : 求和
- `mean(field)` / `average(field)` : 平均值
- `count(rows)` : 计数
- `length(list)` : 列表长度

## 📂 数据源 (FROM)

### 从文件夹
```sql
FROM "Books"
```

### 从多个文件夹
```sql
FROM "Books" OR "Journals"
```

### 从标签
```sql
FROM #book
```

### 从当前文件
```sql
FROM [[]]
```

## 🎯 实用查询模板

### 时间相关

#### 今天的任务
```dataview
TABLE title, due
FROM "Work"
WHERE due = date(today)
```

#### 本周到期
```dataview
TABLE title, due
FROM "Work"
WHERE due != null AND due >= date(today) AND due <= date(today)-dur(7 days)
SORT due ASC
```

#### 最近7天创建
```dataview
TABLE title, file.ctime
FROM ""
WHERE file.ctime >= date(today)-dur(7 days)
SORT file.ctime DESC
```

#### 按月份统计
```dataview
TABLE
  dateformat(created, "yyyy-MM") AS "月份",
  count(rows) AS "数量"
FROM "Journals"
GROUP BY dateformat(created, "yyyy-MM")
SORT dateformat(created, "yyyy-MM") DESC
```

### 状态筛选

#### 未完成任务
```dataview
TABLE title, priority, due
FROM "Work"
WHERE status != "completed" AND status != "cancelled"
SORT priority ASC, due ASC
```

#### 进行中项目
```dataview
TABLE name, phase, target_end
FROM "Projects"
WHERE status = "active"
SORT target_end ASC
```

#### 活跃工具
```dataview
TABLE name, category, version
FROM "Tools"
WHERE status = "active"
SORT category, name
```

### 数值计算

#### 超预算项目
```dataview
TABLE
  budget,
  actual_cost,
  (actual_cost - budget) AS "超预算金额",
  ((actual_cost / budget) * 100 - 100) AS "超预算(%)"
FROM "Projects"
WHERE actual_cost > budget
SORT (actual_cost - budget) DESC
```

#### 工作时统计
```dataview
TABLE
  sum(estimated_hours) AS "总估算",
  sum(actual_hours) AS "总实际",
  (sum(actual_hours) / sum(estimated_hours) * 100 - 100) AS "偏差(%)"
FROM "Work"
WHERE status = "completed"
```

### 列表操作

#### 提取标签
```dataview
TABLE tags
FROM "Books"
WHERE tags != null
FLATTEN file.tags AS tags
WHERE tags != null
GROUP BY tags
```

#### 提取列表项
```dataview
TABLE use_case
FROM "Tools"
FLATTEN use_case
WHERE use_case != null
```

#### 关联查询
```dataview
TABLE related_people
FROM "People"
WHERE related_people != null
```

### 分组与聚合

#### 按状态分组
```dataview
TABLE
  count(rows) AS "数量"
FROM "Work"
GROUP BY status
```

#### 按类别分组并排序
```dataview
TABLE
  count(rows) AS "数量"
FROM "Books"
GROUP BY category
SORT count(rows) DESC
```

#### 多级分组
```dataview
TABLE
  count(rows) AS "数量"
FROM "Projects"
GROUP BY status, phase
```

## 🎨 高级技巧

### 条件格式化
```dataview
TABLE
  priority,
  choice(priority = "P0", "🔴 紧急",
    choice(priority = "P1", "🟡 重要",
      choice(priority = "P2", "🟢 普通", "🔵 低"))) AS "优先级图标"
FROM "Work"
```

### 日期格式化
```dataview
TABLE
  dateformat(created, "yyyy-MM-dd") AS "创建日期",
  dateformat(completed, "yyyy-MM-dd HH:mm") AS "完成时间"
FROM "Work"
WHERE status = "completed"
```

### 链接文件
```dataview
TABLE
  link(file.link, title) AS "标题",
  file.path AS "路径"
FROM "Books"
SORT title ASC
```

### 组合字段
```dataview
TABLE
  (author + " (" + publication_year + ")") AS "作者(年份)",
  category AS "分类"
FROM "Books"
```

### 计算时间差
```dataview
TABLE
  title,
  (completed - started) AS "阅读时长(天)"
FROM "Books"
WHERE reading_status = "completed"
WHERE completed != null AND started != null
```

## 🚀 性能优化

### 限制结果数量
```dataview
TABLE title
FROM ""
LIMIT 50
```

### 只查询需要的文件夹
```dataview
TABLE title
FROM "Books"
WHERE reading_status = "completed"
```
// 比 `FROM ""` 更快

### 避免复杂计算
// 不推荐：计算所有文件的时间差
```dataview
TABLE (date(today) - created).days
FROM ""
```

// 推荐：预先过滤
```dataview
TABLE (date(today) - created).days
FROM "Books"
WHERE created > date("2026-01-01")
```

## 📝 最佳实践

### 1. 使用有意义的字段名
```dataview
// ❌ 不好
TABLE f1, f2, f3

// ✅ 好
TABLE title, author, rating
```

### 2. 添加清晰的 WHERE 条件
```dataview
// ❌ 不好：返回所有数据
TABLE title
FROM ""

// ✅ 好：只返回需要的数据
TABLE title
FROM "Work"
WHERE status != "completed"
```

### 3. 使用 SORT 使结果有序
```dataview
// ✅ 按优先级和日期排序
TABLE title, due, priority
FROM "Work"
SORT priority ASC, due ASC
```

### 4. 适当使用 LIMIT
```dataview
// ✅ 只显示最近10项
TABLE title, created
FROM "Journals"
SORT created DESC
LIMIT 10
```

### 5. 注释复杂查询
```dataview
// 查找所有高优先级且本周到期的任务
TABLE title, priority, due
FROM "Work"
WHERE (priority = "P0" OR priority = "P1")
  AND due != null
  AND due <= date(today) + dur(7 days)
SORT priority ASC, due ASC
```

## 🔗 相关资源

### 官方文档
- [Dataview 插件文档](https://blacksmithgu.github.io/obsidian-dataview/)
- [查询语法参考](https://blacksmithgu.github.io/obsidian-dataview/query/queries/)

### 示例查询
- [[总览仪表板]]
- [[工作管理仪表板]]
- [[项目追踪仪表板]]
- [[阅读进度仪表板]]

### 高级用法
- [[Dataview 插件高级功能]]
- [[Dataview 与 Lua 脚本结合]]


