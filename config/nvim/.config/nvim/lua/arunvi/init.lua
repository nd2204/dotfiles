Arunvi = {}

Arunvi.option = {
    tabwidth = 4,
    background = {
        colorscheme = "everforest", -- Available: gruvbox | rose-pine | catppuccin | everforest
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
    transparent = {
        handler = function(istransparent)
            if istransparent then
                vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
                vim.cmd('hi NormalFloat ctermbg=NONE guibg=NONE')
                vim.cmd('hi FloatBorder ctermbg=NONE guibg=NONE')
                vim.cmd('hi Winbar ctermbg=NONE guibg=NONE') --tranparent winbar
                vim.cmd('hi WinbarNC ctermbg=NONE guibg=NONE') --tranparent winbar
                vim.cmd('hi NormalNC ctermbg=NONE guibg=NONE') --tranparent winbar

                vim.cmd('hi WinSeparator ctermbg=NONE guibg=NONE')
                vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
                vim.cmd('hi NvimTreeNormal ctermbg=NONE guibg=NONE')
                vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
                vim.cmd('hi NvimTreeWinSeparator guibg=NONE')
                vim.cmd('hi NvimTreeVertSplit guibg=NONE')
                vim.cmd('hi VertSplit guibg=NONE')
                vim.cmd('hi WinSeparator guibg=NONE')
                vim.cmd('hi Cursorline ctermbg=240 guibg=NONE gui=italic')

                -- vim.cmd('hi BufferLineFill guibg=NONE')
                -- vim.cmd('hi BufferLineOffSetSeparator ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineCloseButton ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineCloseButtonVisible ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineCloseButtonSelected ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineBuffer ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineBufferVisible ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineBufferSelected ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineBackground ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineVisibleIndex ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineModified ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineModifiedVisible ctermbg=NONE guibg=NONE')
                -- vim.cmd('hi BufferLineModifiedSelected ctermbg=NONE guibg=NONE')

                vim.cmd('hi ToggleTerm1Normal ctermbg=NONE guibg=NONE')
            end
        end,
        toggle = function ()
            local istransparent = not Arunvi.option.background.transparent
            Arunvi.option.background.transparent = istransparent
            Arunvi.helper.transparent.handler(istransparent)
        end
    }
}

Arunvi.helper.transparent.handler(Arunvi.option.background.transparent)

require("arunvi.options")
require("arunvi.plugins")
require("arunvi.keymaps")
require("core.plugin_config")
require("core.language-server")
