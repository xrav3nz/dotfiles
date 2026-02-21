-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","

vim.opt.clipboard = ""

vim.opt.relativenumber = false

vim.g.snacks_animate = false

vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "standardrb"

vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = true

-- Soft wrap at word boundaries with a visual indent
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
vim.opt.breakindent = true

-- Revert some LazyVim options

-- I am used to scrolloff=0 so that H is the first line of the window.
vim.opt.scrolloff = 0
