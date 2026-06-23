---
type: concept
title: Git Worktree 合併流程
tags: [git, version-control, merge, conflict-resolution, software-development, task-isolation]
related: [git-worktree, 任務分支, 版本控制, 軟體工程實踐, 工作樹-task-isolation]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/Learn Claude Code Agent Teams和 Worktree + Task Isolation是递进关系.md"]
---
# Git Worktree 合併流程

[[Git Worktree]] 合併流程是指將在獨立工作樹中開發的[[任務分支]]的修改，整合回主分支（如 `main` 或 `develop`）的過程。由於 Git Worktree 的本質是「多目錄映射多分支」，因此其合併本質上是標準的 Git 分支合併操作，但需要考慮到多個工作目錄的上下文。

## 核心前提

*   **合併本質**：將一個獨立的[[任務分支]]（例如 `task/agent-1-feature`）的修改，合併到主分支。
*   **衝突處理**：在合併過程中，如果主分支和任務分支在同一文件的同一位置有不同的修改，就會產生衝突，需要手動解決。

## 完整合併步驟

### 步驟 1：準備工作（避免合併基礎不一致）

在執行合併之前，確保任務 worktree 的修改已完成並提交，且主分支是最新的。

1.  **進入目標任務 worktree 目錄，校驗修改**：
    *   使用 `cd /path/to/your/worktree/task-agent-1` 進入任務的隔離目錄。
    *   使用 `git status` 檢查是否有未跟踪或未提交的文件，確保所有變更都已提交。
    *   使用 `git commit -m "task-ID: 完成任務描述"` 提交所有變更。
2.  **同步主分支最新程式碼（關鍵：預防不必要的衝突）**：
    *   在任務分支中，執行 `git fetch origin main` 拉取遠端主分支的最新程式碼。
    *   執行 `git merge origin/main` 將主分支最新程式碼合併到當前任務分支。若此時出現衝突，應先在**隔離的 worktree 中解決**，再繼續。

### 步驟 2：切換到主分支目錄，執行合併

建議使用「單獨的 worktree」或「本地主目錄」來管理主分支，避免直接在任務 worktree 中操作主分支。

1.  **進入主分支目錄，拉取最新**：
    *   使用 `cd /path/to/your/repo/main-worktree` 進入主分支的 worktree 目錄。
    *   執行 `git checkout main` 並 `git pull origin main` 確保本地主分支是最新的。
2.  **合併任務分支到主分支**：
    *   執行 `git merge task/agent-1-feature` 將目標任務分支合併到 `main`。
    *   如果沒有衝突，Git 會自動完成 Fast-forward 或三方合併。
    *   如果出現衝突，Git 會提示 "Automatic merge failed; fix conflicts and then commit the result"。

### 步驟 3：處理合併衝突（核心操作）

衝突的本質是「同一文件的同一位置，主分支和任務分支做了不同修改」，需要手動確認最終保留的程式碼。

1.  **識別衝突文件**：使用 `git status` 查看衝突文件列表。
2.  **手動解決衝突**：
    *   打開衝突文件，Git 會用 `<<<<<<< HEAD`、`=======`、`>>>>>>> 分支名` 標記衝突區域。
    *   根據業務邏輯和任務需求，手動編輯文件，保留正確的程式碼，並刪除所有 Git 衝突標記。
    *   在多代理協作場景下，需確認衝突程式碼的歸屬，並協調解決。
3.  **驗證衝突解決並完成合併**：
    *   使用 `git add <衝突文件>` 標記衝突文件已解決。
    *   執行 `git commit -m "merge task-ID: 合併任務描述（解決衝突說明）"` 完成合併提交。
    *   執行 `git push origin main` 推送合併後的主分支到遠端。

### 步驟 4：清理隔離 worktree（可選）

合併完成後，如果任務不再需要，可以刪除對應的 worktree 和分支。

1.  **刪除任務 worktree**：回到主目錄，執行 `git worktree remove /path/to/your/worktree/task-agent-1`。
2.  **刪除本地和遠端分支**：如果確認分支無用，執行 `git branch -d task/agent-1-feature` 和 `git push origin --delete task/agent-1-feature`。

## 多 Task/Agent 場景的衝突預防最佳實踐

在 [[工作樹-task-isolation]] 下，多代理並行處理任務時，衝突概率更高，可透過以下方式規避：

1.  **按目錄/模組隔離任務**：讓不同代理負責不同目錄，從根源減少文件衝突。
2.  **頻繁同步主分支**：每個任務分支每天同步一次 `origin/main` 的最新程式碼，提前在隔離 worktree 中解決小衝突。
3.  **先合併到開發分支**：不直接合併到 `main`，先合併到 `develop` 分支做集成測試。
4.  **衝突記錄與復盤**：記錄每次衝突的原因，優化代理的任務拆分規則。

透過遵循這些步驟和最佳實踐，可以有效管理 [[Git Worktree]] 中的合併操作，確保多任務或多代理協作的順暢進行。