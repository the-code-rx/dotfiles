-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Settings
-- *
local init_custom_options = function()
  local custom_options = {
    relativenumber = true, -- Set relative numbered lines
    ignorecase = true,     -- Ignore case in search
    smartcase = true,      -- Case-sensitive search when search term contains uppercase characters. Otherwise, case-sensitive search.  timeoutlen = 200, -- Time to wait for a mapped sequence to complete (in milliseconds)
  }

  for k, v in pairs(custom_options) do
    vim.opt[k] = v
  end
end
init_custom_options()

lvim.plugins = {
  { "ThePrimeagen/vim-be-good" },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  { "nvim-focus/focus.nvim",   version = "*" },
  {
    "folke/twilight.nvim",
    opts = {
    }
  },
  {
    "folke/zen-mode.nvim",
    opts = {
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end
  },
  { "szymonmaszke/vimpyter" },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/DS/DS_Vault",
          },
          -- {
          --   name = "work",
          --   path = "~/vaults/work",
          -- },
        },
      })
    end,
  },
  { "/preservim/vim-pencil" },
  { 'jupyter-vim/jupyter-vim' },
  { 'goerz/jupytext.vim' },
  { "devOpifex/r.nvim" },
  { 'jpalardy/vim-slime' },
  { 'hanschen/vim-ipython-cell' },
  { "jamespeapen/Nvim-R" },
  { "ncm2/ncm2" },
  { "roxma/nvim-yarp" },
  { "gaalcaras/ncm-R" },
  { "sirver/UltiSnips" },
  { "ncm2/ncm2-ultisnips" },
  { "lervag/vimtex" },
  { 'christoomey/vim-tmux-runner' },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Other plugins can be added here
}


require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})

require("focus").setup()

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "styler" },
}
-- Enable pyright for Python auto-completion and linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "ruff" },
}
lvim.lsp.installer.setup.ensure_installed = { "pyright" }

-- Markdown preview browser
vim.g.mkdp_browser = "google-chrome"
vim.g.mkdp_auto_start = 1
vim.g.mkdp_open_ip = "127.0.0.1"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_refresh_slow = 1
vim.g.mkdp_theme = "dark"
vim.g.mkdp_theme = 1
vim.g.mkdp_combine_preview_auto_refresh = 1
vim.g.mkdp_page_title = '「${name}」'


-- Auto format on save
lvim.format_on_save.enabled = true

-- Obsidan Settings
vim.opt.conceallevel = 2

-- Noice cmd popup configuration
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
  },
})

vim.g.slime_bracketed_paste = 1
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }
