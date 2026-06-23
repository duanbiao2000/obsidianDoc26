---
type: entity
title: oil.nvim
tags: [neovim, plugin, file-explorer, lua]
related: [neovim, lazyvim, neo-tree-nvim]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/LazyVim配置教学.md"]
---
# oil.nvim

[[oil.nvim]] is a Neovim plugin that allows users to edit the file system as if it were a buffer. It serves as a file explorer, enabling operations like renaming, moving, deleting, and creating files and directories using standard Neovim commands. In [[LazyVim]] version 3.x and later, [[oil.nvim]] replaced [[neo-tree.nvim]] as the default file browser, marking a shift in the distribution's approach to file navigation.

## Key Features

*   **Buffer-Based Navigation:** Treats directories as editable buffers, allowing for seamless integration with Neovim's editing workflow.
*   **Standard Commands:** Uses familiar Neovim commands (e.g., `dd` to delete, `yy` to copy, `p` to paste) for file operations.
*   **Customization:** Highly configurable via Lua, allowing users to define keybindings, icons, and behavior.
*   **Integration:** Works well with other Neovim plugins and features, such as telescoping into files from the directory view.

## Comparison with neo-tree.nvim

| Feature | [[oil.nvim]] | [[neo-tree.nvim]] |
| :--- | :--- | :--- |
| Paradigm | Buffer-based editing | Tree-view sidebar |
| Interaction | Edit text directly | Clickable tree nodes |
| Learning Curve | Low for Vim users | Moderate |
| Default in LazyVim | 3.x+ | 2.x and earlier |

## See Also

*   [[Neovim]]
*   [[LazyVim]]
*   [[neo-tree.nvim]]
