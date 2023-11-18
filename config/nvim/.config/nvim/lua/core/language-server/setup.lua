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
}

require("lspsaga").setup({
    symbol_in_winbar = {
        enable = false,
        separator = "  ",
        show_file = true,
        folder_level = 0,
    },
    ui = {kind = {["Folder"] = { "  ", "NvimTreeFolderIcon" }}},
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
	local has_custom_opts, server_custom_opts = pcall(require, "core.language-server.server-config" .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
