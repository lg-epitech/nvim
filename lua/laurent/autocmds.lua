vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({"CursorMovedI", "CursorMoved"}, {
    pattern = { "*" },
    command = [[if virtcol(".") > 79 | execute 'set colorcolumn=80 | highlight ColorColumn ctermbg=0 guibg=black' | else | execute 'set colorcolumn=0' | endif]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup('HighlightYank', {}),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.txt",
    callback = function()
        vim.cmd("set spell")
    end
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.cmd("ColorizerToggle")
    end
})
