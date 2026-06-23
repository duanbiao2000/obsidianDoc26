---
type: concept
title: YOLO 模式
created: 2026-06-21
updated: 2026-06-21
tags: [ai, safety, productivity, coding-agent]
related: [kode-agent]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
---
# YOLO 模式

YOLO 模式是 [[Kode Agent]] 的預設運行模式，名稱源自 "You Only Live Once" 的縮寫。在此模式下，Kode 跳過所有權限檢查，直接執行操作，以最大化生產力。

## 安全考量

文件明確警告 YOLO 模式僅建議在安全可信的環境中處理非重要專案時使用。對於重要檔案或使用能力存疑的模型時，強烈建議使用 `kode --safe` 模式啟用權限檢查和手動審批所有操作。

## 與 Claude Code 的比較

YOLO 模式等同於 Claude Code 的 `--dangerously-skip-permissions` 標誌。
