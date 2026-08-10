return {
    "ThePrimeagen/99",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        local _99 = require("99")

        local cwd = vim.uv.cwd()
        local basename = vim.fs.basename(cwd)

        _99.setup({
            provider = _99.Providers.OpenCodeProvider,
            model = "openai/gpt-5.5",
            logger = {
                type = "file",
                level = _99.DEBUG,
                path = "/tmp/" .. basename .. ".99.debug",
                print_on_error = true,
            },

            -- Keep 99 scratch files inside the project so Opencode can read them.
            tmp_dir = "./tmp",
            completion = {
                source = "cmp",
                custom_rules = {},
                files = {},
            },
            md_files = {
                "AGENT.md",
            },
        })

        vim.keymap.set("v", "<leader>9v", function()
            _99.visual()
        end, { desc = "99 visual edit" })

        vim.keymap.set("n", "<leader>9x", function()
            _99.stop_all_requests()
        end, { desc = "99 stop requests" })

        vim.keymap.set("n", "<leader>9s", function()
            _99.search()
        end, { desc = "99 search" })

        vim.keymap.set("n", "<leader>9o", function()
            _99.open()
        end, { desc = "99 open results" })

        vim.keymap.set("n", "<leader>9l", function()
            _99.view_logs()
        end, { desc = "99 view logs" })
    end,
}
