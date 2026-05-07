local M = {}

local cache = {}
local cache_ttl_ms = 2000

local function current_ms()
  return vim.uv.hrtime() / 1000000
end

local function statusline_escape(value)
  return value:gsub("%%", "%%%%")
end

local function git_output(dir, args)
  if vim.fn.executable "git" ~= 1 then
    return nil
  end

  local cmd = { "git", "-C", dir }
  vim.list_extend(cmd, args)

  local lines = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 or not lines[1] then
    return nil
  end

  local value = vim.trim(lines[1])
  return value ~= "" and value or nil
end

local function buffer_dir(bufnr)
  if vim.bo[bufnr].buftype ~= "" then
    return vim.uv.cwd()
  end

  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then
    return vim.uv.cwd()
  end

  return vim.fs.dirname(name) or vim.uv.cwd()
end

local function git_branch_for_dir(dir)
  if not dir or dir == "" then
    return nil
  end

  local now = current_ms()
  local cached = cache[dir]
  if cached and now - cached.time < cache_ttl_ms then
    return cached.branch
  end

  local branch = git_output(dir, { "branch", "--show-current" })

  if not branch then
    local commit = git_output(dir, { "rev-parse", "--short", "HEAD" })
    branch = commit and ("detached:" .. commit) or nil
  end

  cache[dir] = {
    branch = branch,
    time = now,
  }

  return branch
end

local function gitsigns_branch(bufnr)
  local status = vim.b[bufnr].gitsigns_status_dict
  local branch = (status and status.head) or vim.b[bufnr].gitsigns_head
  return branch ~= "" and branch or nil
end

function M.git_branch()
  local ok, st_utils = pcall(require, "nvchad.stl.utils")
  local bufnr = ok and st_utils.stbufnr() or vim.api.nvim_get_current_buf()
  local branch = gitsigns_branch(bufnr) or git_branch_for_dir(buffer_dir(bufnr))

  if not branch then
    return ""
  end

  return "%#St_gitIcons# git:" .. statusline_escape(branch) .. " "
end

function M.cursor_progress()
  local line = vim.fn.line "."
  local total = vim.fn.line "$"
  local percent = math.floor((line / math.max(total, 1)) * 100)

  return string.format("%%#St_pos_sep#%%#St_pos_icon# %%#St_pos_text# %d/%d %d%%%% ", line, total, percent)
end

return M
