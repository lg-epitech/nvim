local M = {
    "headers.nvim",
    dir = "~/projects/headers.nvim",

    ---@type HConfig
    opts = {
        templates_dir = "/home/laurent/projects/headers.nvim/templates"
    },

    config = function(opts)
        require("headers").setup(opts)

        vim.keymap.set("n", "<leader>h", ":Headers<CR>", {noremap=true, silent=true})
    end
}

return M
