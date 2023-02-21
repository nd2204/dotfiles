local builtin = require('telescope.builtin')
-- Set global options for Telescope
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { '.exe', '.tmp' },
  },
})

vim.keymap.set('n','<c-p>', builtin.find_files, {})
vim.keymap.set('n','<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n','<Space>fg',builtin.live_grep,{})
vim.keymap.set('n','<Space>fh',builtin.help_tags,{})
