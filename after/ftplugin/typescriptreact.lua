vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set(
    "n",
    "<leader>s",
    '<Cmd>silent !prettier --write "%"<CR>',
    { noremap = true, silent = true }
)
