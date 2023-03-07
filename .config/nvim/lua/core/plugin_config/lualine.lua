local lualine = require('lualine')
local colors = {
  bg0_h  = '#1D2021',
  bg0_s  = '#32302F',
  bg0    = '#282828',
  bg1    = '#3C3836',
  bg2    = '#504945',
  gray   = '#928374',
  aqua   = '#689D6A',
  orange = '#D65D0E',
  blue   = '#458588',
  white  = '#EBDBB2',
  yellow = '#D79921',
  purple = '#B16286',

  bright = {
    gray   = '#A89984',
    aqua   = '#8EC07C',
    orange = '#FE8019',
    blue   = '#83A598',
    yellow = '#FABD2F',
    purple = '#D3869B',
    red    = '#FB4934',
  }
}

local gruvbox = {
  normal = {
    a = { fg = colors.bg0_h  , bg = colors.bright.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.bg1 },
    c = { fg = colors.gray, bg = colors.bg0 },
  },

  insert = { a = { fg = colors.bg0, bg = colors.aqua, gui = 'bold' } },
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

  inactive_winbar = {
  }
}

lualine.setup(config)
