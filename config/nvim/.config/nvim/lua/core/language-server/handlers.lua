local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = ">", numhl = "RedSign" },
        { name = "DiagnosticSignWarn", text = ">", numhl = "YellowSign"  },
        { name = "DiagnosticSignHint", text = ">", numhl = "BlueSign"},
        { name = "DiagnosticSignInfo", text = ">", numhl = "BlueSign"},
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.numhl })
    end

    local diagnostic_config = {
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(diagnostic_config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 60,
    })

end


local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end

    illuminate.configure({
        filetypes_denylist = {
            'dirvish',
            'fugitive',
            'NvimTree'
        },
    })
    illuminate.on_attach(client)
    -- end
end


local function lsp_keymaps(bufnr)
    local bufopts = { noremap = true, silent = true , buffer = bufnr}
    -- local keymap = vim.api.nvim_buf_set_keymap
    local keymap = vim.keymap.set

    keymap({"n","v"}, "<leader>la",  "<cmd>Lspsaga code_action<CR>", bufopts)

    keymap("n", "K",           "<cmd>Lspsaga hover_doc<CR>",bufopts)
    keymap("n", "<leader>lf",  "<cmd>Lspsaga finder<CR>", bufopts)
    keymap("n", "<leader>lR",  "<cmd>Lspsaga rename<CR>", bufopts)

    keymap("n", "<leader>ld",  "<cmd>Lspsaga peek_definition<CR>", bufopts)
    keymap("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
    keymap('n', "<leader>lt",  "<cmd>Lspsaga goto_type_definition<CR>", bufopts)
    keymap('n', "<leader>lgt", "<cmd>Lspsaga peek_type_definition<CR>", bufopts)

    keymap('n', "<leader>lj",  "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
    keymap('n', "<leader>lJ",  "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    keymap('n', "<leader>lo",  "<cmd>Lspsaga outline<CR>", bufopts)
    keymap('n', "<leader>lci", "<cmd>Lspsaga incoming_calls<CR>", bufopts)
    keymap('n', "<leader>lco", "<cmd>Lspsaga outgoing_calls<CR>", bufopts)

    keymap('n', "<leader>lF",  "<cmd>lua vim.lsp.buf.format(){async=true}<CR>", bufopts)
    keymap('n', "<leader>lk",  "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
    keymap("n", "<leader>lD",  "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
    keymap("n", "<leader>li",  "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
    keymap("n", "<leader>lr",  "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
    keymap("n", "<leader>lq",  "<cmd>lua vim.diagnostic.setloclist()<CR>", bufopts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

M.on_attach = function(client, bufnr)
    -- vim.notify(client.name .. " starting...")
    -- TODO: refactor this into a method that checks if string in list
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false

    end
    if client.name == "clangd" then
        client.server_capabilities.signatureHelpProvider = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
