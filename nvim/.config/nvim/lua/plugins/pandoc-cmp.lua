return {
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    dependencies = {
      "jmbuhr/cmp-pandoc-references",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "pandoc_references", priority = 700 },
      }))
    end,
  },
}
