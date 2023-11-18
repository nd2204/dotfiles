-- local p = require('rose-pine.palette')
require("noice").setup({
    presets = {
        -- you can enable a preset by setting it to true, or a table that will override the preset config
        -- you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
    },
    views = {
        cmdline_popup = {
            position = {
                row = 20,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
            -- border = {
            --     style = 'none',
            --     padding = { 1, 2 },
            -- },
            filter_options = {},
            win_options = {
                -- winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
        popupmenu = {
            relative = "editor",
            position = {
                row = 8,
                col = "50%",
            },
            size = {
                width = 60,
                height = 10,
            },
            border = {
                style = "rounded",
                padding = { 0, 1 },
            },
            win_options = {
                winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
        },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
    },
    popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        -- -@type 'nui'|'cmp'
        backend = "cmp", -- backend to use to show regular cmdline completions
        -- -@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = {}, -- set to `false` to disable icons

    },
})
