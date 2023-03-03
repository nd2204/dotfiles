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
  {
    'nvim-telescope/telescope.nvim',
    tag='0.1.1',
    dependencies = {{'nvim-lua/plenary.nvim'}}
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
  },
  'ntpeters/vim-better-whitespace',
  {
    'windwp/nvim-autopairs',config = function() require("nvim-autopairs").setup {} end
  },
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  },
  {
    'kdheepak/tabline.nvim',
    vim.cmd[[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  }
  --'junegunn/fzf',
  --'junegunn/fzf.vim',
  --use 'preservim/vimux'
  --use 'easymotion/vim-easymotion'
}

local opts = {}

require("lazy").setup(plugins, opts)
