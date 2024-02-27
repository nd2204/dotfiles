local theme = Arunvi.option.background.colorscheme local _, cls = pcall(require, "core.plugin_config.colorscheme." .. theme)
if not _ then
    vim.notify("Failed to load config file " .. theme .. ".lua")
    return
end

local M = {}

local colors = cls.getcolors()

M.theme = colors
-- Run the colorscheme setup function
cls.setup()
local hl = vim.api.nvim_set_hl
--------------------------------- Override default color --------------------------------
hl(0, "Red",    {ctermfg = 167, bg = nil, fg = colors.red })
hl(0, "Yellow", {ctermfg = 214, bg = nil, fg = colors.yellow })
hl(0, "Orange", {ctermfg = 208, bg = nil, fg = colors.orange })
hl(0, "Green",  {ctermfg = 142, bg = nil, fg = colors.green })
hl(0, "Aqua",   {ctermfg = 108, bg = nil, fg = colors.aqua })
hl(0, "Blue",   {ctermfg = 109, bg = nil, fg = colors.blue })
hl(0, "Purple", {ctermfg = 175, bg = nil, fg = colors.purple })

---------------------------------------- Builtin ----------------------------------------
hl(0, "Cursorline",         { bg = nil })
hl(0, "SignColumn",         { bg = colors.bg_1 })
hl(0, "GreenSign",          { ctermfg = 147, bg = colors.bg_1, fg = colors.green,})
hl(0, "RedSign",            { ctermfg = 167, bg = colors.bg_1, fg = colors.red})
hl(0, "BlueSign",           { ctermfg = 109, bg = colors.bg_1, fg = colors.blue})
hl(0, "YellowSign",         { ctermfg = 214, bg = colors.bg_1, fg = colors.yellow})
hl(0, "PurpleSign",         { ctermfg = 175, bg = colors.bg_1, fg = colors.purple})
hl(0, "OrangeSign",         { ctermfg = 208, bg = colors.bg_1, fg = colors.orange})
hl(0, "AquaSign",           { ctermfg = 108, bg = colors.bg_1, fg = colors.aqua})
hl(0, "CursorlineNr",       { fg = colors.fg_1 })
hl(0, "CurrentWord",        { bg = colors.bg_3 })
hl(0, "FloatBorder",        { bg = nil, fg = colors.grey_1 })
hl(0, "LineNr",             { fg = colors.grey_0 })
hl(0, "Normal",             { bg = colors.bg_0, fg = colors.fg_0 })
hl(0, "NormalFloat",        { bg = colors.bg_dim, fg = colors.fg_0 })
hl(0, "Terminal",           { bg = colors.bg_dim, fg = colors.fg_0 })
hl(0, "VertSplit",          { bg = colors.bg_dim, fg = colors.bg_3 })
hl(0, "WinSeparator",       { bg = nil, fg = colors.bg_4 })
hl(0, "MsgSeparator",       { bg = nil, fg = colors.grey_0 })
hl(0, "ColorColumn",        { ctermbg = 236, bg = colors.bg_1 })
-- Uis --
hl(0, "NormalNC",           { link = "Normal" })
hl(0, "NormalFloat",        { link = "NvimTreeNormal" })
hl(0, "Visual",             { bg = colors.bg_2 })
hl(0, "EndOfBuffer",        { fg = colors.bg_5 })
hl(0, "NonText",            { fg = colors.bg_1 })
hl(0, "StatusLine",         { link = "NvimTreeNormal" })
hl(0, "StatusLineNC",       { link = "NormalNC" })
hl(0, "WhiteSpace",         { fg = colors.bg_2 })
hl(0, "Comment",            { bg=nil, fg=colors.grey_0})
hl(0, "Search",             { bg=nil, bold=true, underline=true})
hl(0, "IncSearch",          { fg=colors.bg_0, bg=colors.green, bold=true})
hl(0, "VirtualTextHint",    { fg=colors.blue, bg="#2e3b3b"})
hl(0, "VirtualTextInfo",    { fg=colors.blue, bg="#2e3b3b"})
hl(0, "VirtualTextError",   { fg=colors.red, bg="#442e2d"})
hl(0, "VirtualTextWarning", { fg=colors.yellow, bg="#473c29"})
---------------------------------------- Plugins ----------------------------------------
-- WhichKey --
hl(0, "WhichKeyFloat",          { link = "NvimTreeNormal" })
hl(0, "WhichKeySeparator",      { bg = nil, fg = colors.grey_0})
hl(0, "WhichKeyDesc",           { bg = nil, fg = colors.fg_0})
-- NvimTree --
hl(0, "NvimTreeNormal",         { bg = colors.bg_dim, fg = colors.fg_0 })
hl(0, "NvimTreeEndOfBuffer",    { fg = colors.bg_dim })
hl(0, "NvimTreeWinSeparator",   { bg = colors.bg_dim, fg = colors.bg_dim})
hl(0, "NvimTreeVertSplit" ,     { bg = colors.bg_dim, fg = colors.bg_dim})
hl(0, "NvimTreeCursorLine" ,    { link = "Cursorline" } )
hl(0, "NvimTreeIndentMarker",   { link = "IndentBlanklineChar" } )
hl(0, "NvimTreeGitNew",         { link = "Yellow" } )
-- Treesitter --
-- hl(0, "TSPunctBracket",         { bg = nil, fg = colors.fg_0 })
hl(0, "TSProperty",             { bg = nil, fg = colors.fg_0 })
hl(0, "TSField",                { bg = nil, fg = colors.fg_0 })
hl(0, "Identifier",             { bg = nil, fg = colors.fg_0 })
hl(0, "TSTypeBuiltin",          { bg = nil, fg = colors.yellow })
hl(0, "Function",               { bg = nil, fg = colors.green })
hl(0, "TSFunctionCall",         { bg = nil, fg = colors.green })
hl(0, "TSFuncBuiltin",          { bg = nil, fg = colors.green })
hl(0, "TSFuncMacro",            { bg = nil, fg = colors.green })
hl(0, "TSFunction",             { bg = nil, fg = colors.green })
hl(0, "TSString",               { bg = nil, fg = colors.green })
hl(0, "TSConditional",          { bg = nil, fg = colors.red })
hl(0, "TSKeyword",              { bg = nil, fg = colors.red })
hl(0, "TSKeywordFunction",      { bg = nil, fg = colors.red })
hl(0, "TSKeywordReturn",        { bg = nil, fg = colors.red })
hl(0, "TSTypeDefinition",       { bg = nil, fg = colors.red })
hl(0, "TSComment",              { link = "Comment" })
-- Telescope --
hl(0, "TelescopeSelection",     { bg = colors.bg_1 })
-- IndentBlankline --
hl(0, "IndentBlanklineChar",    { bg = nil, fg = colors.bg_2 })
-- LspSaga
hl(0, "SagaNormal",             { link = "Normal" })
-- Gitsign
hl(0, "GitSignsChange",         { link = "GreenSign" })
hl(0, "GitSignsAdd",         { link = "AquaSign" })

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
    vim.cmd('hi Cursorline ctermbg=240 guibg=NONE gui=NONE')

    hl(0, "GreenSign",          { ctermfg = 147, bg = nil, fg = colors.green,})
    hl(0, "RedSign",            { ctermfg = 167, bg = nil, fg = colors.red})
    hl(0, "BlueSign",           { ctermfg = 109, bg = nil, fg = colors.blue})
    hl(0, "YellowSign",         { ctermfg = 214, bg = nil, fg = colors.yellow})
    hl(0, "PurpleSign",         { ctermfg = 175, bg = nil, fg = colors.purple})
    hl(0, "OrangeSign",         { ctermfg = 208, bg = nil, fg = colors.orange})
    hl(0, "AquaSign",           { ctermfg = 108, bg = nil, fg = colors.aqua})

    hl(0, "NvimTreeNormal",         { bg = nil, fg = colors.fg_0 })
    hl(0, "NvimTreeEndOfBuffer",    { fg = nil })
    hl(0, "NvimTreeWinSeparator",   { bg = nil, fg = colors.bg_4})
    hl(0, "NvimTreeVertSplit" ,     { bg = nil, fg = colors.bg_4})

    vim.opt.fillchars       = 'msgsep:─,lastline:~,eob: ,vert:▕,vertright:▕,vertleft:▕,verthoriz:▕,horizup:─,horizdown:─' --▕▏
    vim.opt.listchars       = 'trail: ,space: ,eol:↵' -- ',tab:·,eol:¬,eol:↵,extends:>,precedes:<,'
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
