require "nvchad.options"

local o = vim.o
local opt = vim.opt

o.confirm = true
o.inccommand = "split"
o.scrolloff = 8
o.sidescrolloff = 8
o.cursorlineopt = "both"

opt.completeopt = { "menu", "menuone", "noselect" }
opt.list = true
opt.listchars = {
  tab = "> ",
  trail = ".",
  nbsp = "+",
}
