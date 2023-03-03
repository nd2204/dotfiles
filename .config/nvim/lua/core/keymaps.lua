local opts = { noremap=true, silent=true }
vim.keymap.set('n','<leader>h',':nohlsearch<CR>')
vim.keymap.set('n','<A-h>',':bprevious<CR>',opts)
vim.keymap.set('n','<A-l>',':bnext<CR>',opts)

vim.api.nvim_set_keymap('n', '<leader>`', ':!x86_64-w64-mingw32-gcc % -o %<.exe<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>~', ':!gcc % -o %<<CR>', opts)
