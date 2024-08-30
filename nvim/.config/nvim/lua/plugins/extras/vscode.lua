if not vim.g.vscode then
  return {}
end

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
    vim.go.operatorfunc = "v:lua.vscodeCommentary"
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

-- LazyVim to VSCode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    -- Coding search, symbol, and definition functionality
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
    vim.keymap.set("n", "<leader>cr", [[<cmd>call VSCodeNotify('editor.action.rename')<cr>]])
    vim.keymap.set("n", "gr", [[<cmd>call VSCodeNotify('editor.action.goToReferences')<cr>]])

    -- Buffer/Editor keymaps
    vim.keymap.set("n", "<leader>bd", [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>]])
    vim.keymap.set("n", "<S>l", [[<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>]])
    vim.keymap.set("n", "<S>h", [[<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>]])
    vim.keymap.set("n", "<leader>be", [[<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>]])
    vim.keymap.set("n", "<leader>,", [[<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>]])
    vim.keymap.set("n", "<leader>fb", [[<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>]])

    -- Window management
    vim.keymap.set("n", "<leader>qq", [[<cmd>call VSCodeNotify('workbench.action.closeWindow')<cr>]])
    vim.keymap.set("n", "<leader>w>", [[<cmd>call VSCodeNotify('workbench.action.increaseViewWidth')<cr>]])
    vim.keymap.set("n", "<leader>w<", [[<cmd>call VSCodeNotify('workbench.action.decreaseViewWidth')<cr>]])
    vim.keymap.set("n", "<leader>wd", [[<cmd>call VSCodeNotify('workbench.action.closeEditorsAndGroup')<cr>]])
    vim.keymap.set("n", "<leader>wq", [[<cmd>call VSCodeNotify('workbench.action.closeEditorsAndGroup')<cr>]])
    vim.keymap.set("n", "<leader>-", [[<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<cr>]])
    vim.keymap.set("n", "<leader>|", [[<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<cr>]])
    vim.keymap.set("n", "<leader>cwm", [[<cmd>call VSCodeNotify('workbench.action.toggleMaximizeEditorGroup')<cr>]])

    -- Toggle VScode UI
    vim.keymap.set("n", "<leader>e", [[<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>]])
    vim.keymap.set("n", "<leader>ub", [[<cmd>call VSCodeNotify('workbench.action.toggleActivityBarVisibility')<cr>]])
    vim.keymap.set("n", "<C-/>", [[<cmd>call VSCodeNotify('workbench.action.togglePanel')<cr>]])
    vim.keymap.set("n", "<leader>ud", [[<cmd>call VSCodeNotify('errorLens.toggleInlineMessage')<cr>]])
    vim.keymap.set("n", "<leader>cs", function()
      vim.fn.VSCodeNotify("outline.expand")
    end)

    -- Search VSCode commands --
    vim.keymap.set("n", "<leader>sC", [[<cmd>call VSCodeNotify('workbench.action.showCommands')<cr>]])

    -- Git source control via Git Graph by "mhutchie" VSCode extension
    vim.keymap.set("n", "<leader>ge", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
    vim.keymap.set("n", "<leader>gs", [[<cmd>call VSCodeNotify('workbench.view.scm')<cr>]])
    vim.keymap.set("n", "<leader>gc", function()
      vim.fn.VSCodeNotify("git-graph.view")
      vim.fn.VSCodeNotify("workbench.view.scm")
    end)
    vim.keymap.set("n", "<leader>gl", function()
      vim.fn.VSCodeNotify("git-graph.view")
      vim.fn.VSCodeNotify("workbench.view.scm")
    end)
    vim.keymap.set("n", "<leader>gf", [[<cmd>call VSCodeNotify('git-graph.openFile')<cr>]])
    vim.keymap.set("n", "<leader>gv", [[<cmd>call VSCodeNotify('git.commit.view.showFolderView')<cr>]])

    -- Todo functionality via Todo Tree by "Gruntfuggly"
    vim.keymap.set("n", "<leader>st", function()
      vim.fn.VSCodeNotify("todo-tree-view.focus")
      vim.fn.VSCodeNotify("todo-tree.expand")
    end)
    vim.keymap.set("n", "[t", [[<cmd>call VSCodeNotify('todo-tree.goToNext')<cr>]])
    vim.keymap.set("n", "]t", [[<cmd>call VSCodeNotify('todo-tree.goToPrevious')<cr>]])

    -- Harpoon via VSCode Harpoon by "tobias-z" VSCode extension
    vim.keymap.set("n", "<leader>H", [[<cmd>call VSCodeNotify('vscode-harpoon.addEditor')<cr>]])
    vim.keymap.set("n", "<leader>h", [[<cmd>call VSCodeNotify('vscode-harpoon.editorQuickPick')<cr>]])
    vim.keymap.set("n", "<leader>1", [[<cmd>call VSCodeNotify('vscode-harpoon.gotoEditor1')<cr>]])
    vim.keymap.set("n", "<leader>2", [[<cmd>call VSCodeNotify('vscode-harpoon.gotoEditor2')<cr>]])
    vim.keymap.set("n", "<leader>3", [[<cmd>call VSCodeNotify('vscode-harpoon.gotoEditor3')<cr>]])
    vim.keymap.set("n", "<leader>4", [[<cmd>call VSCodeNotify('vscode-harpoon.gotoEditor4')<cr>]])
    vim.keymap.set("n", "<leader>5", [[<cmd>call VSCodeNotify('vscode-harpoon.gotoEditor5')<cr>]])

    -- hjkl navigation kemaps
    vim.keymap.set("n", "<C-j>", [[<cmd>call VSCodeNotify('workbench.action.navigateDown')<cr>]])
    vim.keymap.set("x", "<C-j>", [[<cmd>call VSCodeNotify('workbench.action.navigateDown')<cr>]])
    vim.keymap.set("n", "<C-k>", [[<cmd>call VSCodeNotify('workbench.action.navigateUp')<cr>]])
    vim.keymap.set("x", "<C-k>", [[<cmd>call VSCodeNotify('workbench.action.navigateUp')<cr>]])
    vim.keymap.set("n", "<C-h>", [[<cmd>call VSCodeNotify('workbench.action.navigateLeft')<cr>]])
    vim.keymap.set("x", "<C-h>", [[<cmd>call VSCodeNotify('workbench.action.navigateLeft')<cr>]])
    vim.keymap.set("n", "<C-l>", [[<cmd>call VSCodeNotify('workbench.action.navigateRight')<cr>]])
    vim.keymap.set("x", "<C-l>", [[<cmd>call VSCodeNotify('workbench.action.navigateRight')<cr>]])

    -- Comment kemaps
    vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary")
    vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine")
  end,

  -- Debug keymaps
  vim.keymap.set("n", "<leader>du", [[<cmd>call VSCodeNotify('workbench.view.debug')<cr>]]),
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
