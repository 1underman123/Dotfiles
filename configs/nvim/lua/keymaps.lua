--define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}


-----------------
-- Normal mode --
-----------------
-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
-- reload the config
vim.keymap.set('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>')
-- buffer navigation/control
vim.keymap.set('n', '<Tab>', ':bnext <CR>')
vim.keymap.set('n', '<S-Tab>', ':bprevious <CR>')
vim.keymap.set('n', '<leader>d', ':bd! <CR>')
-- in-editor file explorer
vim.keymap.set('n', '<leader>w', ':Neotree toggle <CR>') --open

-----------------
-- Visual mode --
-----------------
-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

