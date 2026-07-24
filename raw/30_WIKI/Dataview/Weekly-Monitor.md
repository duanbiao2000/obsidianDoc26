---
tags: [dashboard, monitor, weekly]
created: 2026-07-24
updated: 2026-07-24
aliases: [Weekly Monitor, Project Monitor, Weekly Review]
cssclasses: [dashboard]
---

# 📊 Weekly Project Monitor

> **Last updated:** `= dateformat(date(today), "yyyy-MM-dd EEEE")`
> Tracks changes across the vault — open every Sunday for weekly review.

---

## 🆕 New `.md` Files This Week

```dataview
TABLE WITHOUT ID
  file.link AS "Note",
  dateformat(file.cday, "MM-dd EEE") AS "Created",
  file.folder AS "Location"
FROM "raw"
WHERE file.cday >= date(today) - dur(7 days)
  AND file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
SORT file.cday DESC
LIMIT 30
```

---

## ✏️ Recently Modified `.md` Files

```dataview
TABLE WITHOUT ID
  file.link AS "Note",
  dateformat(file.mtime, "MM-dd EEE HH:mm") AS "Modified",
  file.folder AS "Location"
FROM "raw"
WHERE file.mtime >= date(today) - dur(7 days)
  AND file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.name, "MOC")
SORT file.mtime DESC
LIMIT 30
```

---

## 📂 Activity by Folder

```dataview
TABLE
  length(rows) AS "Changes",
  dateformat(max(rows.file.mtime), "MM-dd") AS "Latest"
FROM "raw"
WHERE file.mtime >= date(today) - dur(7 days)
  AND file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
  AND !contains(file.name, "MOC")
GROUP BY file.folder
SORT length(rows) DESC
LIMIT 15
```

---

## 📈 Vault Stats Snapshot

```dataview
TABLE WITHOUT ID
  "Total notes" AS "Metric",
  length(rows) AS "Count"
FROM "raw"
WHERE file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")

SORT length(rows) DESC
LIMIT 1
```

```dataview
TABLE WITHOUT ID
  "New this week" AS "Metric",
  length(rows) AS "Count"
FROM "raw"
WHERE file.cday >= date(today) - dur(7 days)
  AND file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
LIMIT 1
```

```dataview
TABLE WITHOUT ID
  "Modified this week" AS "Metric",
  length(rows) AS "Count"
FROM "raw"
WHERE file.mtime >= date(today) - dur(7 days)
  AND file.extension = "md"
  AND !contains(file.path, ".obsidian")
  AND !contains(file.path, "04_Archive")
  AND !contains(file.path, "90_Attachments")
LIMIT 1
```

---

> **Tip:** Pin this note or the [[30_WIKI/Canvas/Project-Monitor|Project Monitor canvas]] for quick access on Sundays.
