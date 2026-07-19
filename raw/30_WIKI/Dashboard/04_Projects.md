---
tags: [dashboard, projects]
created: 2026-06-26
---

## 🔥 项目雷达

### 活跃项目（最近 30 天有更新）

```dataview
TABLE WITHOUT ID
  file.link AS "项目 MOC",
  dateformat(file.mtime, "yyyy-MM-dd") AS "最近更新"
FROM "01_Projects"
WHERE contains(file.name, "MOC")
  AND file.mtime >= date(today) - dur(30 days)
SORT file.mtime DESC

```

## 沉睡项目（超过 30 天未更新）

```dataview

TABLE WITHOUT ID
  file.link AS "项目",
  dateformat(file.mtime, "yyyy-MM-dd") AS "最后更新",
  dur(date(today) - file.mtime).days AS "沉睡天数"
FROM "01_Projects"
WHERE contains(file.name, "MOC")
  AND file.mtime < date(today) - dur(30 days)
SORT file.mtime 
```

## 各项目笔记数量

```dataview

TABLE WITHOUT ID
  key AS "项目",
  length(rows) AS "笔记数"
FROM "01_Projects"
WHERE file.ext = "md"
  AND !contains(file.name, "MOC")
  AND !contains(file.folder, "Attachments")
  AND !endswith(file.name, ".excalidraw")
GROUP BY choice(
  file.folder = "01_Projects",
  "根目录",
  split(file.folder, "/")[1]
)
SORT length(rows) DESC
```
