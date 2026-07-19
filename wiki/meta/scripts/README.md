# Scripts

本目录存放 Wiki 维护相关的辅助脚本。

## 可用脚本

### `update-moc.py`

**功能**：扫描 `wiki/` 目录，检测未被 MOC 收录的新页面，并给出更新建议。

**使用方法**：

```bash
cd /home/user
python wiki/meta/scripts/update-moc.py
```

**输出示例**：

```
📌 需要更新: MOC-Concepts.md (concept)
   发现 3 个未收录页面：

   - [[Oral-Fluency-First-Principles]] — Oral-Fluency-First-Principles
     (concepts/Oral-Fluency-First-Principles.md)
```

**当前支持的 MOC**：

- `concept` → `concepts/MOC-Concepts.md`
- `method` / `template` / `quickref` → `meta/MOC-Meta.md`

**注意事项**：

- 脚本采用**建议模式**，不会自动修改 MOC 文件。
- 建议每月或在批量添加内容后运行一次。

---

## 未来扩展方向

- 增加自动将页面链接写入 MOC 的功能（需谨慎设计）
- 支持更多 MOC 类型（如 `area`、`project`）
- 结合 Git 做变更检测

---

*维护者：Wiki Maintainer*