local theme = Arunvi.option.background.colorscheme
local _, cls = pcall(require, "core.plugin_config.colorscheme." .. theme)
if not _ then
    vim.notify("Failed to load config file " .. theme .. ".lua")
    return
end

local M = {}

local colors = cls.getcolors()

M.theme = colors

-- Run the colorscheme setup function
cls.setup()

--------------------------------- Override default color --------------------------------
vim.api.nvim_set_hl(0, "Red",                       { bg = nil, fg = colors.red, ctermfg = 167 })
vim.api.nvim_set_hl(0, "Yellow",                    { bg = nil, fg = colors.yellow, ctermfg = 214 })
vim.api.nvim_set_hl(0, "Orange",                    { bg = nil, fg = colors.orange, ctermfg = 208 })
vim.api.nvim_set_hl(0, "Green",                     { bg = nil, fg = colors.green, ctermfg = 142 })
vim.api.nvim_set_hl(0, "Aqua",                      { bg = nil, fg = colors.aqua, ctermfg = 108 })
vim.api.nvim_set_hl(0, "Blue",                      { bg = nil, fg = colors.blue, ctermfg = 109 })
vim.api.nvim_set_hl(0, "Purple",                    { bg = nil, fg = colors.purple, ctermfg = 175 })

---------------------------------------- Builtin ----------------------------------------
vim.api.nvim_set_hl(0, "Cursorline",                { bg = colors.bg_1 })
vim.api.nvim_set_hl(0, "CursorlineNr",              { fg = colors.fg_1 })
vim.api.nvim_set_hl(0, "CurrentWord",               { bg = colors.bg_3 })
vim.api.nvim_set_hl(0, "FloatBorder",               { bg = nil, fg = colors.grey_1 })
vim.api.nvim_set_hl(0, "LineNr",                    { fg = colors.grey_0 })
vim.api.nvim_set_hl(0, "Normal",                    { bg = colors.bg_0, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "NormalFloat",               { bg = colors.bg_dim, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "Terminal",                  { bg = colors.bg_0, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "VertSplit",                 { bg = colors.bg_dim, fg = colors.bg_3 })
vim.api.nvim_set_hl(0, "WinSeparator",              { bg = nil, fg = colors.grey_0 })
vim.api.nvim_set_hl(0, "MsgSeparator",              { bg = nil, fg = colors.grey_0 })
-- Uis --
vim.api.nvim_set_hl(0, "NormalNC",                  { link = "Normal" })
vim.api.nvim_set_hl(0, "NormalFloat",               { link = "NvimTreeNormal" })
vim.api.nvim_set_hl(0, "Visual",                    { bg = colors.bg_2 } )
vim.api.nvim_set_hl(0, "EndOfBuffer",               { link = "Normal" })
vim.api.nvim_set_hl(0, "NonText",                   { fg = colors.bg_1 })
vim.api.nvim_set_hl(0, "StatusLine",                { link = "NvimTreeNormal" })
vim.api.nvim_set_hl(0, "StatusLineNC",              { link = "NormalNC" })
vim.api.nvim_set_hl(0, "WhiteSpace",                { fg = colors.bg_2 })
vim.api.nvim_set_hl(0, "Comment",                   { bg = nil, fg = colors.aqua})
---------------------------------------- Plugins ----------------------------------------
-- WhichKey --
vim.api.nvim_set_hl(0, "WhichKeyFloat",             { link = "NvimTreeNormal" })
vim.api.nvim_set_hl(0, "WhichKeySeparator",         { bg = nil, fg = colors.grey_0})
vim.api.nvim_set_hl(0, "WhichKeyDesc",              { bg = nil, fg = colors.fg_0})
-- NvimTree --
vim.api.nvim_set_hl(0, "NvimTreeNormal",            { bg = colors.bg_dim, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer",       { link = "NvimTreeNormal" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator",      { link = "VertSplit" })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit" ,        { link = "VertSplit" } )
vim.api.nvim_set_hl(0, "NvimTreeCursorLine" ,       { link = "Cursorline" } )
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker",      { link = "IndentBlanklineChar" } )
vim.api.nvim_set_hl(0, "NvimTreeGitNew",            { link = "Yellow" } )
-- Treesitter --
-- vim.api.nvim_set_hl(0, "TSPunctBracket",            { bg = nil, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "TSProperty",                { bg = nil, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "TSField",                   { bg = nil, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "Identifier",                { bg = nil, fg = colors.fg_0 })
vim.api.nvim_set_hl(0, "TSTypeBuiltin",             { bg = nil, fg = colors.yellow })
vim.api.nvim_set_hl(0, "Function",                  { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSFunctionCall",            { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSFuncBuiltin",             { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSFuncMacro",               { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSFunction",                { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSString",                  { bg = nil, fg = colors.green })
vim.api.nvim_set_hl(0, "TSConditional",             { bg = nil, fg = colors.red })
vim.api.nvim_set_hl(0, "TSKeyword",                 { bg = nil, fg = colors.red })
vim.api.nvim_set_hl(0, "TSKeywordFunction",         { bg = nil, fg = colors.red })
vim.api.nvim_set_hl(0, "TSKeywordReturn",           { bg = nil, fg = colors.red })
vim.api.nvim_set_hl(0, "TSTypeDefinition",          { bg = nil, fg = colors.red })
vim.api.nvim_set_hl(0, "TSComment",                 { link = "Comment" })
-- Telescope --
vim.api.nvim_set_hl(0, "TelescopeSelection",        { link = "CursorLine" })
-- IndentBlankline --
vim.api.nvim_set_hl(0, "IndentBlanklineChar",       { bg = nil, fg = colors.bg_2 })

local istransparent = Arunvi.option.background.transparent
if istransparent then
    vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    vim.cmd('hi NormalFloat ctermbg=NONE guibg=NONE')
    vim.cmd('hi FloatBorder ctermbg=NONE guibg=NONE')
    vim.cmd('hi Winbar ctermbg=NONE guibg=NONE') --tranparent winbar
    vim.cmd('hi WinbarNC ctermbg=NONE guibg=NONE') --tranparent winbar
    vim.cmd('hi NormalNC ctermbg=NONE guibg=NONE') --tranparent winbar

    vim.cmd('hi WinSeparator ctermbg=NONE guibg=NONE')
    vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
    vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
    vim.cmd('hi NvimTreeVertSplit guibg=NONE')
    vim.cmd('hi VertSplit guibg=NONE')
    vim.cmd('hi WinSeparator guibg=NONE')
    vim.cmd('hi Cursorline ctermbg=240 guibg=NONE gui=italic')

    -- vim.cmd('hi BufferLineFill guibg=NONE')
    -- vim.cmd('hi BufferLineOffSetSeparator ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineCloseButton ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineCloseButtonVisible ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineCloseButtonSelected ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineBuffer ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineBufferVisible ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineBufferSelected ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineBackground ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineVisibleIndex ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineModified ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineModifiedVisible ctermbg=NONE guibg=NONE')
    -- vim.cmd('hi BufferLineModifiedSelected ctermbg=NONE guibg=NONE')

    vim.cmd('hi ToggleTerm1Normal ctermbg=NONE guibg=NONE')
end

return M
