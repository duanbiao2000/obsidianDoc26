---
type: entity
title: lazy.nvim
tags: [neovim, plugin-manager, lua, tool]
related: [neovim, lazyvim]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/LazyVim配置教学.md"]
---
# lazy.nvim

[[lazy.nvim]] is a modern plugin manager for [[Neovim]], written in Lua. It is designed for speed and flexibility, featuring lazy-loading capabilities that significantly improve Neovim's startup time. [[lazy.nvim]] is the core dependency for [[LazyVim]] and is widely adopted in the Neovim community for its performance and ease of use.

## Key Features

*   **Lazy Loading:** Plugins are loaded only when needed, reducing initial load times.
*   **Lua-Based Configuration:** Configuration is done entirely in Lua, aligning with modern Neovim practices.
*   **Dependency Management:** Handles plugin dependencies automatically.
*   **Performance:** Optimized for fast startup and efficient plugin handling.
*   **UI:** Provides a user-friendly interface for managing plugins, including installation, updates, and synchronization.

## Usage in LazyVim

[[LazyVim]] uses [[lazy.nvim]] to manage its curated set of plugins. Users can extend [[LazyVim]] by adding new plugins to the `lua/plugins/` directory, where [[lazy.nvim]] automatically detects and loads them according to their specified conditions (e.g., event triggers, file types).

## See Also

*   [[Neovim]]
*   [[LazyVim]]
