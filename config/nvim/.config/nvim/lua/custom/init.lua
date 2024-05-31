-- local Popup = require("nui.popup")
-- local Event = require("nui.utils.autocmd").event

local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local aucmds =
{
  ["cpp"] = "<CMD>term g++ -std=c++17 -O2 -Wall % -o main && ./main; rm main<CR>",
  ["c"]   = "<CMD>term gcc -O2 -Wall % -o main && ./main ; rm main<CR>",
  ["rs"]  = "<CMD>term rustc --edition=2018 -C opt-level=3 % -o main && ./main ; rm main<CR>",
  ["py"]  = "<CMD>term python3 %<CR>",
  ['lua'] = "<CMD>luafile %<CR>"
}

local buffopts = {buffer = true, noremap = false}
for ext, cmd in pairs(aucmds)  do
  api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*." .. ext},
    callback = function()
      vim.keymap.set({"n"}, "<leader>c", cmd, buffopts)
    end
  })
  -- print(ext, cmd)
end
