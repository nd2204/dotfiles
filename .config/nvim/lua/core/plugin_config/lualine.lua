local colors = {
  orange = '#fe8019',
  blue   = '#83a598',
  cyan   = '#8ec07c',
  dark   = '#1d2021',
  black  = '#282828',
  white  = '#ebdbb2',
  red    = '#fb4934',
  bg2    = '#504945',
  gray   = '#3c3836',
  violet = '#d3869b'
}
--[[
local gruvbox = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.bg2 },
    c = { fg = colors.white, bg = colors.gray },
  },

  insert = { a = { fg = colors.black, bg = colors.cyan } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  command = { a = { fg = colors.black, bg = colors.blue } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.gray },
    b = { fg = colors.white, bg = colors.gray },
    c = { fg = colors.white, bg = colors.gray },
  },
}
]]
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox' ,
    --component_separators = { left = '', right = '' },
    --section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
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
-- require('lualine').setup({
--   options = {
--     theme = 'gruvbox',
--     section_separators = '',
--     component_separators = '',
--     icons_enabled = true,
--     disabled_filetypes = {}
--   },
--   sections = {

--     lualine_b = { {'branch'}, {'diff'} },
--     lualine_x = { 'encoding', 'filetype', 'fileformat'},
--     lualine_y = { 'progress' },
--     lualine_z = { 'location'  },
--   }
-- })
