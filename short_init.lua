local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "lg-epitech/headers.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            dir = "/home/runner/headers.nvim",

            opts = {
                templates_dir = "/home/runner/headers.nvim/templates"
            }
        },
    },
    install = {
        colorscheme = {"darkplus", "default"},
    },
    ui = { border = "rounded" },
    change_detection = {
        enabled = true,
        notify = false,
    },
})
