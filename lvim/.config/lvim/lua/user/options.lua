-- General options
vim.opt.relativenumber = true -- Set relative line numbers
vim.ignorecae = true          -- Ingnore  case in search
vim.smartcase = true          -- Case-sensitive search when search term contains uppercase character

-- Colorschemes --
lvim.colorscheme = "tokyonight-night"
vim.g.rout_follow_colorscheme = 1

-- Markdown preview browser
vim.g.mkdp_browser = "google-chrome"
vim.g.mkdp_auto_start = 0
vim.g.mkdp_open_ip = "127.0.0.1"
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_refresh_slow = 1
vim.g.mkdp_theme = "dark"
vim.g.mkdp_theme = 1
vim.g.mkdp_combine_preview_auto_refresh = 1
vim.g.mkdp_page_title = '「${name}」'

-- Obsidan Settings
vim.opt.conceallevel = 2

-- Vim slime options
vim.g.slime_bracketed_paste = 1
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }
vim.g.slime_slime_cell_delimiter = "#\\s\\=%%"
