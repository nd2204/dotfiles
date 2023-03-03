require('nvim-treesitter.configs').setup ({
  -- A list of parser names, or "all"
  ensure_installed = { "c", "c_sharp", "lua", "vim", "cpp"},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    custom_captures = {
        -- Define your color for specific nodes
        ["entity.name.function"] = "Purple",
        ["keyword.operator"] = "Red",
    }
  },
  autotag = {
    enable = true,
  },
  rainbow = {
     enable = true,

    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  underlines = {
      -- Define the underline for the 'function' keyword
      {highlight = "Function", color = "#fabd2f", style = "undercurl", text = "▁"},
      -- Define the underline for function names
      {highlight = "FunctionName", color = "#fabd2f", style = "undercurl", text = "▁"},
      -- Define the underline for function parameters
      {highlight = "Parameter", color = "#fabd2f", style = "undercurl", text = "▁"},

      -- Define the underline for comments
      {highlight = "Comment", color = "#fabd2f", style = "undercurl", text = "▔"}
  }
})

