---
type: entity
title: LazyVim
tags: [neovim, editor, distribution, lua]
related: [neovim, lazy-nvim, oil-nvim, neo-tree-nvim, mason-nvim]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/LazyVim配置教学.md"]
---
# LazyVim

[[LazyVim]] is a pre-configured, "batteries-included" distribution for [[Neovim]] designed to provide an out-of-the-box integrated development environment (IDE) experience. It leverages [[lazy.nvim]] as its plugin manager to ensure fast startup times, efficient plugin loading, and a modular architecture. The distribution ships with a curated set of plugins, sensible defaults, and a consistent keybinding scheme, significantly lowering the barrier to entry for new users while remaining highly customizable for advanced users through Lua configuration.

## Core Features

* **Plugin Management & Performance:** Uses [[lazy.nvim]] for lazy-loading plugins, optimizing startup times and overall runtime performance.
* **Ease of Use & Modularity:** Designed for users who want a powerful setup without the complexity of building a configuration from scratch, while allowing easy customization through dedicated Lua files.
* **Search & Fuzzy Finding:** Integrates [[telescope.nvim]] for fuzzy finding files, text, buffers, and help documentation.
* **Code Completion:** Uses [[nvim-cmp]] for intelligent code completion, supporting LSP, buffer, path, and snippet sources.
* **Syntax Highlighting & Navigation:** Employs [[nvim-treesitter]] for superior syntax highlighting, code folding, and structural navigation.
* **UI Enhancements:** Includes [[lualine.nvim]] for a customizable status line and [[tokyonight.nvim]] as the default color scheme, contributing to an aesthetically pleasing development environment.

## Language Server & Tooling Support

LazyVim integrates with [[Mason]] and [[nvim-lspconfig]] to simplify the installation and management of Language Server Protocol (LSP) servers, formatters, and linters. This pre-configured setup enables features like auto-completion, go-to-definition, and diagnostics out of the box. It provides streamlined support for various programming languages, including Python, JavaScript, TypeScript, and Go.

## Version History & Differences

LazyVim undergoes frequent updates. A significant architectural shift occurred between version 2.x and 3.x. Users are advised to track these changes via the official documentation and GitHub repository.

| Feature | LazyVim 2.x | LazyVim 3.x+ |
| :--- | :--- | :--- |
| File Explorer | [[neo-tree.nvim]] | [[oil.nvim]] (treats file system as a buffer) |
| Status Line | [[lualine.nvim]] | [[lualine.nvim]] (Enhanced) |
| Theme | [[tokyonight.nvim]] | Multi-theme support |
| Completion | [[nvim-cmp]] | [[nvim-cmp]] (Optimized) |

## Configuration & Customization

Configuration is handled via Lua files located in the `~/.config/nvim/lua/` directory. Key configuration files include:
* `config/options.lua` / `lua/config/options.lua`: For setting Neovim options (e.g., line numbers, indentation).
* `config/keymaps.lua` / `lua/config/keymaps.lua`: For defining custom keybindings.
* `plugins/custom.lua` / `lua/plugins/custom.lua`: For adding new plugins, overriding defaults, or modifying existing plugin configurations.

## Installation

Installation typically involves cloning the starter repository into the Neovim configuration directory:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

Upon first launch, LazyVim automatically installs all required plugins and dependencies.

## See Also

* [[Neovim]]
* [[lazy.nvim]]
* [[oil.nvim]]
* [[neo-tree.nvim]]
* [[Mason]]