---
tags: [dashboard, journal]
created: 2026-06-26
---

## 📓 日志中心

### 最近 Daily

```dataview
TABLE WITHOUT ID
  file.link AS "日志",
  dateformat(file.mtime, "MM-dd HH:mm") AS "修改"
FROM "05_Journals/Daily"
SORT file.name DESC
LIMIT 10
```

最近 Reflection

```dataview

TABLE WITHOUT ID
  file.link AS "反思",
  dateformat(file.mtime, "yyyy-MM-dd") AS "修改"
FROM "05_Journals/Reflection"
SORT file.name DESC
LIMIT 5
```

本周写作统计

```dataview

TABLE WITHOUT ID
  file.link AS "条目",
  file.size AS "字节数"
FROM "05_Journals"
WHERE file.mtime >= date(today) - dur(7 days)
  AND file.ext = "md"
  AND !contains(file.name, "MOC")
SORT file.mtime DESC
```

⏰ 周日提醒
[!tip] 周回顾流程

浏览本周 Daily，标记可复用段落
把段落迁移到对应 Area 笔记
在 Reflection 写一条本周总结
运行 obsweekly 完成自动维护
