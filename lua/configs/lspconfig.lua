require("nvchad.configs.lspconfig").defaults()

local servers = {
  { name = "cssls", command = "vscode-css-language-server" },
  { name = "eslint", command = "vscode-eslint-language-server" },
  { name = "html", command = "vscode-html-language-server" },
  { name = "jsonls", command = "vscode-json-language-server" },
  { name = "ts_ls", command = "typescript-language-server" },
}

local enabled = {}
local missing = {}

for _, server in ipairs(servers) do
  if vim.fn.executable(server.command) == 1 then
    table.insert(enabled, server.name)
  else
    table.insert(missing, server.name)
  end
end

if #enabled > 0 then
  vim.lsp.enable(enabled)
end

if #missing > 0 then
  vim.schedule(function()
    vim.notify(
      "Missing LSP servers: " .. table.concat(missing, ", ") .. ". Run :MasonInstallAll.",
      vim.log.levels.WARN
    )
  end)
end

-- read :h vim.lsp.config for changing options of lsp servers
