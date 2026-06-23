---
type: entity
title: Git Worktree
tags: [git, version-control, software-development, task-isolation, multi-branch]
related: [工作樹-task-isolation, git-worktree-合併流程, 任務分支, 版本控制, 軟體工程實踐]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/Learn Claude Code Agent Teams和 Worktree + Task Isolation是递进关系.md"]
---
# Git Worktree

[[Git Worktree]] 是 Git 版本控制系統的一個功能，它允許使用者在同一個 Git 倉庫中，同時擁有**多個工作目錄 (working tree)**，每個工作目錄都對應一個獨立的分支。這意味著你可以在不切換主工作目錄分支的情況下，在另一個獨立的目錄中處理不同的分支或任務。

## 核心概念

*   **多目錄映射多分支**：Git Worktree 的核心思想是將一個 Git 倉庫的不同分支映射到不同的物理目錄。
*   **獨立的工作環境**：每個 worktree 都是一個獨立的、功能齊全的 Git 倉庫副本，擁有自己的索引、HEAD 指針和工作目錄。
*   **任務隔離**：這使得開發者或 AI 代理能夠在不相互干擾的情況下，同時處理多個任務或功能開發。

## 主要用途

*   **並行開發**：同時處理多個功能、修復 bug 或進行實驗，無需頻繁切換分支和儲藏 (stash) 更改。
*   **程式碼審查**：在一個獨立的 worktree 中檢出並審查同事的程式碼，而不會影響自己的開發進度。
*   **多版本部署**：在不同的 worktree 中維護不同版本的應用程式，便於測試或部署。
*   **AI 代理任務隔離**：如 [[工作樹-task-isolation]] 概念所示，為每個 AI 代理或任務提供一個獨立的執行沙箱，防止文件衝突和環境污染。

## 與 AI 代理的結合

在 AI 編碼代理的背景下，[[Git Worktree]] 是實現[[工作樹-task-isolation]]的關鍵技術。每個 AI 代理或其處理的每個任務都可以被分配到一個獨立的 Git Worktree 中，該 worktree 對應一個特定的[[任務分支]]。這樣，代理可以在自己的隔離環境中進行程式碼修改、測試和提交，而不會影響其他並行運行的代理或任務。

## 合併流程

當一個任務在獨立的 worktree 中完成後，其對應的[[任務分支]]需要合併回主分支（如 `main` 或 `develop`）。這個過程遵循標準的 Git 合併流程，包括處理潛在的程式碼衝突。詳細的合併步驟和衝突處理方法請參閱[[git-worktree-合併流程]]。

透過 Git Worktree，開發者和 AI 代理能夠更高效、更安全地管理多任務並行開發，顯著提升軟體工程的效率和穩定性。