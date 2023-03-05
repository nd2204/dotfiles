vim.opt.list = true
vim.g.indent_blankline_space_char_highlight = 'IndentBlanklineSpaceChar'

vim.opt.termguicolors = true

vim.cmd('highlight IndentBlanklineSpaceChar guifg=#928374')
vim.cmd('highlight IndentBlanklineContextSpaceChar guifg=#504945')
vim.cmd('highlight IndentBlanklineContextChar guifg=#ebdbb2')
vim.cmd('highlight IndentBlanklineChar guifg=#504945')

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_end_of_line = true,
  show_current_context_start =false,
}
