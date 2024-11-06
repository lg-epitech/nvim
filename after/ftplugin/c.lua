vim.keymap.set(
    "n",
    "<leader>s",
    "<Cmd>silent %!clang-format %<CR>",
    { noremap = true }
)
