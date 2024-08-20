local M = {
    "nvim-treesitter/nvim-treesitter",
    opts = {},
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "python", "bash", "rust", "yaml", "json", "cpp", "c_sharp"},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = true,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,
            },
        }

        local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
        parser_config.note = {
            install_info = {
                url = "/home/laurent/projects/tree-sitter-note",
                files = { "src/parser.c", "src/scanner.c"},
                branch = "master",
                generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
            },
            filetype = "note",
        }
    end
}

return M
