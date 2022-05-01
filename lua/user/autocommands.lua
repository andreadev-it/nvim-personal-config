-- -------------
-- Auto commands
-- -------------

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.jpg,*.png",
    callback = function()
        vim.cmd("terminal timg %")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.cmd("IndentLinesDisable")
    end
})
