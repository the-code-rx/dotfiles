return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "bash-language-server",
        "ansible-language-server",
        "clangd",
        "pyright",
        "lua-language-server",
        "awk-language-server",
        "css-lsp",
        "html-lsp",
        "json-lsp",
        "marksman",
        "texlab",
        "taplo",
        "vtsls",
        "yaml-language-server",
        "dockerfile-language-server",
        "r-languageserver",
        "ruff-lsp",
        "emmet-language-server",
        "htmx-lsp",
        -- Formatters
        "prettier",
        "prettierd",
        "stylua",
        "black",
        "isort",
        "shfmt",
        "djlint",
        "jq",
        "markdown-toc",
        "markdownlint",
        "sql-formatter",
        "latexindent",
        -- Linters
        "ansible-lint",
        "cmakelint",
        "cmakelang",
        "cspell",
        "hadolint",
        "shellcheck",
        "ruff",
        "hadolint",
        "ansible-lint",
        "sqlfluff",
        -- DAP
        "bash-debug-adapter",
        "codelldb",
        "debugpy",
        "js-debug-adapter",
      },
    },
  },
}
