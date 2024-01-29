require("correia.options")
require("correia.commands")
require("correia.lazy")
require("correia.remaps")

-- catppuccino
-- vim.cmd([[colorscheme catppuccin-mocha]]) -- some issues with gitgutter color if in after

-- github_dark
-- vim.cmd('colorscheme github_dark_dimmed')

-- everforest
-- vim.g.everforest_background = "hard"
-- vim.g.everforest_enable_italic = 1
-- vim.g.everforest_diagnostic_text_highlight = 1
-- vim.g.everforest_diagnostic_virtual_text = "colored"
-- vim.g.everforest_diagnostic_line_highlight = 1
-- vim.g.everforest_current_word = "bold"
-- vim.g.everforest_ui_contrast = "high"
-- vim.g.show_eob = 1
-- vim.geverforest_float_style = "dim"
-- vim.g.everforest_better_performance = 1
-- vim.cmd([[colorscheme everforest]])

-- Default options:
require('kanagawa').setup({
    compile = true,   -- enable compiling the colorscheme
    undercurl = false, -- enable undercurls
    commentStyle = { italic = true, bold = false },
    functionStyle = { bold = false },
    keywordStyle = { italic = true, bold = false },
    statementStyle = { bold = false },
    typeStyle = { bold = false },
    transparent = true,    -- do not set background color
    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            -- TelescopeTitle = { fg = theme.ui.special, bold = true },
            -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            --
            -- update kanagawa to handle new treesitter highlight captures
            ["@string.regexp"] = { link = "@string.regex" },
            ["@variable.parameter"] = { link = "@parameter" },
            ["@exception"] = { link = "@exception" },
            ["@string.special.symbol"] = { link = "@symbol" },
            ["@markup.strong"] = { link = "@text.strong" },
            ["@markup.italic"] = { link = "@text.emphasis" },
            ["@markup.heading"] = { link = "@text.title" },
            ["@markup.raw"] = { link = "@text.literal" },
            ["@markup.quote"] = { link = "@text.quote" },
            ["@markup.math"] = { link = "@text.math" },
            ["@markup.environment"] = { link = "@text.environment" },
            ["@markup.environment.name"] = { link = "@text.environment.name" },
            ["@markup.link.url"] = { link = "Special" },
            ["@markup.link.label"] = { link = "Identifier" },
            ["@comment.note"] = { link = "@text.note" },
            ["@comment.warning"] = { link = "@text.warning" },
            ["@comment.danger"] = { link = "@text.danger" },
            ["@diff.plus"] = { link = "@text.diff.add" },
            ["@diff.minus"] = { link = "@text.diff.delete" },
        }
    end,
    -- colors = {                   -- add/modify theme and palette colors
    --     palette = {},
    --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    -- },
    -- overrides = function(colors) -- add/modify highlights
    --     return {}
    -- end,
    theme = "wave",    -- Load "wave" theme when 'background' option is not set
    background = {     -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
