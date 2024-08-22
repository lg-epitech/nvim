vim.keymap.set(
    "n",
    "<leader>s",
    ":!stylua --config-path ~/.config/nvim/.stylua.toml %<CR>",
    { noremap = true }
)
