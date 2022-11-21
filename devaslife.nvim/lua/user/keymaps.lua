local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Do not yank with x
keymap('n', 'x', '"_x')

-- Increment/decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap('n', 'dw', 'vb"_d')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap('n', 'te', ':tabedit<Return>', opts)
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Move window
keymap('', '<C-h>', '<C-w>h')
keymap('', '<C-k>', '<C-w>k')
keymap('', '<C-j>', '<C-w>j')
keymap('', '<C-l>', '<C-w>l')

-- Resize window
keymap('n', '<C-w>h', '<C-w><')
keymap('n', '<C-w>l', '<C-w>>')
keymap('n', '<C-w>k', '<C-w>+')
keymap('n', '<C-w>j', '<C-w>-')

-- Move up and down
keymap('n', '<C-d>', '<C-d><S-m>')

-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', ":Telescope find_files<CR>", opts)
keymap('n', '<leader>fg', ":Telescope live_grep<CR>", opts)
keymap('n', '<leader>fp', ":Telescope projects<CR>", opts)
keymap('n', '<leader>fb', ":Telescope buffers<CR>", opts)
keymap('n', '<leader>fh', builtin.help_tags, opts)
-- keymap('n', '<leader>e', ':Telescope file_browser<CR>', opts)

-- Nvim-tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Bufferline
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", opts)
keymap("n", "<leader>c", "<cmd>BufferLineCloseLeft<cr>", opts)
keymap("n", "<leader>c", "<cmd>Bdelete!<cr>", opts)

-- LSPSaga
keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
--lkeymap('n', '<C-k>', '<Cmd>Lspsaga hover_doc<cr>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)

-- General
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)
keymap('n', '<leader>w', '<cmd>w<CR>', opts)
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
