# nvimfiles

Personal Neovim configuration for `guerrerocarlos`, based on NvChad and tuned for a VSCode-to-Neovim workflow.

## Install

```bash
git clone https://github.com/guerrerocarlos/nvimfiles.git ~/.config/nvim
nvim
```

Inside Neovim, run this once after cloning:

```vim
:MasonInstallAll
```

That installs the configured language servers and formatters. Until those tools are installed, missing language servers are skipped so startup stays quiet.

## Core Model

- `Space` is the leader key.
- `Esc` returns to normal mode.
- `jk` also returns to normal mode from insert mode.
- `;` opens command mode, same as `:`.
- `:qa` quits all windows.
- `:wqa` saves all changed files and quits all windows.
- `:qa!` quits all windows and discards unsaved changes.

Some Ctrl/Shift combinations depend on the terminal emulator. The leader-key alternatives below are kept as reliable fallbacks.

## Files And Search

| VSCode habit | Neovim mapping | Action |
| --- | --- | --- |
| Save | `Ctrl+s` | Save current file |
| Quick open | `Ctrl+p` or `Space ff` | Find files, including hidden files |
| Command palette | `Ctrl+Shift+p` or `Space Space` | Search available commands |
| Search in files | `Ctrl+Shift+f` or `Space fg` | Live grep in the project |
| Open buffers | `Space fb` | List open buffers |
| Recent files | `Space fr` | List recently opened files |

## Explorer

NvimTree opens automatically when Neovim starts.

- `nvim` opens with the explorer focused.
- `nvim path/to/file` opens the explorer, follows that file, and keeps focus in the editor.

| Mapping | Action |
| --- | --- |
| `Space e` | Toggle the explorer |
| `Ctrl+n` | Toggle the explorer, from NvChad defaults |

## Terminal

| Mapping | Action |
| --- | --- |
| `Ctrl+<` | Toggle floating terminal |
| `Ctrl+backtick` | Toggle floating terminal |
| `Space backtick` | Toggle floating terminal |
| `Space tt` | Toggle floating terminal |
| `Ctrl+g` in terminal | Leave terminal input mode |
| `jk` in terminal | Leave terminal input mode |
| `Esc Esc` in terminal | Leave terminal input mode |

`Ctrl+<` is also bound as `Ctrl+,` because many terminals report the shifted `<` key that way.

## Buffers

Buffers are the open files inside Neovim.

| Mapping | Action |
| --- | --- |
| `Ctrl+Tab` | Next buffer |
| `Ctrl+Shift+Tab` | Previous buffer |
| `Option+w` / `Alt+w` | Close current buffer |
| `Space bd` | Close current buffer |
| `Tab` | Next buffer, from NvChad tabufline |
| `Shift+Tab` | Previous buffer, from NvChad tabufline |

`Option+w` requires your terminal to send Option as Meta or Alt.

## Code Intelligence

These use Neovim LSP. Run `:MasonInstallAll` if a server is missing.

| VSCode habit | Neovim mapping | Action |
| --- | --- | --- |
| Rename symbol | `F2` or `Space rn` | Rename symbol |
| Code action / quick fix | `Ctrl+.` or `Space ca` | Show code actions |
| Format document | `Space cf` | Format current file |
| Go to definition | `F12` | Jump to definition |
| Find references | `Shift+F12` or `gr` | List references |
| Hover docs | `K` | Show hover documentation |
| Go to implementation | `gI` | Jump to implementation |

Configured language servers:

- CSS: `cssls`
- ESLint: `eslint`
- HTML: `html`
- JSON: `jsonls`
- TypeScript / JavaScript: `ts_ls`

The config checks that each server command exists before enabling it. Missing servers are skipped with a warning instead of causing LSP spawn errors.

## Diagnostics

| Mapping | Action |
| --- | --- |
| `F8` | Next diagnostic |
| `Shift+F8` | Previous diagnostic |
| `Space cd` | Show diagnostic for the current line |
| `Space xx` | Open the problems list |

## Formatting

Manual formatting is available with:

```text
Space cf
```

Format-on-save is conservative. It only runs when the matching formatter is available globally or in the current project's `node_modules/.bin`.

Configured formatters:

- Lua: `stylua`
- CSS, GraphQL, HTML, JavaScript, JSON, Markdown, TypeScript, YAML: `prettierd`, falling back to `prettier`

Temporarily disable autoformat globally:

```vim
:lua vim.g.disable_autoformat = true
```

Disable autoformat for the current buffer:

```vim
:lua vim.b.disable_autoformat = true
```

## Git

| Mapping | Action |
| --- | --- |
| `Space gs` | Git status |
| `Space gc` | Git commit |
| `Space gp` | Git push |

Git commands are powered by Fugitive.

## Editing Comfort

- Yanked text is briefly highlighted.
- External file changes are checked when Neovim regains focus or a terminal closes.
- Terminals hide line numbers and signs.
- Neovim restores the last cursor position when reopening a file.
- Search and substitute previews use `inccommand=split`.
- The cursor keeps context with `scrolloff=8`.

## Discoverability

NvChad still provides its defaults on top of this comfort layer.

| Mapping | Action |
| --- | --- |
| `Space ch` | Open NvChad cheatsheet |
| `Space /` | Toggle comment |
| `Space th` | Theme picker |

## Troubleshooting

If LSP features are missing:

```vim
:MasonInstallAll
:checkhealth vim.lsp
```

If formatting does not run:

```vim
:ConformInfo
```

If a Ctrl/Shift shortcut does not work in the terminal, use the documented `Space` fallback.
