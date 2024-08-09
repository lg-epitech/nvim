local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-tab>", "<c-6>", opts)
keymap("n", "<BS>", "<Esc><Cmd>e#<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)
keymap("n", "<leader>e", ":Oil<CR>", opts)
keymap("n", "<C-c>", "<Esc>:nohl<CR>", opts)

keymap("i", "<C-H>", "<Esc>dbs", opts)
keymap("n", "<F1>", "", opts)

-- Telescope
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>gw", ":Telescope grep_string<CR>", opts)

-- Move
keymap('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
keymap('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Visual-mode commands
keymap('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
keymap('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

keymap('n', "<C-Up>", ":resize -2<CR>", opts)
keymap('n', "<C-Down>", ":resize +2<CR>", opts)
keymap('n', "<C-Left>", ":vertical resize -2<CR>", opts)
keymap('n', "<C-Right>", ":vertical resize +2<CR>", opts)

-- ToggleTerm
keymap("n", "<C-\\>", ":ToggleTerm direction=vertical size=80<CR>", opts)
keymap("n", "<C-|>", ":ToggleTerm direction=tab name='Full size Terminal'<CR>", opts)
keymap('t', '<Esc>', "<C-\\><C-n>", opts)
keymap('t', '<C-\\>', "<C-\\><C-n>:ToggleTerm<CR>", opts)

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Quickfix list
keymap("n", "<M-h>", ":cprev<CR>", opts)
keymap("n", "<M-l>", ":cnext<CR>", opts)

-- Quick paste from system clipboard
keymap("n", "<leader>v", '"+p', opts)
keymap("n", "x", '"_x', opts)

-- Resize windows
keymap("n", "<M-Q>", "<c-w>5<")
keymap("n", "<M-D>", "<c-w>5>")
keymap("n", "<M-Z>", "<C-W>+")
keymap("n", "<M-S>", "<C-W>-")

-- Spelling
keymap("n", "<F6>", "<Cmd>silent setlocal spell! spelllang=fr<CR>", opts)

-- Dadbod
keymap("n", "gdb", function()
    vim.api.nvim_command("tabnew")
    vim.api.nvim_command("DBUI")
end, opts)

-- Tabs
keymap("n", "<Tab>", "<Cmd>tabnext<CR>", opts)

-- Prettier NOTE: This is a temporary keybind and should be specific to filetypes
keymap("n", "<leader>s", "<Cmd>%!prettier \"%\"<CR>", opts)

-- Context
keymap("n", "<leader>co", "<Cmd>TSContextToggle<CR>", opts)
