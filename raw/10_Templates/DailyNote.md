---
tags:
  - journal/daily
created: <% tp.date.now("YYYY-MM-DD") %>
week: <% tp.date.now("YYYY-WW") %>
mood: <% await tp.system.suggester(["😊 愉快/开心", "🚀 动力澎湃/高能", "🌟 平静/温和", "🥱 疲惫/无力", "😔 情绪低落", "🤯 压力山大/焦虑"], ["😊", "🚀", "🌟", "🥱", "😔", "🤯"]) %> 
energy: <% await tp.system.suggester(["⚡⚡⚡ 满电", "⚡⚡ 正常", "⚡ 低电"], ["⚡⚡⚡", "⚡⚡", "⚡"]) %> 
focus: <% await tp.system.suggester(["🎯🎯🎯 极度专注", "🎯🎯 中等专注", "🎯 涣散分心"], ["🎯🎯🎯", "🎯🎯", "🎯"]) %>
---

# <% tp.date.now("YYYY-MM-DD ddd") %>

## 📥 输入
>
> 今天读了、看了、听了什么？

## 🧠 思考
>
> 今天想到的、总结的、领悟的

## ✅ 完成
>
> 今天完成了什么？哪怕一件小事

## ⚡ 亮点
>
> 今天最开心的、最有收获的一刻

## 📝 待办
>
> 明天最重要的一件事

## 今日任务

- [ ] 待办1 📅 <% tp.date.now("YYYY-MM-DD") %>
- [ ] 待办2 📅 <% tp.date.now("YYYY-MM-DD") %>
- [ ] 待办3 📅 <% tp.date.now("YYYY-MM-DD") %>

## 最近7日回溯

```dataview
TABLE mood, energy, focus
FROM "05_Journals/Daily"
WHERE created >= date(today) - dur(7 days)
SORT created DESC
```

## 自由记录
