local M = {
    "epi_headers",
    dir = "~/projects/epi_headers",
    config = function()
        vim.keymap.set('n', "tek", function() require('epiheaders').insert_header() end);
    end
}

return M
