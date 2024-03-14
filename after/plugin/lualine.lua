require("lualine").setup({
    -- sections = {lualine_c = {"filename", {getWords}}, lualine_x = {{getGuiFont}, 'filetype'}},
    options = {
        icons_enabled = true,
        theme = 'everforest',
        -- theme = 'catppuccin',
        -- theme = 'gruvbox-material',
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
            {
                'diff',
                colored = true,         -- Displays a colored diff status if set to true
                diff_color = {
                    -- added    = 'LuaLineDiffAdd', -- Changes the diff's added color
                    -- modified = 'LuaLineDiffChange', -- Changes the diff's modified color
                    -- removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
                    added = { fg = "#a6e3a1" },
                    modified = { fg = "#f9e2af" },
                    removed = { fg = "#f38ba8" },
                },
                symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            },
            {
                'filename',
                file_status = true,    -- Displays file status (readonly status, modified status)
                newfile_status = true, -- Display new file status (new file means no write after created)
                path = 0,              -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '[+]',      -- Text to show when the file is modified.
                    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                }
            },
            'searchcount', 'selectioncount',
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
            {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = { fg = '#cba6f7' },
            },
            -- {
            --     function()
            --         local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
            --         local icon = require("nvim-web-devicons").get_icon_by_filetype(
            --             vim.api.nvim_buf_get_option(0, "filetype")
            --         )
            --         if lsps and #lsps > 0 then
            --             local names = {}
            --             for _, lsp in ipairs(lsps) do
            --                 table.insert(names, lsp.name)
            --             end
            --             return string.format("%s %s", table.concat(names, ", "), icon)
            --         else
            --             return icon or ""
            --         end
            --     end,
            --     on_click = function()
            --         vim.api.nvim_command("LspInfo")
            --     end,
            --     color = function()
            --         local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
            --             vim.api.nvim_buf_get_option(0, "filetype")
            --         )
            --         return { fg = color }
            --     end,
            -- },

            -- {
            --     'buffers',
            --     show_filename_only = true,       -- Shows shortened relative path when set to false.
            --     hide_filename_extension = false, -- Hide filename extension when set to true.
            --     show_modified_status = true,     -- Shows indicator when the buffer is modified.

            --     -- use_mode_colors = false,
            --     buffers_color = {
            --         active = { fg = "#fab387" },
            --         inactive = { fg = "#bac2de" },
            --     },

            --     mode = 0, -- 0: Shows buffer name
            --     -- 1: Shows buffer index
            --     -- 2: Shows buffer name + buffer index
            --     -- 3: Shows buffer number
            --     -- 4: Shows buffer name + buffer number

            --     -- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            --     max_length = 80, -- Maximum width of buffers component,
            -- },
            'encoding',
            {
                'filetype',
                icon_only = true
            },
        },
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
    -- winbar = {
    --     lualine_a = {
    --         { "filetype", icon_only = true,    icon = { align = "left" } },
    --         { "filename", file_status = false, path = 0 },
    --     },
    --     lualine_b = {},
    --     lualine_c = { create_symbol_bar },
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- },
    extensions = { 'nvim-tree', 'lazy' },
})
