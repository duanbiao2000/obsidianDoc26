# MOC Maintenance Guide

**Version**: 1.0  
**Date**: 2026-07-01  
**Purpose**: 规范 MOC（Map of Content）页面的维护与更新机制，确保知识图谱结构长期清晰。

---

## 1. MOC 更新原则

- **MOC 是导航节点，不是内容容器**。应保持简洁。
- **新增页面时必须考虑是否需要链接到对应 MOC**。
- **优先维护高价值 MOC**：`MOC-Wiki`、`MOC-Concepts`、`MOC-Meta`。
- **定期检查**比实时更新更重要。

---

## 2. 更新触发时机

| 触发场景 | 操作建议 | 责任 |
|----------|----------|------|
| 新建 `concept` 类型页面 | 检查是否需要加入 `MOC-Concepts` | 创建者 |
| 新建 `method` / `template` / `quickref` 类型页面 | 检查是否需要加入 `MOC-Meta` | 创建者 |
| 新建重要领域页面（如 `areas/English.md`） | 在 `MOC-Wiki` 中添加子 MOC 链接 | 创建者 |
| 每月末 | 对 `MOC-Concepts` 和 `MOC-Meta` 进行一次全面检查 | 维护者 |

---

## 3. 推荐更新流程

### 手动更新（当前推荐）

1. 新建页面后，在对应 MOC 中添加一行链接。
2. 使用简洁格式：

   ```markdown
   - [[页面名称]] — 简要说明（可选）
   ```

### 半自动辅助（未来可优化）

可使用 Dataview 查询辅助检查遗漏：

```dataview
TABLE WITHOUT ID file.link AS "未收录页面"
FROM "wiki/concepts"
WHERE !contains(outgoing([[]]), [MOC-Concepts])
```

---

## 4. MOC 维护检查清单

每月检查时使用：

- [ ] `MOC-Wiki` 是否链接了所有重要子 MOC？
- [ ] `MOC-Concepts` 是否收录了近期新增的重要概念？
- [ ] `MOC-Meta` 是否收录了近期新增的方法/模板/Skill？
- [ ] 是否存在大量孤立页面（无 MOC 链接）？
- [ ] MOC 页面本身是否过于臃肿，需要精简？

---

## 5. 自动化支持

推荐使用脚本辅助 MOC 维护：

```bash
python wiki/meta/scripts/update-moc.py
```

该脚本会自动扫描未被收录的新页面，并给出更新建议。

详细说明请参考：`wiki/meta/scripts/README.md`

## 6. 长期建议

- 当某个领域内容超过 **15 个页面** 时，考虑为其创建独立 MOC（如 `MOC-English`、`MOC-Career`）。
- 避免在 MOC 中堆砌过多链接，保持 Graph View 的可读性。
- 重要 MOC 的更新记录可简要写入 `wiki/LOG.md`。

---

*本指南与 `MOC-Wiki.md`、`MOC-Concepts.md`、`MOC-Meta.md` 配合使用。*
