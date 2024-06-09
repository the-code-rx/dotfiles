-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
return {
  vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { desc = "Obsidian Templates" }),
  vim.keymap.set("n", "<leader>oT", ":ObsidianTags<CR>", { desc = "Obsidian Tags" }),
  vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" }),
}
