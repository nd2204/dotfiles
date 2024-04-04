local ok, zen = pcall(require, "zen-mode")
if not ok then
    return
end

zen.setup {
  window = {
    backdrop = 0.95,
    width = 100,
    height = 0.90,
    options = {
        signcolumn = "no",
        number = true,
        cursorline = false,
    }
  },
  plugins = {
    options = {
        enabled = true,
        ruler = false,
        showcmd = false,
    },
    twilight = {enabled = true},
    gitsigns = {enabled = false},
    tmux = {enabled = true}
  },
  on_open = function(_)
    vim.cmd(':TwilightEnable')
  end
}

