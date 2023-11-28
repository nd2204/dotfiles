-- Bootstrapping lazy (Plugins manager)
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

local function is_enabled(plugin)
    return Arunvi.plugins[plugin].enabled
end

-- Table of plugins
local plugins = {
    -- My plugins here
    {
        -------------------------------------------------------------------------
        -- Productivity
        'tpope/vim-surround',
        'tpope/vim-commentary',
        'lewis6991/gitsigns.nvim',
        'windwp/nvim-autopairs',
        'nvim-tree/nvim-tree.lua',
        'lewis6991/impatient.nvim',
        'akinsho/toggleterm.nvim',
        "andweeb/presence.nvim",
        "ahmedkhalf/project.nvim",
        'Wansmer/treesj',
        'LunarVim/bigfile.nvim',
        'sevko/vim-nand2tetris-syntax',
    },
    {
        -------------------------------------------------------------------------
        -- UIs
        'nvim-lualine/lualine.nvim',
        'nvim-tree/nvim-web-devicons',
        -- 'tamton-aquib/staline.nvim',
        -- 'akinsho/bufferline.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- {'glepnir/dashboard-nvim', event = "VimEnter", dependencies = {'nvim-tree/nvim-web-devicons'}},

        {
            -- which-key
            "folke/which-key.nvim",
        },

        {
            -- vim-notify
            "rcarriga/nvim-notify",
            event = "BufEnter",
            opts = {
                level = 3,
                render = "minimal",
                timeout = 1500,
                top_down = true,
                max_height = function()
                    return math.floor(vim.o.lines * 0.5)
                end,
                max_width = function()
                    return math.floor(vim.o.columns * 0.75)
                end,
            },
        },
        {
            -- noice
            "folke/noice.nvim",
            event = "VeryLazy",
            keys = false,
            dependencies = {
                "MunifTanjim/nui.nvim",
            },
        },
        {
            -- Trouble
            'folke/trouble.nvim',
            config = function ()
                require('trouble').setup()
            end
        },
        {
            -- Focus mode
            "folke/zen-mode.nvim",
            "folke/twilight.nvim",
        },
    },

    -------------------------------------------------------------------------
    {
        -- Colorscheme
        {"catppuccin/nvim", name = "catppuccin" },
        {'rose-pine/neovim', name = 'rose-pine'},
        "ellisonleao/gruvbox.nvim",
        "sainnhe/gruvbox-material",
        "sainnhe/everforest",
    },

    -------------------------------------------------------------------------
    {
        -- Syntax
        'nvim-treesitter/nvim-treesitter',
        'windwp/nvim-ts-autotag',
        {'RRethy/nvim-treesitter-endwise', enabled = is_enabled('treesitter')},
        {'RRethy/nvim-treesitter-textsubjects', enabled = is_enabled('treesitter')},
        'p00f/nvim-ts-rainbow',
        "lukas-reineke/indent-blankline.nvim",
        'norcalli/nvim-colorizer.lua',
    },

    -------------------------------------------------------------------------
    {
        -- Completion plugins
        {'hrsh7th/nvim-cmp', enabled = is_enabled('lsp')},
        {'hrsh7th/cmp-nvim-lsp', enabled = is_enabled('lsp')},
        {'hrsh7th/cmp-buffer', enabled = is_enabled('lsp')},
        {'hrsh7th/cmp-path', enabled = is_enabled('lsp')},
        {'hrsh7th/cmp-cmdline', enabled = is_enabled('lsp')},
        {'saadparwaiz1/cmp_luasnip', enabled = is_enabled('lsp')},
    },
    -------------------------------------------------------------------------
    {
        -- Snippet
        {"L3MON4D3/LuaSnip", enabled = is_enabled('lsp')},  -- snippet engine
        {"rafamadriz/friendly-snippets", enabled = is_enabled('lsp')}, -- a bunch of snippets to use
    },
    -------------------------------------------------------------------------
    {
        -- LSP plugins
        {"williamboman/mason.nvim", enabled = is_enabled('lsp')},
        {"williamboman/mason-lspconfig.nvim", enabled = is_enabled('lsp')},
        {"neovim/nvim-lspconfig", enabled = is_enabled('lsp')},
        {"onsails/lspkind.nvim", enabled = is_enabled('lsp')}, -- Vscode like picktogram for completion
        {"glepnir/lspsaga.nvim", event = "BufRead"}, -- LSP UIs
        {"jose-elias-alvarez/null-ls.nvim", enabled = is_enabled('lsp')},
        {'RRethy/vim-illuminate'},
        {'jay-babu/mason-null-ls.nvim', event = { "BufReadPre", "BufNewFile" }, enabled = is_enabled('lsp')}
    },
    {
        -- Debugger
        {'mfussenegger/nvim-dap', enabled = is_enabled('dap')}, -- debugging plugins
        {'theHamsta/nvim-dap-virtual-text', enabled = is_enabled('dap')}, -- inline variable definition
        -- {'nvim-telescope/telescope-dap.nvim', enabled = is_enabled('dap')},
        {'rcarriga/nvim-dap-ui', enabled = is_enabled('dap')}, -- debugger UIs
        {'jay-babu/mason-nvim-dap.nvim', event = "VeryLazy", enabled = is_enabled('dap')},
    },

    -------------------------------------------------------------------------
    -- Markdown
    'godlygeek/tabular',
    'preservim/vimux',
}

local opts = {}

require("lazy").setup(plugins, opts)
