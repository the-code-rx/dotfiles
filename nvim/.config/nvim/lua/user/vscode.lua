-- Function to manage editor size
function _G.manageEditorSize(count, to)
  count = count or 1
  for _ = 1, count do
    if to == 'increase' then
      vim.fn.VSCodeNotify('workbench.action.increaseViewSize')
    else
      vim.fn.VSCodeNotify('workbench.action.decreaseViewSize')
    end
  end
end

-- Commentary function for VSCode
function _G.vscodeCommentary(...)
  local args = { ... }
  if #args == 0 then
    vim.api.nvim_set_option('operatorfunc', 'v:lua.vscodeCommentary')
    return 'g@'
  end

  local line1, line2
  if #args > 1 then
    line1, line2 = args[1], args[2]
  else
    line1, line2 = vim.fn.line("'["), vim.fn.line("']")
  end

  vim.fn.VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
end

-- Function to open VSCode commands in visual mode
function _G.openVSCodeCommandsInVisualMode()
  vim.cmd('normal! gv')
  local visualmode = vim.fn.visualmode()
  if visualmode == "V" then
    local startLine = vim.fn.line("v")
    local endLine = vim.fn.line(".")
    vim.fn.VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
  else
    local startPos = vim.fn.getpos("v")
    local endPos = vim.fn.getpos(".")
    vim.fn.VSCodeNotifyRangePos("workbench.action.showCommands", startPos[2], endPos[2], startPos[3], endPos[3], 1)
  end
end

-- Function to open WhichKey in visual mode
function _G.openWhichKeyInVisualMode()
  vim.cmd('normal! gv')
  local visualmode = vim.fn.visualmode()
  if visualmode == "V" then
    local startLine = vim.fn.line("v")
    local endLine = vim.fn.line(".")
    vim.fn.VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
  else
    local startPos = vim.fn.getpos("v")
    local endPos = vim.fn.getpos(".")
    vim.fn.VSCodeNotifyRangePos("whichkey.show", startPos[2], endPos[2], startPos[3], endPos[3], 1)
  end
end

-- Key mappings for better navigation
vim.api.nvim_set_keymap('n', '<C-j>', ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
vim.api.nvim_set_keymap('x', '<C-j>', ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
vim.api.nvim_set_keymap('x', '<C-k>', ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
vim.api.nvim_set_keymap('x', '<C-h>', ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })
vim.api.nvim_set_keymap('x', '<C-l>', ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })

vim.api.nvim_set_keymap('n', 'gr', ":call VSCodeNotify('editor.action.goToReferences')<CR>", { silent = true })

vim.api.nvim_set_keymap('x', '<C-/>', "v:lua.vscodeCommentary()", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-/>', "v:lua.vscodeCommentary() .. '_'", { expr = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-w>_', ":<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>",
  { silent = true })

vim.api.nvim_set_keymap('n', '<Space>', ":call VSCodeNotify('whichkey.show')<CR>", { silent = true })
vim.api.nvim_set_keymap('x', '<Space>', ":<C-u>lua openWhichKeyInVisualMode()<CR>", { silent = true })

vim.api.nvim_set_keymap('x', '<C-P>', ":<C-u>lua openVSCodeCommandsInVisualMode()<CR>", { silent = true })

-- Commentary mappings
vim.api.nvim_set_keymap('x', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('n', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('o', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('n', 'gcc', '<Plug>VSCodeCommentaryLine', {})

-- Simulate same TAB behavior in VSCode
vim.api.nvim_set_keymap('n', '<Tab>', ':Tabnext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':Tabprev<CR>', { silent = true })

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'
