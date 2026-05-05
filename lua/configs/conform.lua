local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier", stop_after_first = true },
    graphql = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    yaml = { "prettierd", "prettier", stop_after_first = true },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    local commands_by_ft = {
      lua = { "stylua" },
      css = { "prettierd", "prettier" },
      graphql = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      jsonc = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
    }

    local commands = commands_by_ft[vim.bo[bufnr].filetype]
    if not commands then
      return
    end

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local dirname = bufname ~= "" and vim.fs.dirname(bufname) or nil
    local search_path = dirname and (dirname .. ";") or ".;"

    for _, command in ipairs(commands) do
      if vim.fn.executable(command) == 1 or vim.fn.findfile("node_modules/.bin/" .. command, search_path) ~= "" then
        return { timeout_ms = 800, lsp_format = "never" }
      end
    end
  end,
}

return options
