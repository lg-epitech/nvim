return {
    "gsuuon/note.nvim",
    opts = {
        -- opts.spaces are note workspace parent directories.
        -- These directories contain a `notes` directory which will be created if missing.
        -- `<space path>/notes` acts as the note root, so for space '~' the note root is `~/notes`.
        -- Defaults to { '~' }.
        spaces = {
            "~",
            -- '~/projects/foo'
        },

        -- Set keymap = false to disable keymapping
        keymap = {
          prefix = '<leader>n'
        }
    },
    cmd = "Note",
    ft = "note",
}
