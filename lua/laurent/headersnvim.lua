local M = {
    "headers.nvim",
    dir = "~/projects/headers.nvim",

    ---@type HConfig
    opts = {
        templates_dir = "/home/laurent/projects/headers.nvim/templates",
        email = "laurent.gonzalez@epitech.eu",
        username = "thats a big one"
    },

    config = function(opts)
        require("headers").setup(opts.opts)

        vim.keymap.set("n", "<leader>h", ":Headers<CR>", {noremap=true, silent=true})
    end
}

return M
