vim.keymap.set(
    "n",
    "<leader>s",
    ":silent !stylua --config-path ~/.config/nvim/.stylua.toml %<CR>",
    { noremap = true, silent = true, script = true }
)
