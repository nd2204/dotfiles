local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- My plugins here
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  'windwp/nvim-autopairs',
  'nvim-tree/nvim-tree.lua',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  -- Colorscheme
  'ellisonleao/gruvbox.nvim',
  -- Syntax
  'nvim-treesitter/nvim-treesitter',
  'windwp/nvim-ts-autotag',
  'p00f/nvim-ts-rainbow',
  "lukas-reineke/indent-blankline.nvim",
  'norcalli/nvim-colorizer.lua',  -- remove also at the bottom of this file
  -- cmp plugins
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  -- Snippet
  "L3MON4D3/LuaSnip",               -- snippet engine
  "rafamadriz/friendly-snippets",    -- a bunch of snippets to use
  -- LSP plugins
  "williamboman/mason.nvim",
  'jay-babu/mason-nvim-dap.nvim',
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  'onsails/lspkind.nvim', -- Vscode like picktogram for completion
  'mfussenegger/nvim-dap', -- debugging plugins
  'rcarriga/nvim-dap-ui', -- debugger UIs
  "glepnir/lspsaga.nvim", event = "BufRead", -- LSP UIs

  -- 'ntpeters/vim-better-whitespace',
  -- 'junegunn/fzf',
  -- 'junegunn/fzf.vim',
  -- 'preservim/vimux'
  -- 'easymotion/vim-easymotion'
}
local opts = {}

require("lazy").setup(plugins, opts)
