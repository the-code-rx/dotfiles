-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Function to manage editor size
vim.api.nvim_command(
  'command! ReloadSnippets lua require("luasnip.loaders.from_vscode").load({ paths = { "~/.config/nvim/snippets" } })'
)
