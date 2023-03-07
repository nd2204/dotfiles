local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set --vim.api.nvim_set_keymap
keymap('n','<leader>h',':nohlsearch<CR>',{})
-- Navigate buffers
keymap('n','<S-h>',':bprevious<CR>',opts)
keymap('n','<S-l>',':bnext<CR>',opts)
-- Navigate tabs
keymap('n','<Tab>','<cmd>tabnext<CR>',opts)
keymap('n','<S-Tab>','<cmd>tabprevious<CR>',opts)
-- Set the keymap for the file type
keymap('n', '<leader>`', ':!x86_64-w64-mingw32-gcc % -o %<.exe<CR>', opts)
keymap('n', '<leader>~', ':!gcc % -o %<<CR>', opts)

-- Resize pane with arrow keymap
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- VISUAL
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- VISUAL-BLOCK
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- NvimTree
vim.keymap.set({'n','i'},'<c-n>','<cmd>NvimTreeFindFileToggle<CR>', opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-p>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n",'<Space><Space>',"<cmd>Telescope oldfiles<CR>", opts)
keymap('n','<C-t>',"<cmd>Telescope help_tags<CR>", opts)
