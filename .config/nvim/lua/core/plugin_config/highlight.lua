-- IndentBlankline highlight
vim.cmd('highlight IndentBlanklineSpaceChar guifg=#928374')
vim.cmd('highlight IndentBlanklineContextSpaceChar guifg=#504945')
vim.cmd('highlight IndentBlanklineContextChar guifg=#ebdbb2')
vim.cmd('highlight IndentBlanklineChar guifg=#504945')

-- winbar highlight
vim.cmd('highlight Winbar ctermbg=NONE guibg=NONE') --tranparent winbar
vim.cmd('highlight WinbarNC ctermbg=NONE guibg=NONE') --tranparent winbar
-- Cursorline
vim.cmd('highlight CursorLine ctermbg=NONE guibg=NONE') -- Cursorline colors
vim.cmd('highlight CursorLineNR guibg=NONE') -- Cursoline number column highlight
vim.cmd('highlight CursorLineSign ctermbg=NONE guibg=NONE')
vim.cmd('highlight String guibg=NONE guifg=#98971A gui=italic')
vim.cmd('highlight Visual gui=italic guifg=NONE guibg=#3c3836')

-- Nvim Tree
vim.cmd('highlight NvimTreeFolderIcon guifg=#FE8019')
vim.cmd('highlight NvimTreeIndentMarker guifg=#504945')
vim.cmd('highlight NvimTreeWindowPicker guibg=#458588 guifg=#282828')
vim.cmd('highlight NvimTreeRootFolder guibg=NONE guifg=#ebdbb2')
vim.cmd('highlight Directory guifg=#8EC07C gui=bold')
