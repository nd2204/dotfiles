require("core.language-server.debug.dap")
require("core.language-server.debug.debug")

require("mason-nvim-dap").setup({
    ensure_installed = {
        "codelldb", "debugpy"
    }
})
