---
tags: [moc, journal]
created: 2026-06-26
---

# 📓 日志与反思 MOC

## 最近日志

```dataview
TABLE file.cday as "创建日期"
FROM "05_Journals/Daily"
SORT file.name DESC
LIMIT 30
```

## 反思记录

```dataview
LIST
FROM "05_Journals/Reflection"
SORT file.name DESC
```

## 本周新增

```dataview
LIST
FROM "05_Journals"
WHERE file.cday >= date(today) - dur(7 days)
SORT file.cday DESC
```

---

> [!tip] 周日回顾流程
>
> 1. 扫一遍本周 Daily，标记有价值段落
> 2. 将可复用内容提取到对应 Area
> 3. 在 Reflection 写一条周总结
