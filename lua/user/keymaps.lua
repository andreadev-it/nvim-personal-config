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

-- Better window resizing (shift+<arrow>)
vim.api.nvim_set_keymap("n", "<S-Up>", ":resize +2<CR>", {noremap = true} )
vim.api.nvim_set_keymap("n", "<S-Down>", ":resize -2<CR>", {noremap = true} )
vim.api.nvim_set_keymap("n", "<S-Left>", ":vertical resize -2<CR>", {noremap = true} )
vim.api.nvim_set_keymap("n", "<S-Right>", ":vertical resize +2<CR>", {noremap = true} )

-- Keep visual selection after indenting
vim.api.nvim_set_keymap( 'v', '<', '<gv', {noremap = true} )
vim.api.nvim_set_keymap( 'v', '>', '>gv', {noremap = true} )

-- Clear matches with Ctrl+l
vim.api.nvim_set_keymap( 'n', '<C-n>', ':noh<cr>', {noremap = true} )

-- Copy and cut to the clipboard
-- vim.api.nvim_set_keymap( 'n', '<leader>Y', '"+y<cr>', {noremap = true} ) -- This way it doesn't work
vim.cmd([[
    noremap YY "+y<CR>
    noremap XX "+x<CR>
]])

-- NeoTree toggle
vim.api.nvim_set_keymap( 'n', "\\", ":Neotree toggle<cr>", {noremap = true} )
vim.api.nvim_set_keymap( 'n', "<C-b>", ":Neotree toggle source=buffers<cr>", {noremap = true} )

-- Telescope
vim.api.nvim_set_keymap( 'n', "<C-p>", ":Telescope find_files<cr>", {noremap = true} )

-- Terminal utilities
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "curved",
        width = math.floor(vim.o.columns * 0.9),
        height = math.floor(vim.o.lines * 0.8)
    }
})
local genericTerm = Terminal:new({ hidden = true })

vim.api.nvim_set_keymap( 'n', "<leader>lg", "", {
    callback = function ()
        lazygit:toggle()
    end,
    noremap = true
})

vim.api.nvim_set_keymap( 'n', "<leader>t", "", {
    callback = function ()
        genericTerm:toggle()
    end,
    noremap = true
})
