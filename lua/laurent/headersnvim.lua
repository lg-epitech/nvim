--
-- EPITECH PROJECT, 2024
-- nvim
-- File description:
-- headersnvim.lua
--

local M = {
    "headers.nvim",
    dir = "~/projects/headers.nvim",

    opts = {
        email = "laurent.gonzalez@epitech.eu", -- Defaults to undefined
        username = "LG", -- Defaults to undefined
    },

    config = function(opts)
        -- Setup
        require("headers").setup(opts.opts)

        -- Keymap
        vim.keymap.set(
            "n",
            "<leader>h",
            ":InsertSelectedHeader<CR>",
            { noremap = true, silent = true }
        )

        -- Config
        -- local templates = require("headers.templates")
        --
        -- templates.add(
        --     "tek", -- Name
        --     "EPITECH PROJECT, %yyyy\n%g\nFile description:\n%grp", -- Text
        --     { padding = 1, separation = " " } -- Options
        -- )
        -- templates.add_variant(
        --     "tek", -- Name
        --     "lua", -- Extension
        --     "this lua file\nok", -- Replacement
        --     { padding = 1, separation = " " } -- Options
        -- )
        -- templates.select("tek")
    end,
}

return M
