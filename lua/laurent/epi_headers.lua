local M = {
    "lg-epitech/epi_headers",
    config = function()
        vim.keymap.set('n', "tek", function() require('headers').insert_header() end);
    end
}

return M
