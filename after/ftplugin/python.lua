vim.keymap.set(
    "n",
    "<leader>s",
    "<CMD>silent %!autopep8 %<CR>",
    { noremap = true, silent = true }
)
