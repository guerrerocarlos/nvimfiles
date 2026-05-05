require "nvchad.mappings"

local map = vim.keymap.set
local vscode = require "vscode"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("t", "<C-g>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
map("t", "jk", [[<C-\><C-n>]], { desc = "Terminal normal mode" })
map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Terminal normal mode" })

map({ "n", "i", "v" }, "<C-s>", "<cmd>write<CR>", { desc = "Save file" })

map("n", "<C-p>", vscode.find_files, { desc = "Find files" })
map("n", "<C-S-p>", vscode.command_palette, { desc = "Command palette" })
map("n", "<leader><leader>", vscode.command_palette, { desc = "Command palette" })
map("n", "<C-S-f>", vscode.search_files, { desc = "Search in files" })
map("n", "<leader>ff", vscode.find_files, { desc = "Find files" })
map("n", "<leader>fg", vscode.search_files, { desc = "Search in files" })
map("n", "<leader>fb", vscode.buffers, { desc = "Open buffers" })
map("n", "<leader>fr", vscode.recent_files, { desc = "Recent files" })

map("n", "<leader>e", vscode.explorer_toggle, { desc = "Explorer" })
map({ "n", "i", "t" }, "<C-<>", vscode.toggle_terminal, { desc = "Toggle terminal" })
map({ "n", "i", "t" }, "<C-,>", vscode.toggle_terminal, { desc = "Toggle terminal" })
map({ "n", "t" }, "<C-`>", vscode.toggle_terminal, { desc = "Toggle terminal" })
map({ "n", "t" }, "<leader>`", vscode.toggle_terminal, { desc = "Toggle terminal" })
map({ "n", "t" }, "<leader>tt", vscode.toggle_terminal, { desc = "Toggle terminal" })

map("n", "<C-Tab>", vscode.next_buffer, { desc = "Next buffer" })
map("n", "<C-S-Tab>", vscode.prev_buffer, { desc = "Previous buffer" })
map("i", "<C-w>", function()
  vim.cmd "stopinsert"
  vim.schedule(vscode.close_buffer)
end, { desc = "Close buffer" })
map("n", "<leader>bd", vscode.close_buffer, { desc = "Close buffer" })

map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, { desc = "Code action" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cf", vscode.format, { desc = "Format file" })

map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<S-F12>", vim.lsp.buf.references, { desc = "Find references" })
map("n", "K", vscode.hover, { desc = "Hover" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })

map("n", "<F8>", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<S-F8>", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "<leader>cd", vscode.diagnostic_float, { desc = "Line diagnostic" })
map("n", "<leader>xx", vscode.problems, { desc = "Problems list" })
