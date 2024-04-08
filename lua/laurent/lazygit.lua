local M = {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.cmd("nnoremap git <cmd>LazyGit<CR>")
    end
}

return M
