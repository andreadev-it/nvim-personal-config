-- -------------
-- Auto commands
-- -------------

vim.cmd([[
    if executable('timg')
        au BufEnter *.jpg,*.png terminal timg %
    endif
]])

