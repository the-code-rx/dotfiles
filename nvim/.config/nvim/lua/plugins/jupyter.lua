return {
  { -- directly open ipynb files as quarto docuements
    -- and convert back behind the scenes
    "GCBallesteros/jupytext.nvim",
    lazy = true,
    opts = {
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
        r = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
      },
    },
  },
  {
    "benlubas/molten-nvim",
    lazy = true,
    enabled = false,
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { "<leader>ci", ":MoltenInit<cr>", desc = "Jupyter Init" },
      {
        "<leader>mv",
        ":<C-u>MoltenEvaluateVisual<cr>",
        mode = "v",
        desc = "molten eval visual",
      },
      { "<leader>cj", ":MoltenReevaluateCell<cr>", desc = "Jupyter Evalute Cell" },
    },
  },
}
