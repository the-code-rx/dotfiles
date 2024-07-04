return {
  -- Use <tab> for completion and snippets (supertab)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "micangl/cmp-vimtex",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      -- table.insert(opts.sources, 1, {
      --   name = "html-css",
      --   option = {
      --     -- max_count = {},
      --     enable_on = { "html" }, -- set the file types you want the plugin to work on
      --     file_extensions = { "html", "css", "sass" }, -- set the local filetypes from which you want to derive classes
      --     style_sheets = {
      --       -- example of remote styles, only css no js for now
      --       "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css",
      --     },
      --   },
      -- formatting = {
      --   format = function(entry, vim_item)
      --     if entry.source.name == "html-css" then
      --       vim_item.menu = entry.completion_item.menu
      --     end
      --     return vim_item
      --   end,
      -- },
      -- })
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "vimtex" })
    end,
  },
}
