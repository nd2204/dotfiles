local ok, mason = pcall(require, "mason")
if not ok then
    return
end

local servers = {
    "jsonls",
    "lua_ls",
    "clangd",
    "tsserver",
    "cssls",
    "html",
    "pyright",
    "rust_analyzer"
}

require("lspsaga").setup({
    border_style = "round",
    symbol_in_winbar = {
        enable = false,
        separator = " › ",
        show_file = true,
        folder_level = 0,
        color_mode = true,
    },
    -- ui = {
    --     kind = {
    --         border = "rounded",
    --         ["Folder"] = { "  ", "NvimTreeFolderIcon" },
    --     },
    -- },
    diagnostic = {
        -- diagnostic_only_current = true,
        show_layout = 'float',
        border_folow = false
    }
})

mason.setup({})
require("mason-lspconfig").setup {
    ensure_installed = servers,
}

local lspconfig = require("lspconfig")
local handlers = require("core.language-server.handlers")
for _, server in pairs(servers) do
    local opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "core.language-server.server-config." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end
