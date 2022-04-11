-- -----------
-- Keybindings
-- -----------

-- View images in nvim
vim.api.nvim_set_keymap( 'n', '<leader>vi', ':terminal timg %<cr>', {noremap = true} )

-- Better window navigation
vim.api.nvim_set_keymap( 'n', '<C-h>', '<C-w>h', {noremap = true} )
vim.api.nvim_set_keymap( 'n', '<C-j>', '<C-w>j', {noremap = true} )
vim.api.nvim_set_keymap( 'n', '<C-k>', '<C-w>k', {noremap = true} )
vim.api.nvim_set_keymap( 'n', '<C-l>', '<C-w>l', {noremap = true} )

-- Keep visual selection after indenting
vim.api.nvim_set_keymap( 'v', '<', '<gv', {noremap = true} )
vim.api.nvim_set_keymap( 'v', '>', '>gv', {noremap = true} )

-- NeoTree toggle
vim.api.nvim_set_keymap( 'n', "\\", ":Neotree toggle<cr>", {noremap = true} )
vim.api.nvim_set_keymap( 'n', "<C-b>", ":Neotree toggle source=buffers<cr>", {noremap = true} )

-- Telescope
vim.api.nvim_set_keymap( 'n', "<C-p>", ":Telescope find_files<cr>", {noremap = true} )
