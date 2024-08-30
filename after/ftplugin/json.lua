vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set(
    "n",
    "<leader>s",
    "<Cmd>%!jq<CR>",
    { noremap = true, silent = true }
)
