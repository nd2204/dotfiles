vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.cursorline = true         -- underline current row cursor on
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.shiftround = true
vim.opt.expandtab = true          -- Convert tab to spaces
vim.opt.smartindent =true         -- make indenting smarter again
vim.opt.textwidth = 80
vim.opt.showmode = false          -- No more --Insert-- indication
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
vim.opt.showtabline = 0           -- always show tabs
vim.opt.wrap = true               -- wrap line
vim.opt.linebreak = true          -- wrap whole word when wrap is enable
vim.opt.guifont = "FiraCode Nerd Font"

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

require'colorizer'.setup()

vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])
