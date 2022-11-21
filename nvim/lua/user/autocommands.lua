-- Fixes auto comments
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    callback = function()
        vim.cmd 'set formatoptions-=cro'
    end,
})

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ 'Filetype' }, {
    pattern = { 'qf', 'help', 'man', 'lspinfo', 'spectre_panel', 'lir' },
    callback = function()
        vim.cmd [[
            noremap <silent> <buffer> q :close<CR>
            set nobuflisted
        ]]
    end,
})
