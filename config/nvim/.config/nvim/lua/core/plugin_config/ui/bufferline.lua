local bufferline = require('bufferline')

bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true,
        numbers = "none",
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = "vsplit",          -- can be a string | function, | false see "Mouse actions"
        indicator = {
            icon = '', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '',
        modified_icon = '',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains:
        --     -- name                | str        | the basename of the active file
        --     -- path                | str        | the full path of the active file
        --     -- bufnr (buffer only) | int        | the number of the active buffer
        --     -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
        --     -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        -- end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 20,
        diagnostics = false,  -- | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     return "("..count..")"
        -- end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "", -- "File Explorer" | function ,
                text_align = "center", -- "left" | "center" | "right"
                highlight = "NvimTreeNormal",
                separator = false
            }
        },
        color_icons = false, -- true | false, (whether or not to add the filetype icon highlights)
        -- get_element_icon = function(element)
        --     -- element consists of {filetype: string, path: string, extension: string, directory: string}
        --     -- This can be used to change how bufferline fetches the icon
        --     -- for an element e.g. a buffer or a tab.
        --     -- e.g.
        --     local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        --     return icon, hl
        --     -- or
        --     -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
        --     -- return custom_map[element.filetype]
        -- end,
        show_buffer_icons = false, -- (disable filetype icons for buffers)
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = {'', ''},  -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        hover = {
            enabled = false,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current',
        -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | 
            -- function(buffer_a, buffer_b)
            -- add custom logic
            -- return buffer_a.modified > buffer_b.modified
        -- end
    },
    highlights = {
        fill                    = { link = "NvimTreeNormal" },
        background              = { link = "NvimTreeNormal"},
        tab                     = { link = "NvimTreeNormal" },
        tab_separator           = { link = "NvimTreeNormal" },
        tab_close               = { link = "Fg" },
        buffer                  = { link = "Fg" },
        modified                = { link = "Green" },

        modified_visible        = { link = "Green" },
        close_button            = { link = "NvimtreeNormal" },
        close_button_visible    = { link = "NvimtreeNormal" },
        buffer_visible          = { link = "NvimtreeNormal" },
        indicator_visible       = { link = "NvimtreeNormal"},
        separator_visible       = { link = "NvimTreeNormal" },

        modified_selected       = { link = "Green" },
        close_button_selected   = { link = "Normal" },
        buffer_selected         = { link = "Normal" },
        indicator_selected      = { link = "NvimtreeNormal" },
        separator_selected      = { link = "Normal" },
        tab_selected            = { link = "Normal" },
        tab_separator_selected  = { link = "Normal" },

        separator               = { link = "Normal" },
        offset_separator        = { link = "NvimtreeNormal" },
        trunc_marker            = { link = "NvimtreeNormal" }
    }
}

