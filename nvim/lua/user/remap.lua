local nnoremap = require("user.keymap").nnoremap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode
keymap('i', 'ht', '<ESC>', opts)

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
keymap('n', '<C-d>', '<C-d><S-m>')
keymap('n', '<C-u>', '<C-u><S-m>')

-- Resize with arrow keys
keymap('n', '<Up>', ':resize +2<CR>', opts)
keymap('n', '<Down>', ':resize -2<CR>', opts)
keymap('n', '<Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- LSP
keymap('n', '<leader>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- General
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts) -- no highlight
keymap('n', '<leader>,', '<cmd>w<CR>', opts) -- save
keymap('n', '<leader>.', '<cmd>Ex<CR>', opts) -- netrw
keymap('n', '<leader>;', '<cmd>q<CR>', opts) -- quit

-- Telescope
local tl = require('telescope.builtin')
keymap('n', '<leader>pp', tl.find_files, {})
keymap('n', '<leader>pg', tl.live_grep, {})
