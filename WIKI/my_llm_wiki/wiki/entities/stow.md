---
type: entity
title: stow
tags: [tool, dotfiles, linux, macos]
related: [dotfile-management, git-best-practices]
created: 2026-06-22
updated: 2026-06-22
sources: ["Journals/Inbox.md"]
---
# stow

**GNU Stow** is a symlink farm manager used for managing software packages and configuration files (dotfiles). It allows users to keep different sets of files in separate directories (packages) and then create symlinks from a target directory (usually the home directory) to these files.

## Usage in Dotfile Management

In the context of personal development environments, `stow` is commonly used to version-control dotfiles (e.g., `.bashrc`, `.vimrc`, `.gitconfig`) in a Git repository. By organizing these files into packages within a `dotfiles` directory, users can easily deploy their configuration to new machines by running `stow <package>`.

## Key Features

*   **Symlink-Based:** Does not copy files; creates symbolic links, ensuring that changes in the repository are immediately reflected in the live environment.
*   **Lightweight:** Requires no complex daemon or background process.
*   **Package Isolation:** Keeps different configurations (e.g., `nvim`, `tmux`, `zsh`) in separate subdirectories, allowing for modular deployment.

## Related Tools

*   [[chezmoi]]: A more feature-rich dotfile manager with templating support.
*   [[yadm]]: Another popular dotfile manager.
*   [[Git Worktree]]: Often used in conjunction with stow for managing multiple branches or versions of configurations.