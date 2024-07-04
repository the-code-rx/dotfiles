return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "kdheepak/cmp-latex-symbols",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "latex_symbols", priority = 700 },
      }))
    end,
  },
  { -- preview equations
    "jbyuki/nabla.nvim",
    lazy = true,
    keys = {
      { "<leader>ct", ':lua require("nabla").popup()<CR>', desc = "Toggle Math Equations" },
    },
  },
}
