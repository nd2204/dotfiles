Arunvi = {}

Arunvi.option = {
    tabwidth = 4,
    background = {
        colorscheme = "gruvbox", -- Available: gruvbox | rose-pine | catppuccin | everforest
        mode = "dark", -- Available: "dark" | "light" -- NOT RECOMMENDED
        transparent = false,
        dim = false,
    },
    cmdheight = 1,
}

Arunvi.plugins = {
    lsp = {enable = true},
    dap = {
        enable = false,
        virtualtext = {enable = true},
        toggle_ui = function() require('dapui').toggle() end,
        close_ui = function() require('dapui').close() end,
    },
    treesitter = {
        enable = true, rainbow = {enable = false},
    },
    project = {enable = true},
    NvimTreeWidth = 40,
    toggleterm = {
        make = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local _make = Terminal:new({cmd="make", direction = "float"})
            return _make:toggle()
        end,
        lazygit = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local _lazygit = Terminal:new({cmd="lazygit", direction = "float"})
            return _lazygit:toggle()
        end,
        ranger = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local _ranger = Terminal:new({cmd="ranger", direction = "float"})
            return _ranger:toggle()
        end,
        htop = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local _htop = Terminal:new({cmd="htop", direction = "float"})
            return _htop:toggle()
        end,
        bs = function()
            local Terminal = require('toggleterm.terminal').Terminal
            local _bs = Terminal:new({cmd="browser-sync -s -f -w", direction = "horizontal"})
            return _bs:toggle()
        end,
    },
}

Arunvi.helper = {
    refresh = function()
        vim.cmd('so ' .. vim.fn.getenv("MYVIMRC"))
    end,
    tmuxIsRunning = function()
        local result = os.getenv("TMUX")
        return not (result == nil or result == "")
    end,
    zellijIsRunning = function()
        local result = os.getenv("ZELLIJ")
        return not (nil == result or "" == result)
    end
}

local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local aucmds =
{
    ["cpp"] = "<CMD>term g++ % -o main && ./main && rm main<CR>",
    ["c"] = "<CMD>term g++ % -o main && ./main && rm main<CR>",
    ["rs"] = "<CMD>term rustc % -o main && ./main && rm main <CR>"
}

local buffopts = {buffer = true, noremap = true}
api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.cpp"},
    callback = function()
        vim.keymap.set("n", "<C-b>", "<CMD>term g++ % -o main && ./main && rm main<CR>", buffopts)
    end
})

api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c"},
    callback = function()
        vim.keymap.set("n", "<C-b>", "<CMD>term gcc % -o main && ./main && rm main<CR>", buffopts)
    end
})

api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.rs"},
    callback = function()
        vim.keymap.set("n", "<C-b>", "<CMD>term rustc % -o main && ./main && rm main<CR>", buffopts)
    end
})

require("arunvi.options")
require("arunvi.plugins")
require("arunvi.keymaps")
require("core.plugin_config")
require("core.language-server")
