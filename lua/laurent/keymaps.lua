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

-- File-history navigation: <C-o> = back one file, <C-S-o> = forward one file.
-- Walks the jumplist but skips every jump inside the current buffer, so each
-- press lands on the most recent position in a different file. Navigation is
-- done with native {count}<C-o>/{count}<C-i>, so the history itself is never
-- modified by going back and forth.
local function jump_file(back)
    local jumps, cur = unpack(vim.fn.getjumplist())
    local curbuf = vim.api.nvim_get_current_buf()
    local step = back and -1 or 1
    -- `cur` is the 0-based jumplist position; k presses of <C-o>/<C-i> land
    -- on 0-based index cur - k / cur + k.
    local i = cur + step
    while i >= 0 and i < #jumps do
        local entry = jumps[i + 1]
        if entry.bufnr ~= curbuf and vim.fn.bufexists(entry.bufnr) == 1 then
            local count = math.abs(i - cur)
            local key = back and "\15" or "\9" -- <C-o> / <C-i>
            vim.cmd("normal! " .. count .. key .. "zz")
            return
        end
        i = i + step
    end
end

keymap("n", "<C-o>", function()
    jump_file(true)
end, opts)
keymap("n", "<C-S-o>", function()
    jump_file(false)
end, opts)

-- Telescope
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>t", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>gw", ":Telescope grep_string<CR>", opts)

-- Move
-- macOS sends literal glyphs for Option+key (US layout): j=∆ k=˚ h=˙ l=¬
-- so we map both <A-..> (Linux/Meta) and the glyphs (mac, no terminal change)
keymap("n", "<A-j>", ":MoveLine(1)<CR>", opts)
keymap("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
keymap("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
keymap("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
keymap("n", "∆", ":MoveLine(1)<CR>", opts)
keymap("n", "˚", ":MoveLine(-1)<CR>", opts)
keymap("n", "˙", ":MoveHChar(-1)<CR>", opts)
keymap("n", "¬", ":MoveHChar(1)<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Visual-mode commands
keymap("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
keymap("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
keymap("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
keymap("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
keymap("v", "∆", ":MoveBlock(1)<CR>", opts)
keymap("v", "˚", ":MoveBlock(-1)<CR>", opts)
keymap("v", "˙", ":MoveHBlock(-1)<CR>", opts)
keymap("v", "¬", ":MoveHBlock(1)<CR>", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ToggleTerm
keymap("n", "<C-\\>", ":ToggleTerm direction=vertical size=80<CR>", opts)
keymap(
    "n",
    "<C-|>",
    ":ToggleTerm direction=tab name='Full size Terminal'<CR>",
    opts
)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-\\>", "<C-\\><C-n>:ToggleTerm<CR>", opts)

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
keymap("n", "<leader>db", function()
    vim.api.nvim_command("tabnew")
    vim.api.nvim_command("DBUI")
end, opts)

-- Tabs
keymap("n", "<Tab>", "<Cmd>tabnext<CR>", opts)

-- Context
keymap("n", "<leader>co", "<Cmd>TSContextToggle<CR>", opts)

-- Git
keymap("n", "<leader>gs", "<Cmd>Gitsigns toggle_current_line_blame<CR>", opts)

-- To annoy everyone else but me
keymap("n", "<Up>", "", opts)
keymap("n", "<Down>", "", opts)
keymap("n", "<Left>", "", opts)
keymap("n", "<Right>", "", opts)
