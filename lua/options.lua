require "nvchad.options"

local o = vim.o
local opt = vim.opt

local undo_dir = vim.fn.stdpath "state" .. "/undo"
vim.fn.mkdir(undo_dir, "p")

o.confirm = true
o.inccommand = "split"
o.scrolloff = 8
o.sidescrolloff = 8
o.cursorlineopt = "both"
o.undofile = true
o.undolevels = 10000
o.undoreload = 50000

opt.completeopt = { "menu", "menuone", "noselect" }
opt.list = true
opt.listchars = {
  tab = "> ",
  trail = ".",
  nbsp = "+",
}
opt.undodir = undo_dir
