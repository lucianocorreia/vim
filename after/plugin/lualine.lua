local function getWords()
    if vim.fn.getfsize(vim.fn.expand("%")) > 200000 then
        return ""
    end

    if vim.fn.wordcount().visual_words == 1 then
        return "1 word"
    elseif not (vim.fn.wordcount().visual_words == nil) then
        return tostring(vim.fn.wordcount().visual_words) .. " words"
    else
        if vim.fn.wordcount().words == 1 then
            return "1 word"
        else
            return tostring(vim.fn.wordcount().words) .. " words"
        end
    end
end

local function getGuiFont() return vim.api.nvim_get_option("guifont") end

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
        lualine_c = { 'filename', 'searchcount', 'selectioncount' },
        lualine_x = { 'diff', 'encoding', 'fileformat', 'filetype' },
        lualine_y = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic', 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError',         -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',          -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',          -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',          -- Changes diagnostics' hint color.
                },
                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                colored = true,                   -- Displays diagnostics status in color if set to true.
                update_in_insert = false,         -- Update diagnostics in insert mode.
                always_visible = false,           -- Show diagnostics even if there are none.
            }
        },
        lualine_z = { 'progress', 'location' },
    },
})
