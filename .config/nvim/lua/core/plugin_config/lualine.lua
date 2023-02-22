local colors = {
  blue   = '#458588',
  cyan   = '#79dac8',
  black  = '#282828',
  white  = '#c6c6c6',
  red    = '#ff5189',
  grey   = '#303030',
  violet = '#d3869b'
}
--[[
local gruvbox = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}
--]]
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox' ,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {{'filename',path=1}},
    lualine_b = {  },
    lualine_c = {  },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {  },
  },
}
