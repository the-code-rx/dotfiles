-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
return {
  vim.keymap.set("n", "<leader>Ma", "<Plug>(VM-Select-All)<Tab>", { desc = "Select All" }),
  vim.keymap.set("n", "<leader>Mr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start Regex Search" }),
  vim.keymap.set("n", "<leader>Mp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor At Pos" }),
  vim.keymap.set("n", "<leader>Mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mapping" }),
  vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate<CR>", { desc = "Obsidian Templates" }),
  vim.keymap.set("n", "<leader>oT", ":ObsidianTags<CR>", { desc = "Obsidian Tags" }),
  vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" }),
  vim.keymap.set("n", "<leader>bj", ":BufferLinePick<CR>", { desc = "Jump Buffer" }),
  vim.keymap.set("n", "<leader>cp", ":!npx stylelint *.css --fix<CR>", { desc = "Sort CSS Properties" }),
  vim.keymap.set("n", "<leader>P", ":LiveServerStart<CR>", { desc = "Live Server" }),
  vim.keymap.set("n", "<leader>fy", ":Telescope neoclip plus<CR>", { desc = "Yank Register" }),
}
