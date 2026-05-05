-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = {
    "css-lsp",
    "eslint-lsp",
    "html-lsp",
    "json-lsp",
    "prettier",
    "prettierd",
    "stylua",
    "typescript-language-server",
  },
}

M.ui = {
  statusline = {
    modules = {
      git = function()
        return require("statusline").git_branch()
      end,
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
