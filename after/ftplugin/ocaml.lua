vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set(
    "n",
    "<leader>o",
    '<Cmd>silent %!ocamlformat "%"<CR>',
    { noremap = true, silent = true }
)
