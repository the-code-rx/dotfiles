-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Load options.lua
reload("user.options")

-- Load keybindings
reload("user.keybindings")

-- Pugins
lvim.plugins = {
  { "ThePrimeagen/vim-be-good" },
  { "ThePrimeagen/harpoon" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
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
        templates = {
          folder = "Templates",
          date_format = "%Y-%m-%d",
          time_format = "%H:%M",
          -- A map for custom variables, the key should be the variable and the value a function
          substitutions = {},
        },
      })
    end,
  },
  { "/preservim/vim-pencil" },
  { 'goerz/jupytext.vim' },
  { "devOpifex/r.nvim" },
  { "quarto-dev/quarto-nvim" },
  { "jmbuhr/otter.nvim" },
  { 'jpalardy/vim-slime' },
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
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
  -- Other plugins can be added here
}

-- LSP config
require('mason-lspconfig').setup_handlers({
  function(server)
    require('lvim.lsp.manager').setup(server)
  end
})

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "styler" },
}

-- Enable pyright for Python auto-completion and ruff for linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "ruff" },
}
lvim.lsp.installer.setup.ensure_installed = { "pyright" }

-- Auto format on save
lvim.format_on_save.enabled = true

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
