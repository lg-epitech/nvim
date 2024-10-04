vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set(
    "n",
    "<leader>o",
    '<Cmd>%!ocamlformat "%"<CR>',
    { noremap = true, silent = true }
)
