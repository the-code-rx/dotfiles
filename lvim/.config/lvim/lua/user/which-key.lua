-- The base of this which-key config was taken from https://github.com/IfCodingWereNatural/minimal-nvim/tree/lunarvim
local wk = lvim.builtin.which_key

-- DadBod UI Keymaps --
wk.mappings["D"] = {
  name = "DBUI",
  b = { ":DBUI<cr>", " Open DBUI" },
  t = { ":DBUIToggle<cr>", " Toggle DBUI" },
  c = { ":DBUIClose<cr>", " Close DBUI" },
  a = { ":BDUIAddConnection<cr>", " Add Connection" }
}

-- Persistence.nvim Keymaps --
wk.mappings["S"] = {
  name = "Persistence.nvim",
  s = { "<cmd>lua require('persistence').load()<cr>", "Reload last session for dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Obsidian Keymaps --
wk.mappings["o"] = {
  name = "Obsidian",
  t = { ':ObsidianTemplate<cr>', "Obsidian Templates" },
  T = { ":ObsidianTags<cr>", "Obsidian Tags" },
  b = { ":ObsidianBacklinks<cr>", "Obsidian Backlinks" },
}

-- LSP Restart added to LSP defaults for LunarVim --
wk.mappings["lR"] = { ":LspRestart<cr>", "LSP Restart" }

-- Harpoon Keymaps --
wk.mappings["m"] = { ":lua require('harpoon.mark').add_file()<cr>", "Harpoon Mark File" }
wk.mappings["h"] = {
  name = "Harpoon",
  t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpon.ui').nav_file(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
  n = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
  p = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

-- Remapping noh from default of h no n --
wk.mappings["n"] = { ":noh<cr>", "No Highlight" }

-- Telescope Kemaps Added to defults already in LunarVim --
wk.mappings['x'] = { ":xa<cr>", "Save All & Quit", }
wk.mappings["sp"] = { ":Telescope projects<cr>", 'Projects' }
wk.mappings["sB"] = { ":Telescope git_branches<cr>", 'Branches' }
wk.mappings["sb"] = { ":Telescope buffers<cr>", 'Buffers' }
wk.mappings["sw"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  "Search Word Under Cursor"
}
wk.mappings["sc"] = { ":Telescope commands<cr>", "Commands" }
wk.mappings["sC"] = { ":Telescope command_history<cr>", "Command History" }
wk.mappings["sj"] = { ":Telescope jumplist", "Jumplist" }
wk.mappings["sz"] = { "Telescope current_buffer_fuzzy_find", "fzf Search Current Buffer" }

-- Remapping c to :bd as that is what I would expect it to do. --
wk.mappings["c"] = { ":bd<cr>", "Buffer Delete" }

-- Git Kemaps added to defaults for LunarVim --
wk.mappings["gt"] = { ":Gitsigns toggle_current_line_blame<cr>", "Toggle Line Blame" }

--Python virtual env swithcer --
wk.mappings["lp"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Python Env" }
