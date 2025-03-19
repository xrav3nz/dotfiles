-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "jk", "<esc>")

if vim.g.vscode then
  map("n", "<leader>wh", "<cmd>lua require('vscode').call('workbench.action.splitEditorLeft')<CR>")
  map("n", "<leader>wl", "<cmd>lua require('vscode').call('workbench.action.splitEditorRight')<CR>")
  map("n", "<leader>wk", "<cmd>lua require('vscode').call('workbench.action.splitEditorUp')<CR>")
  map("n", "<leader>wj", "<cmd>lua require('vscode').call('workbench.action.splitEditorDown')<CR>")
else
  map("n", "<leader>wh", "<cmd>leftabove vsplit<CR>")
  map("n", "<leader>wl", "<cmd>rightbelow vsplit<CR>")
  map("n", "<leader>wk", "<cmd>leftabove split<CR>")
  map("n", "<leader>wj", "<cmd>rightbelow split<CR>")
end

map("n", "]<Space>", function()
  local repeated = vim.fn["repeat"]({ "" }, vim.v.count1)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, line, line, true, repeated)
end, { desc = "Insert blank line below" })

map("n", "[<Space>", function()
  local repeated = vim.fn["repeat"]({ "" }, vim.v.count1)
  local line = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, line - 1, line - 1, true, repeated)
end, { desc = "Insert blank line above" })

if vim.g.vscode then
  map("n", "<leader>ff", "<cmd>lua require('vscode').call('workbench.action.quickOpen')<CR>")
  map("n", "<leader>fb", "<cmd>lua require('vscode').call('workbench.action.showAllEditors')<CR>")
  map("n", "<leader>/", "<cmd>lua require('vscode').call('workbench.action.findInFiles')<CR>")
  map(
    "n",
    "<leader><leader>",
    "<cmd>lua require('vscode').call('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')<CR>"
  )
end
