local ok, staline = pcall(require, "staline")
if not ok then
    return
end

local rp = require("rose-pine.palette")

local colorscheme = {
    ["rose-pine"] = {
        bg0     = { ["dark"] = rp.overlay, ["light"] = rp.overlay },
        bg1     = { ["dark"] = rp.surface, ["light"] = rp.surface },
        fg      = { ["dark"] = rp.text, ["light"] = rp.text },
        red     = { ["dark"] = rp.love, ["light"] = rp.love },
        green   = { ["dark"] = rp.pine, ["light"] = rp.pine },
        yellow  = { ["dark"] = rp.gold, ["light"] = rp.gold },
        blue    = { ["dark"] = rp.foam, ["light"] = rp.foam },
        purple  = { ["dark"] = rp.iris, ["light"] = rp.iris },
        aqua    = { ["dark"] = rp.rose, ["light"] = rp.rose },
    },
    ["gruvbox"] = {
        bg_dim  = { ["dark"] = "#141617", ["light"] = "#eee0b7"},
        bg_0    = { ["dark"] = "#1d2021", ["light"] = "#f3eac7"},
        bg_1    = { ["dark"] = "#16191a", ["light"] = "#eee0b7"},
        fg      = { ["dark"] = "#1d2021", ["light"] = "#ebdbb2"},
        red     = { ["dark"] = "#f2594b", ["light"] = "#c14a4a"},
        green   = { ["dark"] = "#b0b846", ["light"] = "#6c782e"},
        yellow  = { ["dark"] = "#d79920", ["light"] = "#b47109"},
        blue    = { ["dark"] = "#80aa9e", ["light"] = "#45707a"},
        purple  = { ["dark"] = "#f28534", ["light"] = "#945e80"},
        aqua    = { ["dark"] = "#80aa9e", ["light"] = "#4c7a5d"},
    },
}

local opt_schemes = Arunvi.option.background.colorscheme
local function get_colors()
    local selectedColors = colorscheme[opt_schemes]
    if selectedColors then
        return selectedColors
    else
        return {}
    end
end

local colors = get_colors()
local opt_mode = Arunvi.option.background.mode
local my_colors = {
    n = colors.green[opt_mode],
    i = colors.blue[opt_mode],
    c = colors.yellow[opt_mode],
    v = colors.purple[opt_mode],
    V = colors.purple[opt_mode],
    t = colors.red[opt_mode],
    R = colors.red[opt_mode],
}

-- local currentDir = function ()
--     local cwd = vim.fn.getcwd()
--     local dirname = string.match(cwd, "^.+/(.+)$") -- Extract last part of path
--     return dirname
-- end

-- Statusline
local function get_sections()
    if Arunvi.option.background.transparent then
        local sections = {
            left = { ("─"):rep(vim.o.columns) }, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
            mid = {},
            right = {}
        }
        return sections
    else
        local sections = {
            left = {'-mode', 'left_sep', 'branch', 'line_column'},
            mid = {'right_sep', '- ' ,'-lsp_name', '- ','left_sep'},
            right = {'file_name', 'right_sep', '- ', '-cwd'}
        }
        return sections
    end
end

staline.setup {
    sections = get_sections(),
    mode_icons = {
        n = " NORMAL",
        i = " INSERT",
        c = " COMMAND",
        t = " TERMINAL",
        v = " VISUAL",
        V = " VISUAL-LINE",
        X = " VISUAL-BLOCK",
        R = " REPLACE",
    },

    mode_colors = my_colors,

    lsp_symbols = { Error = "  ", Info = "  ", Warn = "  ", Hint = "  " },
    defaults = {
        cool_symbol = " ",
        -- left_separator = "",
        -- right_separator = "",
        -- left_separator = "",
        -- right_separator = "",
        left_separator = "",
        right_separator = "",
        -- left_separator = "",
        -- right_separator = "",
        font_active = "bold",
        fg = colors.fg[opt_mode],
        bg = Arunvi.option.background.transparent and "none" or colors.bg_dim[opt_mode],
        true_colors = true,
        line_column = "%l-%c",
        -- branch_symbol = " ",
        branch_symbol = "  ",
        lsp_client_symbol = " ",
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    }
}
