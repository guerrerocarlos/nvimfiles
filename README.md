# nvimfiles

Personal Neovim configuration for `guerrerocarlos`, based on NvChad and tuned for a VSCode-to-Neovim workflow.

## Install

```bash
git clone https://github.com/guerrerocarlos/nvimfiles.git ~/.config/nvim
nvim
```

Inside Neovim, run `:MasonInstallAll` to install the configured language servers and formatters.
Until those tools are installed, missing language servers are skipped so startup stays quiet.

## Familiar Shortcuts

- `Ctrl+s`: save
- `Ctrl+p`: find files
- `Ctrl+Shift+p` or `Space Space`: command palette
- `Ctrl+Shift+f`: search in files
- `Space e`: file explorer
- `Ctrl+\`` or `Space tt`: terminal
- `F2`: rename symbol
- `Ctrl+.` or `Space ca`: code action
- `F12`: go to definition
- `Shift+F12`: find references
- `F8` / `Shift+F8`: next / previous diagnostic
- `Space xx`: problems list
- `Space cf`: format file
- `Space gs`: Git status

Some Ctrl/Shift combinations depend on the terminal emulator. The leader-key alternatives are kept as reliable fallbacks.

## Notes

Format-on-save is intentionally conservative. It only runs for configured filetypes when the matching formatter is available globally or in the current project's `node_modules/.bin`.

NvimTree opens automatically when Neovim starts. When opening a file directly, the explorer follows that file while focus stays in the editor.
