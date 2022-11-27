local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then return end

-- Formatting
local on_attach = function(client, bfunr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

    local keymap = vim.keymap.set
    local buf = vim.lsp.buf
    local opts = { noremap = true, silent = true, buffer = bufn }

    keymap('n', 'gD', buf.declaration, opts)
    keymap('n', 'gd', buf.definition, opts)
    keymap('n', 'gt', buf.type_definition, opts)
    keymap('n', 'gi', buf.implementation, opts)
    keymap('n', 'K', buf.hover, opts)
    keymap('n', '<leader>rn', buf.rename, opts)
    keymap('n', '<leader>ca', buf.code_action, opts)

end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
}
nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
}
nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
}
nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
}
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
}
nvim_lsp.taplo.setup {
    on_attach = on_attach,
}
