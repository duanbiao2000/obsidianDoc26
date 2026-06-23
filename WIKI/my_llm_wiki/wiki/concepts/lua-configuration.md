---
type: concept
title: Lua Configuration
tags: [neovim, lua, programming]
related: [neovim, lazyvim]
created: 2026-06-23
updated: 2026-06-23
sources: ["Journals/LazyVim配置教学.md"]
---
# Lua Configuration

**Lua Configuration** refers to the practice of using the Lua programming language to customize and extend the functionality of [[Neovim]]. Since Neovim embeds a Lua JIT compiler, Lua has become the preferred method for writing high-performance plugins and configurations.

## Role in Neovim

Lua allows users to:
*   Set editor options (`vim.opt`).
*   Define key mappings (`vim.keymap.set`).
*   Manage plugins (via managers like [[lazy.nvim]]).
*   Interact with the Neovim API for advanced automation.

## In LazyVim

In [[LazyVim]], Lua configuration is modularized into specific files:
*   `options.lua`: Controls editor behavior (e.g., line numbers, indentation).
*   `keymaps.lua`: Defines custom shortcuts.
*   `plugins/*.lua`: Specifies plugin installations and their respective setup functions.

This modular approach promotes clarity and makes it easier to maintain and share configurations.