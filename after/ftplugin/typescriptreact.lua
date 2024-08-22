vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set(
    "n",
    "<leader>s",
    '<Cmd>%!prettier "%"<CR>',
    { noremap = true, silent = true }
)
