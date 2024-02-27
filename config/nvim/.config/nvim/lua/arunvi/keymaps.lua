local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set --vim.api.nvim_set_keymap
keymap('n', '<Space>', '<NOP>', opts)
keymap('n','<leader>h',':nohlsearch<CR>',{desc = 'Disable Highlighted Search'}, opts)

-- Navigate buffers
keymap('n','<S-h>',':bprevious<CR>',opts)
keymap('n','<S-l>',':bnext<CR>',opts)
-- Navigate tabs
keymap('n','<Tab>','<cmd>tabnext<CR>',opts)
keymap('n','<S-Tab>','<cmd>tabprevious<CR>',opts)

-- Escape from insert mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap = true})

-- Resize pane with arrow keymap
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Resize pane with meta/alt key
vim.api.nvim_set_keymap('n', '<M-j>', ':resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-k>', ':resize +2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-h>', ':vertical resize -2<CR>', opts)
vim.api.nvim_set_keymap('n', '<M-l>', ':vertical resize +2<CR>', opts)

-- (theprimeagen keymap) 
vim.keymap.set('x', '<leader>p', "\"_dP") -- Remap for not overwrite the copy register with the currently deleted 
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-f>',"<cmd>lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown({previewer = false}))<cr>")

-- VISUAL
-- Move text up and down
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})

-- VISUAL-BLOCK
-- Move text up and down
keymap("x", "J", ":move \'>+1<CR>gv=gv", opts)
keymap("x", "K", ":move \'<-2<CR>gv=gv", opts)
