return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.default_format_opts = {
        htmldjango = { "djlint" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        r = { "styler" },
        sql = { "sqlfluff" },
        tex = { "latexindent" },
        markdown = { { "prettierd", "prettier" } },
        sh = { "shfmt" },
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
      }
      -- Modify specific formatter options
      opts.formatters.shftm = {
        ["prepend_args"] = { "-i", "4" },
      }
      --     opts.formatters.sqlfluff = {
      --       args = { "format", "--dialect=ansi", "-" },
      -- }
      --     for _, ft in ipairs(sql_ft) do
      --       opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      --       table.insert(opts.formatters_by_ft[ft], "sqlfluff")
      --     end

      opts.default_format_opts = {
        timeout_ms = 30000,
      }
      return opts
    end,
  },
}
