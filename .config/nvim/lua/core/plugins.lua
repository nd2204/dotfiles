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
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  "lukas-reineke/indent-blankline.nvim",
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',  -- remove also at the bottom of this file
  -- 'ntpeters/vim-better-whitespace',
  {
    'nvim-telescope/telescope.nvim',
    tag='0.1.1',
    dependencies = {{'nvim-lua/plenary.nvim'}}
  },
  -- cmp plugins
  {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip'
  },
  {
  -- Snippet
    "L3MON4D3/LuaSnip",               -- snippet engine
    "rafamadriz/friendly-snippets"    -- a bunch of snippets to use
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'onsails/lspkind.nvim', -- Vscode like picktogram for completion
    'mfussenegger/nvim-dap', -- debugging plugins
    'rcarriga/nvim-dap-ui', -- debugger UIs
    "glepnir/lspsaga.nvim", event = "BufRead", -- LSP UIs
  },
  {
    'windwp/nvim-autopairs',config = function() require("nvim-autopairs").setup {} end
  },
  --'junegunn/fzf',
  --'junegunn/fzf.vim',
  --use 'preservim/vimux'
  --use 'easymotion/vim-easymotion'
}
local opts = {}
require("lazy").setup(plugins, opts)
