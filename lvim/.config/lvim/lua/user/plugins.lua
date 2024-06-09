lvim.plugins = {
	{ "ThePrimeagen/vim-be-good" },
	-- Navigation --
	{ "ThePrimeagen/harpoon" },
	{ "stevearc/oil.nvim" },
	-- Git Workfolow ---
	{ "ThePrimeagen/git-worktree.nvim" },
	{ "tpope/vim-fugitive" },
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
	},
	-- Documentation --
	{ "rmagatti/goto-preview" },
	-- Notifcations --
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
				enabled = false,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- Writing and Distraction Free Coding --
	{ "/preservim/vim-pencil" },
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	-- Bettter Comments --
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	-- Restore Old Nvim Sessions --
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	-- View Hex/RGB Colors in Nvim --
	{ "norcalli/nvim-colorizer.lua" },
	-- Live Preview Markdown --
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- Obsidian Notes --
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/DS/DS_Vault",
				},
				-- {
				-- name = "work",
				-- path = "~/vaults/work",
				-- },
			},
			templates = {
				folder = "Templates",
			},
			-- see below for full list of options 👇
		},
	},
	-- IMPROVED FORMATING --
	-- Fold Lines --
	{
		"AckslD/nvim-trevJ.lua",
		config = 'require("trevj").setup()',
		init = function()
			vim.keymap.set("n", "<leader>j", function()
				require("trevj").format_at_cursor()
			end)
		end,
	},
	-- Use cs and ds to Change surround --
	{ "tpope/vim-surround" },
	-- Database Interface --
	{ "kristijanhusak/vim-dadbod-ui" },
	{ "kristijanhusak/vim-dadbod-completion" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	-- DATA SCIENCE TOOLS ---
	-- qmd, ipynb, py, r, tex --
	{ "goerz/jupytext.vim" },
	{ "devOpifex/r.nvim" },
	{ "quarto-dev/quarto-nvim" },
	{ "jpalardy/vim-slime" },
	{ "jamespeapen/Nvim-R" },
	{ "ncm2/ncm2" },
	{ "roxma/nvim-yarp" },
	{ "gaalcaras/ncm-R" },
	{ "lervag/vimtex" },
	{ "christoomey/vim-tmux-runner" },
	-- Python Cond/Venv Management --
	{ "AckslD/swenv.nvim" },
	{ "stevearc/dressing.nvim" },
	-- Navigate Between TMUX and NVIM --
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- CMP Plugins added to Lunar Vim Base --
	{ "sirver/UltiSnips" },
	{ "jmbuhr/otter.nvim" },
	{ "amarakon/nvim-cmp-lua-latex-symbols" },
	{ "ncm2/ncm2-ultisnips" },
	-- Code Spell --
	{ "davidmh/cspell.nvim" },
	-- Other plugins can be added here
}
