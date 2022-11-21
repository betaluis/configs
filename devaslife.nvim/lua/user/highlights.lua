local highlights = {
    cursorline = true,
    termguicolors = true,
    winblend = 0,
    wildoptions = 'pum',
    pumblend = 5,
    background = 'dark'
}

for k, v in pairs(highlights) do
    vim.opt[k] = v
end
