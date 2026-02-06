# Draft: Change yazi default editor to nvim

## Requirements

- Change default editor from "note" to "nvim" in yazi
- User uses WSL Ubuntu with Zsh shell
- Prefer environment variable method over yazi.toml configuration

## Technical Decisions

- Method: Add `export EDITOR=nvim` to `~/.zshrc`
- Location: `/home/danny/.zshrc` (WSL Ubuntu)
- Verification: Test by opening a text file in yazi after setting variable

## Research Findings

- Yazi defaults to using `$EDITOR` environment variable for text editor (Linux/macOS)
- Alternative method: Configure [opener] in yazi.toml
- Environment variable method is cleaner and more standard

## Scope Boundaries

- INCLUDE: Modify ~/.zshrc to set EDITOR=nvim
- EXCLUDE: Modifying yazi.toml (user preferred environment variable method)
