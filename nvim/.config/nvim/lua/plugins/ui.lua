return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      timeout = 6000,
      max_width = function()
        return math.floor(vim.o.columns * 0.25)
      end,
    },
  },
}
