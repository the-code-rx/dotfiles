--Setup Formatters for Different Languages --

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "styler" },
  {
    name = "prettier",
    filetypes = { "css", "html", "markdown", "js", "yaml", "tex" }
  },
  {
    command = "shfmt",
    filetypes = { "sh" },
    args = { "-i", "2", "-ci" } -- Adjust the arguments as needed
  },
  {
    command = "sql-formatter",
    filetypes = { "sql" },
    args = { "$FILENAME" },
  },
}

-- LSP config
require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})

-- Enable pyright for Python auto-completion and ruff for linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "ruff" },
  {
    command = "shellcheck",
    filetypes = { "sh" },
    args = { "--severity", "style" }, -- Adjust the arguments as needed
  },
}

lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "sqlls"
end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup("sqlls", {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
  root_dir = function() return vim.loop.cwd() end,
})

-- LSP Ensure Installed --
lvim.lsp.installer.setup.ensure_installed = { "pyright" }

-- -- Update CMP Sources
table.insert(lvim.builtin.cmp.sources, { name = "vim-dadbod-completion" })
table.insert(lvim.builtin.cmp.sources, { name = "otter" })
table.insert(lvim.builtin.cmp.sources, { name = "lua-latex-symbols", option = { cache = true } })

-- Treesitter Ensured Installed --
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

lvim.format_on_save.enabled = true
