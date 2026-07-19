---
type: dataview
category: fix-summary
created: 2026-03-07
tags: [dataview, fix, dur-function]
---

# 修复总结：使用 dur() 替代 relative()

## ✅ 问题已解决

### 问题

Dataview 查询中使用 `.relative()` 函数时报错：

```
Cannot call type 'null' as a function
```

### 根本原因

`.relative()` 函数在 Dataview 的某些版本中不稳定或已废弃。

### 解决方案

**使用 `dur()` 函数替代**：

| 旧语法（不工作） | 新语法（工作） |
|-----------------|---------------|
| `date(today).relative(-7, "days")` | `date(today) - dur(7 days)` |
| `date(today).relative(7, "days")` | `date(today) + dur(7 days)` |
| `date(today).relative(-1, "month")` | `date(today) - dur(30 days)` |

## 📋 已更新的文件

### ✅ 已修复（8个文件）

| 文件 | 更新内容 |
|------|----------|
| **字段速查表.md** | ✅ 所有 `.relative()` → `dur()` |
| **工作管理仪表板.md** | ✅ 本周任务查询 |
| **项目追踪仪表板.md** | ✅ 即将到来的里程碑查询 |
| **总览仪表板.md** | ✅ 本月日记查询 |
| **Dataview查询指南.md** | ✅ 示例查询（用户已手动修改） |
| **Dataview错误处理最佳实践.md** | ✅ 所有示例查询 |
| **Obsidian内置字段完全指南.md** | ✅ 所有实用查询模板 |
| **诊断测试.md** | ✅ 新创建的测试文件 |

### 📚 保留示例（1个文件）

- **日期函数替代方案.md** - 保留 `.relative()` 作为反面教材示例

## 🎯 正确的查询示例

### 最近7天创建的笔记

```dataview
TABLE title, file.ctime
FROM ""
WHERE file.ctime >= date(today) - dur(7 days)
SORT file.ctime DESC
```

### 本周到期的任务

```dataview
TABLE title, due
FROM "Work"
WHERE due != null
  AND due >= date(today)
  AND due <= date(today) + dur(7 days)
SORT due ASC
```

### 本月创建的笔记

```dataview
TABLE title, file.ctime
FROM ""
WHERE file.ctime >= date(today) - dur(30 days)
SORT file.ctime DESC
```

## 📊 时间范围速查表

| 时间范围 | 查询语法 |
|----------|----------|
| **最近7天** | `date(today) - dur(7 days)` |
| **最近30天** | `date(today) - dur(30 days)` |
| **最近90天** | `date(today) - dur(90 days)` |
| **未来7天** | `date(today) + dur(7 days)` |
| **未来30天** | `date(today) + dur(30 days)` |
| **本月** | `dateformat(date, "yyyy-MM") = dateformat(date(today), "yyyy-MM")` |
| **本年** | `dateformat(date, "yyyy") = dateformat(date(today), "yyyy")` |

## 💡 dur() 函数的优势

1. ✅ **稳定性**: 在所有 Dataview 版本中工作
2. ✅ **简洁性**: 语法更直观（加/减法）
3. ✅ **灵活性**: 支持任意天数组合
4. ✅ **性能**: 比字符串比较更快

## 🔧 常见 dur() 用法

### 基础用法

```dataview
// 减去时间
date(today) - dur(7 days)
date(today) - dur(12 hours)
date(today) - dur(30 minutes)

// 加上时间
date(today) + dur(7 days)
date(today) + dur(1 week)  // 某些版本支持
```

### 组合查询

```dataview
// 时间范围
WHERE date >= date(today) - dur(7 days)
  AND date <= date(today) + dur(7 days)

// 相对某个日期
WHERE date >= date("2026-03-01") - dur(7 days)
```

## 🚨 避免的陷阱

### ❌ 不要使用 .relative()

```dataview
// ❌ 不工作
WHERE date >= date(today).relative(-7, "days")
```

### ✅ 使用 dur()

```dataview
// ✅ 工作
WHERE date >= date(today) - dur(7 days)
```

## 📚 相关文档

- [[Dataview查询指南]] - 完整语法参考
- [[字段速查表]] - 快速查找正确的字段
- [[Obsidian内置字段完全指南]] - 字段详细说明
- [[诊断测试]] - 测试 Dataview 查询

## 🎓 学到的经验

1. **优先使用内置函数**: `dur()` 比 `.relative()` 更可靠
2. **测试基础查询**: 遇到问题时，从最简单的查询开始测试
3. **检查文件类型**: 使用 `file.ctime` 而非自定义的 `created` 字段
4. **系统化修复**: 批量更新所有相关文件，保持一致性

## ✅ 验证清单

- [x] 所有仪表板查询已更新
- [x] 所有示例查询已更新
- [x] 文档已同步
- [x] 创建了诊断测试文件
- [x] 创建了速查表

**状态**: ✅ 所有问题已解决
