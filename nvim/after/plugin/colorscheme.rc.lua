local colorscheme = "nightfox"
-- local colorscheme = "gruvbox"
-- local colorscheme = "catppuccin"

-- vim.o.background = "dark"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
