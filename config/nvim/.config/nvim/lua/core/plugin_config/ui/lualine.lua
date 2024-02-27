local function get_current_dir()
  local cwd = vim.fn.getcwd()
  local last_separator = string.find(string.reverse(cwd), "/")
  return [[ ]]..string.sub(cwd, last_separator * -1 + 1)
end

local theme = Arunvi.option.background.colorscheme
local cls = require("core.plugin_config.colorscheme."..theme)
local custom_theme = {}

if cls then
    local colors = cls.getcolors()
    custom_theme = {
        normal = {
            a = {bg = colors.green, fg = colors.bg_0, gui = 'bold'},
            b = {bg = colors.bg_4, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        },
        insert = {
            a = {bg = colors.blue, fg = colors.bg_0, gui = 'bold'},
            b = {bg = colors.bg_4, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        },
        visual = {
            a = {bg = colors.yellow, fg = colors.bg_0, gui = 'bold'},
            b = {bg = colors.bg_4, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        },
        replace = {
            a = {bg = colors.red, fg = colors.bg_0, gui = 'bold'},
            b = {bg = colors.bg_5, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        },
        command = {
            a = {bg = colors.aqua, fg = colors.bg_0, gui = 'bold'},
            b = {bg = colors.bg_4, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        },
        inactive = {
            a = {bg = colors.bg_1, fg = colors.bg_4, gui = 'none'},
            b = {bg = colors.bg_4, fg = colors.grey_2},
            c = {bg = colors.bg_1, fg = colors.grey_0}
        }
    }
    require("lualine").setup({options = { theme = custom_theme}})
else
    require("lualine").setup({options = { theme = "auto"}})
end


require('lualine').setup {
    options = {
        icons_enabled = true,
        -- section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '/', right = '\\'},
        -- component_separators = { left = '▕', right = '▏'},
        component_separators = { left = '|', right = '|'},
        disabled_filetypes = {
            -- statusline = {'NvimTree'},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },

    sections = {
        lualine_a =
        {
            get_current_dir
        },
        lualine_b =
        {
            {
                'buffers',
                use_mode_colors = false,
                buffers_color = {
                    active = 'lualine_b_normal',
                    inactive = 'lualine_c_inactive',
                },
                symbols = { alternate_file = '' },
            },
            { 'branch', icon = '' },
            { 'diff' },
        },
        lualine_c =
        {
        },
        lualine_x = {
            {
                'diagnostics',
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            },
            { 'encoding' },
            { 'fileformat' }
        },
        lualine_y =
        {
            { 'progress' }
        },
        lualine_z = {}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
