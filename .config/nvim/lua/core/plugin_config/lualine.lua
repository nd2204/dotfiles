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


