local M = {
    "hrsh7th/nvim-cmp",
    opts = {},
    config = function()
        local cmp = require'cmp'
        local cmp_mapping = require'cmp.config.mapping'
        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                -- vim.fn[""](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
              ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ["<Tab>"] = cmp_mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
              end, {"i", "s"}),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp', max_item_count = 6 },
              -- { name = 'vsnip' }, -- For vsnip users.
              { name = 'luasnip' }, -- For luasnip users.
              -- { name = 'ultisnips' }, -- For ultisnips users.
              -- { name = 'snippy' }, -- For snippy users.
            }, {
              { name = 'buffer' },
            })
          })

          -- Set configuration for specific filetype.
          cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
              { name = 'buffer' },
            })
          })

          -- Setup dadbod
          cmp.setup.filetype({ "sql" }, {
              sources = {
                  { name = "vim-dadbod-completion" },
                  { name = "buffer" },
              },
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
          })

          -- Set up lspconfig.
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
          --
        require('lspconfig')['clangd'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['pyright'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['csharp_ls'].setup {
            capabilities = capabilities
        }
        require('lspconfig')['bashls'].setup {
            capabilities = capabilities
        }
    end
}

return M
