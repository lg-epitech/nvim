local M = {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    -- ["<C-h>"] = "which_key"
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = true,
                file_ignore_patterns = {
                    "venv/.*",
                    ".venv/.*",
                    "node_modules/.*",
                    ".git/.*",
                    -- Add any other patterns you want to ignore
                },
            },
            live_grep = {
                hidden = true,
                no_ignore = true,
                file_ignore_patterns = {
                    "venv/.*",
                    ".venv/.*",
                    "node_modules/.*",
                    ".git/.*"
                    -- Add any other patterns you want to ignore
                },
            },
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        },
    },

}
return M
