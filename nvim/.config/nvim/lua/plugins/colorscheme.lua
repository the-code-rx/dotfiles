return {
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "tokyonight",
  --     style = "night",
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      opts.style = "night"
      opts.on_highlights = function(hl)
        local bg = "#1a1b26"
        hl.BufferLineFill = { bg = bg }
      end
    end,
  },
}
