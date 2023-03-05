require("mason").setup()
require("lspsaga").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" }
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local keymap = vim.keymap.set
  local bufopts = { noremap = true, silent = true}

  keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", bufopts)
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>") -- LSP finder - Find the symbol's definition
  keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- Code action
  keymap("n", "gr", "<cmd>Lspsaga rename<CR>") -- Rename all occurrences of the hovered word for the entire file
  keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>") -- Peek definition
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>",bufopts) -- Hover Doc
  -- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>") -- Go to definition
  -- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
  keymap("n","gt", "<cmd>Lspsaga peek_type_definition<CR>") -- Peek type definition
  -- Diagnostic jump
  keymap("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  -- Toggle outline
  keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
  -- Call hierarchy
    -- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    -- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').clangd.setup {
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
    "--all-scopes-completion",
    "--pretty",
    "--header-insertion=never",
    "-j=4",
    "--inlay-hints",
    "--header-insertion-decorators",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  -- root_dir = utils.root_pattern("compile_commands.json", "compile_flags.txt", ".git")
  init_option = { fallbackFlags = { "-std=c++2a" } }
}

require('lspconfig').zls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").csharp_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
