local M = {
    "LukasPietzschmann/boo.nvim",
    opts = {},
    config = function()
        vim.keymap.set("n", "<C-k>", ":lua require('boo').boo()<CR>", {silent = true})
    end
}

return M
