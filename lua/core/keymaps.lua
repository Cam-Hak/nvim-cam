
-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = { noremap = true, silent = true }

-- easy esc
vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', 'L', ':bnext<CR>', opts)
vim.keymap.set('n', 'H', ':bprevious<CR>', opts)
vim.keymap.set('n', 'D', ':Bdelete!<CR>',opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>s', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', opts)

-- keep copy after replace
vim.keymap.set('v', 'p', '"_dP', opts)

-- cursor
vim.opt.guicursor = "n-v-c-i:block"
