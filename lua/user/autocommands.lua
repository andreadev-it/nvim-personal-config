-- -------------
-- Auto commands
-- -------------

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.jpg,*.png",
    callback = function()
        vim.cmd("terminal timg %")
    end,
})
