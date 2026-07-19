---
tags: [dashboard, health]
created: 2026-06-26
---

## 🩺 知识库健康监测

### 全库统计

```dataview
TABLE WITHOUT ID
  "总文件数" AS "指标",
  length(rows) AS "数量"
FROM ""
WHERE file.ext = "md"
  AND !contains(file.path, ".obsidian")
GROUP BY true
```

## 各大区域规模

```dataview

TABLE WITHOUT ID
  split(file.folder, "/")[0] AS "区域",
  length(rows) AS "笔记数"
FROM ""
WHERE file.ext = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "90_Attachments")
GROUP BY split(file.folder, "/")[0]
SORT length(rows) DESC
```

⚠️ 缺少 tags 的笔记

```dataview

LIST
FROM ""
WHERE file.ext = "md"
  AND (tags = null OR length(tags) = 0)
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "Templates")
SORT file.mtime DESC
LIMIT 15
```

## 🗑️ 疑似空文件（< 200 字节）

```dataview

TABLE WITHOUT ID
  file.link AS "笔记",
  file.size AS "字节"
FROM ""
WHERE file.ext = "md"
  AND file.size < 200
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.path, "Templates")
SORT file.size ASC
LIMIT 15
```

## 🔍 长期未更新（> 180 天）的非 Archive 笔记

```dataview

TABLE WITHOUT ID
  file.link AS "笔记",
  dateformat(file.mtime, "yyyy-MM-dd") AS "最后更新",
  file.folder AS "位置"
FROM ""
WHERE file.ext = "md"
  AND file.mtime < date(today) - dur(180 days)
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.path, "Templates")
  AND !contains(file.path, "OKF")
SORT file.mtime ASC
LIMIT 15
```
