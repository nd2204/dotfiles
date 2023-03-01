require('bufferline').setup {
  options = {
    mode = "tabs",
    number = "ordinal",
    --mouse
    middle_mouse_command = "bdelete! %d",
    right_mouse_command = nil,
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "slant",
    indicator = {style = 'none'},
  },
  highlights = {
    separator = {
      fg = '#282828',
      bg = '#504945'
    },
    separator_selected = {
      fg = '#3c3836'
    },
    background = {
      fg = '#ebdbb2',
      bg = '#3c3836'
    },
    fill = {
      bg = '#3c3836'
    }
  }
}


