---
tags: [dashboard, recent]
created: 2026-06-26
---

## 🕒 最近活动

### 今天修改的笔记

```dataview
TABLE
  dateformat(file.mtime, "HH:mm") AS "时间",
  file.folder AS "位置"
FROM ""
WHERE file.mtime >= date(today)
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.path, ".obsidian")
SORT file.mtime DESC
LIMIT 15
```

## 近 7 天高频修改区域

```dataview

TABLE
  length(rows) AS "修改次数"
FROM ""
WHERE file.mtime >= date(today) - dur(7 days)
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
GROUP BY file.folder
SORT length(rows) DESC
LIMIT 10
```

近 7 天所有改动

```dataview

TABLE WITHOUT ID
  file.link AS "笔记",
  dateformat(file.mtime, "MM-dd HH:mm") AS "时间"
FROM ""
WHERE file.mtime >= date(today) - dur(7 days)
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.name, "MOC")
SORT file.mtime DESC
LIMIT 25
```
