require('dashboard').setup({
    theme = 'doom',
    config = {
        header = {
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[]],
            [[ █████╗  ██████╗  ██╗   ██╗ ███╗   ██╗ ██╗   ██╗ ██╗]],
            [[██╔══██╗ ██╔══██╗ ██║   ██║ ████╗  ██║ ██║   ██║ ██║]],
            [[███████║ ██████╔╝ ██║   ██║ ██╔██╗ ██║ ██║   ██║ ██║]],
            [[██╔══██║ ██╔══██╗ ██║   ██║ ██║╚██╗██║ ╚██╗ ██╔╝ ██║]],
            [[██║  ██║ ██║  ██║ ╚██████╔╝ ██║ ╚████║  ╚████╔╝  ██║]],
            [[╚═╝  ╚═╝ ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═══╝   ╚═══╝   ╚═╝]],
            [[]],
            [[]],
            [[]],
        }, --your header
        center = {
            {
                icon = '',
                desc = ' Find Files          ',
                key = '1',
                keymap = 'SPC f f',
                action = 'Telescope find_files'
            },
            {
                icon = '',
                desc = ' Recent Projects     ',
                key = '2',
                keymap = 'SPC f p',
                action = 'Telescope projects'
            },
            {
                icon = '',
                desc = ' Recent Files        ',
                key = '3',
                keymap = 'SPC f o',
                action = 'Telescope oldfiles'
            },
            {
                icon = '',
                desc = ' Config              ',
                key = '4',
                keymap = 'SPC E',
                action = 'edit ~/.config/nvim/lua/arunvi/init.lua'
            },
            {
                icon = '',
                desc = ' Git                ',
                keymap = 'SPC t l',
                key = '5',
                action = 'Arunvi.plugins.toggleterm.lazygit()',
            },
            {
                icon = '',
                desc = ' Exit               ',
                keymap = '???',
                key = 'q',
                action = ':qa!'
            },
        },
        footer = {
            [[]],
            [[]],
            [[Do one thing, do it well - Unix philosophy]]
        },
    },
    hide = {
        statusline = false,    -- hide statusline default is true
        tabline = true,      -- hide the tabline
        winbar = true,        -- hide winbar
    },
})
