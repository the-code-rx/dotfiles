return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        htmldjango = { "djlint" },
        html = { "prettierd", "prettier" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        r = { "styler" },
        sql = { "sql-formatter" },
        tex = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        function(_, opts)
          opts.formatters = {
            shfmt = { prepend_args = { "-i", "4" } },
          }
          return opts
        end,
      },
      format = {
        timeout_ms = 30000,
      },
    },
  },
}
