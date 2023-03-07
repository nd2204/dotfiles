vim.opt.list = true
vim.g.indent_blankline_space_char_highlight = 'IndentBlanklineSpaceChar'

vim.opt.termguicolors = true

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_end_of_line = true,
  show_current_context_start =false,
}
