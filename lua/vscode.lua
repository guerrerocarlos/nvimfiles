local M = {}

local terminal_buf
local terminal_win

local function telescope(name, opts)
  return function()
    local ok, builtin = pcall(require, "telescope.builtin")
    if not ok then
      vim.notify("Telescope is not available", vim.log.levels.WARN)
      return
    end

    builtin[name](opts or {})
  end
end

M.find_files = telescope("find_files", { hidden = true })
M.search_files = telescope "live_grep"
M.command_palette = telescope "commands"
M.buffers = telescope "buffers"
M.recent_files = telescope "oldfiles"

function M.explorer_toggle()
  vim.cmd "NvimTreeToggle"
end

function M.toggle_terminal()
  local ok, term = pcall(require, "nvchad.term")
  if ok then
    term.toggle { pos = "float", id = "vscodeTerm" }
    return
  end

  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_hide(terminal_win)
    return
  end

  vim.cmd "botright 15split"
  terminal_win = vim.api.nvim_get_current_win()

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd "terminal"
    terminal_buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd "startinsert"
end

function M.next_buffer()
  local ok, tabufline = pcall(require, "nvchad.tabufline")
  if ok then
    tabufline.next()
  else
    vim.cmd "bnext"
  end
end

function M.prev_buffer()
  local ok, tabufline = pcall(require, "nvchad.tabufline")
  if ok then
    tabufline.prev()
  else
    vim.cmd "bprevious"
  end
end

function M.close_buffer()
  local ok, tabufline = pcall(require, "nvchad.tabufline")
  if ok then
    tabufline.close_buffer()
  else
    vim.cmd "bdelete"
  end
end

function M.format()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format { async = true, lsp_format = "fallback" }
  else
    vim.lsp.buf.format { async = true }
  end
end

function M.hover()
  vim.lsp.buf.hover { border = "rounded" }
end

function M.diagnostic_float()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = line })) then
    vim.notify("No diagnostics on this line", vim.log.levels.INFO)
    return
  end

  vim.diagnostic.open_float(0, {
    border = "rounded",
    focusable = false,
    scope = "cursor",
    source = "if_many",
  })
end

function M.problems()
  vim.diagnostic.setloclist { open = true }
end

return M
