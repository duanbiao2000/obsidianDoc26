---
type: dataview
category: index
created: 2026-03-07
tags: [dataview, index]
---

# Dataview 模块化查询系统 - 索引

> 完整的 Dataview 查询文档和仪表板系统。

## 📚 文档导航

### 🔰 快速入门
1. [[字段速查表]] - **推荐首先阅读** - 快速查找正确的字段
2. [[Dataview查询指南]] - 完整的语法和示例
3. [[修复总结-dur函数替代relative]] - 最近的修复记录

### 📊 仪表板（活跃查询）
- [[总览仪表板]] - 全局视图，所有笔记类型统计
- [[工作管理仪表板]] - 任务追踪、优先级、进度
- [[项目追踪仪表板]] - 项目状态、预算、里程碑
- [[阅读进度仪表板]] - 阅读清单、进度、评分

### 📑 索引（静态查询）
- [[人物索引]] - 按国籍、职业、时代索引
- [[工具索引]] - 按类别、平台、状态索引
- [[研究笔记索引]] - 按类型、领域、分类索引

### 🛠️ 技术文档
- [[Obsidian内置字段完全指南]] - file.* 字段完整列表
- [[Dataview错误处理最佳实践]] - 常见错误及解决方案
- [[日期函数替代方案]] - 时间查询的多种方法

### 🔧 诊断与测试
- [[诊断测试]] - 逐步测试查询功能

## 🎯 按场景查找

### 我想...

| 场景 | 查看文档 |
|------|----------|
| **查询最近创建的笔记** | [[字段速查表#时间字段对比]] |
| **追踪工作任务** | [[工作管理仪表板]] |
| **管理项目进度** | [[项目追踪仪表板]] |
| **管理阅读清单** | [[阅读进度仪表板]] |
| **查找人物笔记** | [[人物索引]] |
| **查找工具笔记** | [[工具索引]] |
| **查询出错** | [[Dataview错误处理最佳实践]] |
| **学习 Dataview 语法** | [[Dataview查询指南]] |

## 📋 文件结构

```
Dataview/
├── README-索引.md                    # 本文件
│
├── 📊 仪表板（4个）
│   ├── 总览仪表板.md
│   ├── 工作管理仪表板.md
│   ├── 项目追踪仪表板.md
│   └── 阅读进度仪表板.md
│
├── 📑 索引（3个）
│   ├── 人物索引.md
│   ├── 工具索引.md
│   └── 研究笔记索引.md
│
├── 📚 文档（5个）
│   ├── 字段速查表.md                  # ⭐ 推荐
│   ├── Dataview查询指南.md
│   ├── Obsidian内置字段完全指南.md
│   ├── Dataview错误处理最佳实践.md
│   └── 日期函数替代方案.md
│
└── 🔧 诊断（2个）
    ├── 诊断测试.md
    └── 修复总结-dur函数替代relative.md
```

## 🔑 关键概念

### dur() 函数（推荐）

✅ **使用**:
```dataview
WHERE file.ctime >= date(today) - dur(7 days)
```

❌ **避免**:
```dataview
WHERE file.ctime >= date(today).relative(-7, "days")
```

### file.ctime vs created

| 字段 | 类型 | 是否需要 null 检查 | 用途 |
|------|------|-------------------|------|
| `file.ctime` | 内置 | ❌ 不需要 | 文件创建时间 |
| `created` | 自定义 | ✅ 需要 | 内容创建时间 |

### 常用查询模板

```dataview
// 最近7天
WHERE file.ctime >= date(today) - dur(7 days)

// 本周范围
WHERE date >= date(today) AND date <= date(today) + dur(7 days)

// 本月
WHERE dateformat(date, "yyyy-MM") = dateformat(date(today), "yyyy-MM")
```

## 🚀 快速开始

### 1. 打开仪表板

打开 [[总览仪表板]] 查看全局统计。

### 2. 使用查询模板

从 [[Dataview查询指南]] 复制查询模板到你的笔记。

### 3. 遇到问题

查看 [[诊断测试]] 和 [[Dataview错误处理最佳实践]]。

## 📝 维护日志

### 2026-03-07
- ✅ 修复 `.relative()` 函数问题，改用 `dur()`
- ✅ 更新所有仪表板查询
- ✅ 创建完整文档体系
- ✅ 添加诊断测试文件

## 🔗 外部资源

- [Dataview 插件文档](https://blacksmithgu.github.io/obsidian-dataview/)
- [Dataview GitHub](https://github.com/blacksmithgu/obsidian-dataview)
- [Obsidian 插件市场](https://obsidian.md/plugins?id=dataview)

---

**提示**: 将此文件添加到 Obsidian 的星标文件或书签，方便快速访问。
