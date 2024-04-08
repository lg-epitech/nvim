local M = {
    "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            -- HARPOONING
            local harpoon = require("harpoon")
            harpoon:setup()
            vim.keymap.set('n', "<C-a>", function() harpoon:list():append() end)
            vim.keymap.set('n', "<M-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set('n', "<M-a>", function() harpoon:list():select(1) end)
            vim.keymap.set('n', "<M-z>", function() harpoon:list():select(2) end)
            vim.keymap.set('n', '<M-e>', function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<M-r>", function() harpoon:list():select(4) end)
            vim.keymap.set('n', "<M-t>", function() harpoon:list():select(5) end)
            vim.keymap.set('n', "<M-y>", function() harpoon:list():select(6) end)
            vim.keymap.set('n', "<M-u>", function() harpoon:list():select(7) end)
            vim.keymap.set('n', "<M-i>", function() harpoon:list():select(8) end)
            vim.keymap.set('n', "<M-o>", function() harpoon:list():select(9) end)
            vim.keymap.set('n', "<M-p>", function() harpoon:list():select(10) end)
            vim.keymap.set('n', "<M-h>", function() harpoon:list():prev() end)
            vim.keymap.set('n', "<M-l>", function() harpoon:list():next() end)
        end
}

return M
