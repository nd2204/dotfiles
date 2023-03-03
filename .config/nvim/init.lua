vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.cursorline = true -- underline current row cursor on
vim.opt.relativenumber = true
-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent =true

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- Enable signcolumn
-- vim.wo.signcolumn = 'yes' --wo (window-option)
