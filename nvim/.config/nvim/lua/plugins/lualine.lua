return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "filename", "diagnostics", "branch", "diff" },
      lualine_c = {},
      lualine_y = {
        "filetype",
        "progress",
        {
          function()
            return require("noice").api.status.mode.get()
          end,
          cond = function()
            return package.loaded["noice"] and require("noice").api.status.mode.has()
          end,
          color = function()
            return LazyVim.ui.fg("Function")
          end,
        },
      },
      lualine_x = {},
      lualine_z = { "location" },
    },
  },
}
