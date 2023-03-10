local lualine = require('lualine')
local colors = {
  bg0_h  = '#1d2021',
  bg0_s  = '#32302f',
  bg0    = '#282828',
  bg1    = '#3c3836',
  bg2    = '#504945',
  gray   = '#928374',
  aqua   = '#689d6a',
  orange = '#d65d0e',
  blue   = '#458588',
  white  = '#ebdbb2',
  yellow = '#d79921',
  purple = '#b16286',

  bright = {
    gray   = '#a89984',
    aqua   = '#8ec07c',
    orange = '#fe8019',
    blue   = '#83a598',
    yellow = '#fabd2f',
    purple = '#d3869b',
    red    = '#fb4934',
  }
}

local gruvbox = {
  normal = {
    a = { fg = colors.bg0_h  , bg = colors.bright.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.bg1 },
    c = { fg = colors.gray, bg = colors.bg0 },
  },

  insert = { a = { fg = colors.bg0, bg = colors.bright.aqua, gui = 'bold' } },
  visual = { a = { fg = colors.bg0, bg = colors.orange, gui = 'bold' } },
  command = { a = { fg = colors.bg0, bg = colors.yellow, gui = 'bold'  } },
  replace = { a = { fg = colors.bg0, bg = colors.bright.red, gui = 'bold'  } },

  inactive = {
    a = { fg = colors.bg2, bg = colors.bg0 },
    b = { fg = colors.bg2, bg = colors.bg0 },
    c = { fg = colors.bg2, bg = colors.bg0 },
  },
}

-- Config
local config = {
  options = {
    icons_enabled = true,
    theme = gruvbox,
    disabled_filetypes = {"NvimTree"},
    component_separators = { left = '|', right = '|'},
    --section_separators = { left = '', right = '' },

  },
  sections = {
    lualine_a = {{'mode'},{''}},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {{'diff'},{'filetype'}},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {{'filename',path=1}},
    lualine_b = {  },
    lualine_c = {  },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {  },
  },
  -- winbar = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
}

lualine.setup(config)
