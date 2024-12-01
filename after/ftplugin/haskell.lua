vim.keymap.set(
    "n",
    "<leader>s",
    '<Cmd>silent !hindent --indent-size 4 "%"<CR>',
    { noremap = true, silent = true }
)
