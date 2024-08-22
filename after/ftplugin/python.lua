vim.keymap.set(
    "n",
    "<leader>s",
    ":%!autopep8 %<CR>",
    { noremap = true, silent = true }
)
