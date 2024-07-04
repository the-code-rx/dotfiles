return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    ---@diagnostic disable-next-line: missing-parameter
    vim.list_extend(opts.ensure_installed, {
      "css",
      "scss",
    })
  end,
}
