require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.treesitter")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.scrolloff = 20
-- vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.g.mapleader = ' '

vim.cmd("colorscheme nightfox")

-- -------------
-- Auto commands
-- -------------

vim.cmd([[
au BufEnter *.jpg,*.png terminal timg %
]])

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
