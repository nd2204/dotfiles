-- local Popup = require("nui.popup")
-- local Event = require("nui.utils.autocmd").event

local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert")             -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")       -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no") -- no sign column

local aucmds =
{
    ["cpp"] = "<CMD>term g++ -std=c++17 -O2 -Wall % -o main && ./main ; rm main<CR>",
    ["c"]   = "<CMD>term gcc -O2 -Wall % -o main && ./main ; rm main<CR>",
    ["rs"]  = "<CMD>term rustc --edition=2018 -C opt-level=3 % -o main && ./main ; rm main<CR>",
    ["py"]  = "<CMD>term python3 %<CR>",
}

local buffopts = {buffer = true, noremap = false}
for ext, cmd in pairs(aucmds)  do
    api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
        pattern = {"*." .. ext},
        callback = function()
            vim.keymap.set({"n"}, "<C-b>", cmd, buffopts)
        end
    })
    -- print(ext, cmd)
end

-- local new_popup = Popup({
--     enter = true,
--     focusable = true,
--     relative = 'win',
--     border = {
--         style = 'single',
--         text = {
--             top = ' Output ',
--         }
--     },
--     position = '50%',
--     size = {
--         width = '90%',
--         height = '90%',
--     },
--     buf_options = {
--         modifiable = true,
--         readonly = false,
--     },
--     win_options = {
--         winblend = 0,
--         winhighlight = "Normal:Normal, FloatBorder:FloatBorder"
--     }
-- })

-- new_popup:mount()

-- for i = 1,1000000,1 do
--     new_popup.border:set_text("top", tostring(i),"right")
-- end

-- new_popup:on(Event.BufLeave, function()
--     new_popup:unmount()
-- end)
