local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "styler" },
  {
    command = "shfmt",
    filetypes = { "sh" },
    args = { "-i", "2", "-ci" } -- Adjust the arguments as needed
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
lvim.lsp.installer.setup.ensure_installed = { "pyright" }

-- Auto format on save
lvim.format_on_save.enabled = true
