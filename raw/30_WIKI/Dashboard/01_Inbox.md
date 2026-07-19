---
tags: [dashboard, inbox]
created: 2026-06-26
---

## 📥 Inbox 处理区

### 当前积压（按修改时间）

```dataview
TABLE
  dateformat(file.mtime, "MM-dd HH:mm") AS "最后修改",
  length(file.outlinks) AS "出链",
  length(file.tasks) AS "任务"
FROM "00_Inbox"
WHERE file.ext = "md"
SORT file.mtime DESC
LIMIT 20
```

