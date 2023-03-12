local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")

  return
end

vim.o.termguicolors = true
-- setup must be called before loading the colorscheme
-- Default options:
vim.o.background = "dark"
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")


-- require("catppuccin").setup({
--   flavour = "macchiato", -- latte, frappe, macchiato, mocha
--   background = { -- :h background
--   light = "latte",
--   dark = "mocha",
-- },
-- transparent_background = true,
-- show_end_of_buffer = false, -- show the '~' characters after the end of buffers
-- term_colors = false,
-- dim_inactive = {
--   enabled = false,
--   shade = "dark",
--   percentage = 0.15,
-- },
-- no_italic = false, -- Force no italic
-- no_bold = false, -- Force no bold
-- styles = {
--   comments = { "italic" },
--   conditionals = { "italic" },
--   loops = {},
--   functions = {},
--   keywords = {},
--   strings = {"italic"},
--   variables = {},
--   numbers = {},
--   booleans = {},
--   properties = {},
--   types = {},
--   operators = {},
-- },
-- color_overrides = {},
-- custom_highlights = {},
-- integrations = {
--   cmp = true,
--   gitsigns = true,
--   nvimtree = true,
--   telescope = true,
--   notify = false,
--   mini = false,
--   -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
-- },
--     })

--     -- setup must be called before loading
--     vim.cmd.colorscheme "catppuccin"
