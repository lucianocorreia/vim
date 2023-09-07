require("lualine").setup({
    -- sections = {lualine_c = {"filename", {getWords}}, lualine_x = {{getGuiFont}, 'filetype'}},
    options = {
        icons_enabled = true,
        theme = 'catppuccin-mocha',
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename', 'searchcount', 'selectioncount',
            -- {
            --     function() return require("nvim-navic").get_location() end,
            --     cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
            -- {
            --     function() return require("noice").api.status.mode.get() end,
            --     cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            -- },
        },
        lualine_x = {
            -- {
            --     function() return require("noice").api.status.command.get() end,
            --     cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --     color = { fg = '#cba6f7' },
            -- },
            {
                'diff',
                colored = true,                                           -- Displays a colored diff status if set to true
                diff_color = {
                    added    = 'LuaLineDiffAdd',                          -- Changes the diff's added color
                    modified = 'LuaLineDiffChange',                       -- Changes the diff's modified color
                    removed  = 'LuaLineDiffDelete',                       -- Changes the diff's removed color you
                },
                symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
                source = nil,                                             -- A function that works as a data source for diff.
            }, 'encoding', 'fileformat', 'filetype' },
        lualine_y = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic', 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = { error = " ", warn = " ", hint = " ", info = " " },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            }
        },
        lualine_z = { 'progress', 'location' },
    },
})
