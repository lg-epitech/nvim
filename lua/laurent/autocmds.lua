vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({"CursorMovedI", "CursorMoved"}, {
    pattern = { "*" },
    command = [[if virtcol(".") > 79 | execute 'set colorcolumn=80 | highlight ColorColumn ctermbg=0 guibg=gray' | else | execute 'set colorcolumn=0' | endif]],
})
