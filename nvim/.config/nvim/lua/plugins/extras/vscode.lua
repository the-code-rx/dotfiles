if not vim.g.vscode then
  return {}
end
print("Hello, World!")
local enabled = {
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim",
  "LazyVim",
}

local Config = require("lazy.core.config")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end

-- Commentary function for VSCode
function _G.vscodeCommentary(...)
  local args = { ... }
  if #args == 0 then
    vim.api.nvim_set_option("operatorfunc", "v:lua.vscodeCommentary")
    return "g@"
  end

  local line1, line2
  if #args > 1 then
    line1, line2 = args[1], args[2]
  else
    line1, line2 = vim.fn.line("'["), vim.fn.line("']")
  end

  vim.fn.VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
end
-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
    -- Buffer keymaps --
    vim.keymap.set("n", "<leader>bd", [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>]])
    vim.keymap.set("n", "<S>l", [[<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>]])
    vim.keymap.set("n", "<S>h", [[<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>]])
    vim.keymap.set("n", "be", [[<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>]])
    -- Toggle File Explorer --
    vim.keymap.set("n", "<leader>e", [[<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>]])
    -- Commands --
    vim.keymap.set("n", "<leader>sC", [[<cmd>call VSCodeNotify('workbench.action.showCommands')<cr>]])
    -- Git --
    vim.keymap.set("n", "<leader>ge", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
    -- Harpoon emulation via Bookmarks extension--
    vim.keymap.set("n", "<leader>h", [[<cmd>call VSCodeNotify('bookmarks.listFromAllFiles')<cr>]])
    -- Key mappings for better navigation
    vim.api.nvim_set_keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
    vim.api.nvim_set_keymap("x", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
    vim.api.nvim_set_keymap("x", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
    vim.api.nvim_set_keymap("x", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })
    vim.api.nvim_set_keymap("x", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })

    vim.api.nvim_set_keymap("n", "gr", ":call VSCodeNotify('editor.action.goToReferences')<CR>", { silent = true })
    -- Commentary mappings
    vim.api.nvim_set_keymap("x", "gc", "<Plug>VSCodeCommentary", {})
    vim.api.nvim_set_keymap("n", "gc", "<Plug>VSCodeCommentary", {})
    vim.api.nvim_set_keymap("o", "gc", "<Plug>VSCodeCommentary", {})
    vim.api.nvim_set_keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", {})
  end,
})

return {
  {
    "LazyVim/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
