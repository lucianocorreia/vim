require("correia.options")
require("correia.commands")
require("correia.lazy")
require("correia.remaps")

-- catppuccino
-- vim.cmd([[colorscheme catppuccin-mocha]]) -- some issues with gitgutter color if in after

-- tokyonight
require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night",      -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day",  -- The theme is used when the background is set to light
    transparent = false,  -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark",          -- style for sidebars, see below
        floats = "dark",            -- style for floating windows
    },
    sidebars = { "qf", "help" },    -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3,           -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false,           -- dims inactive windows
    lualine_bold = false,           -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})
vim.cmd[[colorscheme tokyonight]]

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
-- require('kanagawa').setup({
--     compile = true,   -- enable compiling the colorscheme
--     undercurl = false, -- enable undercurls
--     commentStyle = { italic = true, bold = false },
--     functionStyle = { bold = false },
--     keywordStyle = { italic = true, bold = false },
--     statementStyle = { bold = false },
--     typeStyle = { bold = false },
--     transparent = false,    -- do not set background color
--     dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true, -- define vim.g.terminal_color_{0,17}
--     colors = {
--         theme = {
--             all = {
--                 ui = {
--                     bg_gutter = "none"
--                 }
--             }
--         }
--     },
--     overrides = function(colors)
--         local theme = colors.theme
--         return {
--             Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
--             PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
--             PmenuSbar = { bg = theme.ui.bg_m1 },
--             PmenuThumb = { bg = theme.ui.bg_p2 },
--             -- TelescopeTitle = { fg = theme.ui.special, bold = true },
--             -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
--             -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
--             -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
--             -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
--             -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
--             -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
--             --
--             -- update kanagawa to handle new treesitter highlight captures
--             ["@string.regexp"] = { link = "@string.regex" },
--             ["@variable.parameter"] = { link = "@parameter" },
--             ["@exception"] = { link = "@exception" },
--             ["@string.special.symbol"] = { link = "@symbol" },
--             ["@markup.strong"] = { link = "@text.strong" },
--             ["@markup.italic"] = { link = "@text.emphasis" },
--             ["@markup.heading"] = { link = "@text.title" },
--             ["@markup.raw"] = { link = "@text.literal" },
--             ["@markup.quote"] = { link = "@text.quote" },
--             ["@markup.math"] = { link = "@text.math" },
--             ["@markup.environment"] = { link = "@text.environment" },
--             ["@markup.environment.name"] = { link = "@text.environment.name" },
--             ["@markup.link.url"] = { link = "Special" },
--             ["@markup.link.label"] = { link = "Identifier" },
--             ["@comment.note"] = { link = "@text.note" },
--             ["@comment.warning"] = { link = "@text.warning" },
--             ["@comment.danger"] = { link = "@text.danger" },
--             ["@diff.plus"] = { link = "@text.diff.add" },
--             ["@diff.minus"] = { link = "@text.diff.delete" },
--         }
--     end,
--     -- colors = {                   -- add/modify theme and palette colors
--     --     palette = {},
--     --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--     -- },
--     -- overrides = function(colors) -- add/modify highlights
--     --     return {}
--     -- end,
--     theme = "wave",    -- Load "wave" theme when 'background' option is not set
--     background = {     -- map the value of 'background' option to a theme
--         dark = "wave", -- try "dragon" !
--         light = "lotus"
--     },
-- })

-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")
