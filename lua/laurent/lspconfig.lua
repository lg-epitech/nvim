local M = {
    "neovim/nvim-lspconfig",
    config = function()
        -- Setup language servers.
        local lspconfig = require("lspconfig")
        local util = require('lspconfig.util') -- You might need this
        lspconfig.pyright.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.bashls.setup({})
        lspconfig.tailwindcss.setup({})
        lspconfig.ocamllsp.setup({})

        -- C
        lspconfig.clangd.setup({
            cmd = { "clangd", "--background-index" },
            filetypes = { "c", "cpp" },
        })

        -- Lua
        vim.lsp.config('lua_ls', {
          on_init = function(client)
            if client.workspace_folders then
              local path = client.workspace_folders[1].name
              if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
              then
                return
              end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                  'lua/?.lua',
                  'lua/?/init.lua',
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- Depending on the usage, you might want to add additional paths
                  -- here.
                  -- '${3rd}/luv/library'
                  -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
              }
            })
          end,
          settings = {
            Lua = {}
          }
        })
        vim.lsp.enable('lua_ls')
        lspconfig.csharp_ls.setup({})
        lspconfig.yamlls.setup({})
        lspconfig.asm_lsp.setup({})
        lspconfig.nushell.setup({})
        lspconfig.hls.setup({})
        lspconfig.gopls.setup({})

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<space>k", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set(
                    "n",
                    "<space>wa",
                    vim.lsp.buf.add_workspace_folder,
                    opts
                )
                vim.keymap.set(
                    "n",
                    "<space>wr",
                    vim.lsp.buf.remove_workspace_folder,
                    opts
                )
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set(
                    "n",
                    "<space>D",
                    vim.lsp.buf.type_definition,
                    opts
                )
                vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set(
                    { "n", "v" },
                    "<space>ca",
                    vim.lsp.buf.code_action,
                    opts
                )
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                -- vim.keymap.set('n', '<space>f', function()
                --   vim.lsp.buf.format { async = true }
                -- end, opts)
            end,
        })
    end,
}

return M
