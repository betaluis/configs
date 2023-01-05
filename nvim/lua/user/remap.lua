local nnoremap = require("user.keymap").nnoremap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode
-- keymap('i', 'jk', '<ESC>', opts)
-- keymap('i', 'ht', '<ESC>', opts)

-- Do not yank with x
keymap('n', "x", '"_x')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- New tab and movement
keymap('n', 'te', ':tabedit<Return>', opts)
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Move up and down
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Resize with arrow keys
keymap('n', '<Up>', ':resize +2<CR>', opts)
keymap('n', '<Down>', ':resize -2<CR>', opts)
keymap('n', '<Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- LSP
keymap('n', '<leader>le', vim.diagnostic.open_float, opts)
keymap('n', '<leader>lh', vim.diagnostic.goto_prev, opts)
keymap('n', '<leader>lt', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>ll', vim.diagnostic.setloclist, opts)

-- General
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts) -- no highlight
keymap('n', '<leader>,', '<cmd>w<CR>', opts) -- save
keymap('n', '<leader>q', '<cmd>q!<CR>', opts) -- quit no save
keymap('n', '<leader>;', 'ZZ', opts) -- quit
keymap("i", "<C-c>", "<ESC>", opts)
keymap("n", "<C-c>", "<ESC>", opts)
keymap("n", "<leader>o", "O", opts)
keymap("n", "<leader>v", "V", opts)

-- netrw
-- keymap("n", "<leader>ee", "<cmd>Lexplore %:p:h<CR>", opts)
keymap('n', '<leader>ee', '<cmd>Ex<CR>', opts) -- netrw
keymap('n', '<leader>ec', '<cmd>Rex<CR>', opts) -- netrw

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Telescope
local tl = require('telescope.builtin')
keymap('n', '<leader>pf', tl.find_files, {})
keymap('n', '<leader>pg', tl.git_files, {})
keymap('n', '<leader>ps', function()
    tl.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Harpoon
-- keymap('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>')
-- keymap('n', '<leader>hh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
-- keymap('n', '<leader>ho', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>')
-- keymap('n', '<leader>he', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>')
-- keymap('n', '<leader>hu', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>')
-- keymap('n', '<leader>hi', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>')
-- keymap('n', '<leader>hn', '<cmd>lua require("harpoon.ui").nav_next()<CR>')
-- keymap('n', '<leader>hp', '<cmd>lua require("harpoon.ui").nav_prev()<CR>')

-- Undotree
keymap('n', '<leader>u', ':UndotreeToggle<CR>', opts)
