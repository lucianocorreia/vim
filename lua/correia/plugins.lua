local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "kevinhwang91/nvim-bqf",                      ft = "qf" },

    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- require("catppuccin").setup({
            --     flavour = "mocha", -- latte, frappe, macchiato, mocha
            --     background = {     -- :h background
            --         light = "latte",
            --         dark = "mocha",
            --     },
            --     transparent_background = false, -- disables setting the background color.
            --     show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
            --     term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
            --     dim_inactive = {
            --         enabled = false,            -- dims the background color of inactive window
            --         shade = "dark",
            --         percentage = 0.15,          -- percentage of the shade to apply to the inactive window
            --     },
            --     no_italic = false,              -- Force no italic
            --     no_bold = false,                -- Force no bold
            --     no_underline = false,           -- Force no underline
            --     styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
            --         comments = { "italic" },    -- Change the style of comments
            --         conditionals = {},
            --         loops = {},
            --         functions = {},
            --         keywords = {},
            --         strings = {},
            --         variables = {},
            --         numbers = {},
            --         booleans = {},
            --         properties = {},
            --         types = {},
            --         operators = {},
            --         -- miscs = {}, -- Uncomment to turn off hard-coded styles
            --     },
            --     color_overrides = {
            --         mocha = {
            --             rosewater = "#f5e0dc",
            --             flamingo = "#f2cdcd",
            --             pink = "#f5c2e7",
            --             -- mauve = "#eba0ac",
            --             red = "#f38ba8",
            --             maroon = "#eba0ac",
            --             peach = "#fab387",
            --             yellow = "#f9e2af",
            --             green = "#a6e3a1",
            --             teal = "#94e2d5",
            --             sky = "#89dceb",
            --             sapphire = "#74c7ec",
            --             blue = "#89b4fa",
            --             lavender = "#b4befe",
            --             text = "#cdd6f4",
            --             subtext1 = "#bac2de",
            --             subtext0 = "#a6adc8",
            --             overlay2 = "#9399b2",
            --             overlay1 = "#7f849c",
            --             overlay0 = "#6c7086",
            --             surface2 = "#585b70",
            --             surface1 = "#45475a",
            --             surface0 = "#313244",
            --             -- base = "#1e1e2e",
            --             -- mantle = "#181825",
            --             -- crust = "#11111b",
            --             base = "#181825",
            --             mantle = "#181825",
            --             crust = "#181825",
            --         },
            --         -- mocha = {
            --         --     rosewater = "#ea6962",
            --         --     flamingo = "#ea6962",
            --         --     red = "#ea6962",
            --         --     maroon = "#d5c4a1",
            --         --     pink = "#d3869b",
            --         --     mauve = "#d3869b",
            --         --     peach = "#e78a4e",
            --         --     yellow = "#d8a657",
            --         --     green = "#83c092",
            --         --     teal = "#89b482",
            --         --     sky = "#89b482",
            --         --     sapphire = "#89b482",
            --         --     blue = "#7daea3",
            --         --     lavender = "#7daea3",
            --         --     text = "#ebdbb2",
            --         --     subtext1 = "#d5c4a1",
            --         --     subtext0 = "#bdae93",
            --         --     overlay2 = "#a89984",
            --         --     overlay1 = "#928374",
            --         --     overlay0 = "#595959",
            --         --     surface2 = "#4d4d4d",
            --         --     surface1 = "#404040",
            --         --     surface0 = "#292929",
            --         --     base = "#1d2021",
            --         --     mantle = "#191b1c",
            --         --     crust = "#141617",
            --         -- },
            --     },
            --     highlight_overrides = {
            --         mocha = function(mocha)
            --             return {
            --                 -- -- Comment = { fg = mocha.overlay0 },
            --                 -- text = { fg = mocha.subtext1 },
            --                 -- number = { fg = mocha.sky },
            --                 -- error = { fg = mocha.flamingo, bg = "" },
            --                 -- warning = { fg = mocha.yellow, bg = "" },
            --                 -- info = { fg = mocha.sky, bg = "" },
            --                 -- ["@comment"] = { fg = mocha.overlay0, style = { "italic" } },
            --                 -- ["@numbers"] = { fg = mocha.sky },
            --                 -- ["@virual"] = { fg = mocha.flamingo },
            --             }
            --         end,
            --     },
            --     integrations = {
            --         cmp = true,
            --         telescope = true,
            --         harpoon = true,
            --         gitsigns = true,
            --         nvimtree = true,
            --         treesitter = true,
            --         alpha = true,
            --         notify = false,
            --         neogit = true,
            --         navic = true,
            --         mason = true,
            --         -- mini = {
            --         -- 	enabled = true,
            --         -- 	indentscope_color = "",
            --         -- },
            --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            --     },
            -- })

            -- vim.cmd([[colorscheme catppuccin-mocha]]) -- some issues with gitgutter color if in after
            -- vim.cmd.hi("Comment gui=none")
        end,
    },
    {
        "sainnhe/everforest",
        priority = 1000,
        config = function()
            -- vim.g.everforest_background = "hard"
            -- vim.g.everforest_enable_italic = 1
            -- vim.g.everforest_diagnostic_text_highlight = 0
            -- vim.g.everforest_diagnostic_virtual_text = "colored"
            -- vim.g.everforest_diagnostic_line_highlight = 1
            -- vim.g.everforest_current_word = "bold"
            -- vim.g.everforest_ui_contrast = "high"
            -- vim.g.show_eob = 1
            -- vim.g.everforest_float_style = "bright" -- bright, dim
            -- vim.g.everforest_better_performance = 1
            -- vim.g.everforest_colors_override = {
            --     bg0 = { '#1e2326', '235' },
            --     bg1 = { '#272e33', '236' },
            --     grey1 = { '#859289', '247' },
            --     grey0 = { '#414b50', '243' },

            -- -- \ 'statusline1':['#a7c080',   '142'],
            -- -- \ 'statusline2':['#d3c6aa',   '223'],
            -- -- \ 'statusline3':['#e67e80',   '167'],
            -- }

            -- -- --  \ 'bg_dim':     ['#1e2326',   '233'],
            -- -- -- \ 'bg0':        ['#272e33',   '235'],
            -- -- -- \ 'bg1':        ['#2e383c',   '236'],
            -- -- -- \ 'bg2':        ['#374145',   '237'],
            -- -- -- \ 'bg3':        ['#414b50',   '238'],
            -- -- -- \ 'bg4':        ['#495156',   '239'],
            -- -- -- \ 'bg5':        ['#4f5b58',   '240'],
            -- -- -- \ 'bg_visual':  ['#4c3743',   '52'],
            -- -- -- \ 'bg_red':     ['#493b40',   '52'],
            -- -- -- \ 'bg_green':   ['#3c4841',   '22'],
            -- -- -- \ 'bg_blue':    ['#384b55',   '17'],
            -- -- -- \ 'bg_yellow':  ['#45443c',   '136'],
            -- -- -- \ 'fg':         ['#d3c6aa',   '223'],
            -- -- -- \ 'red':        ['#e67e80',   '167'],
            -- -- -- \ 'orange':     ['#e69875',   '208'],
            -- -- -- \ 'yellow':     ['#dbbc7f',   '214'],
            -- -- -- \ 'green':      ['#a7c080',   '142'],
            -- -- -- \ 'aqua':       ['#83c092',   '108'],
            -- -- -- \ 'blue':       ['#7fbbb3',   '109'],
            -- -- -- \ 'purple':     ['#d699b6',   '175'],
            -- -- -- \ 'grey0':      ['#7a8478',   '243'],
            -- -- -- \ 'grey1':      ['#859289',   '245'],
            -- -- -- \ 'grey2':      ['#9da9a0',   '247'],
            -- -- -- \ 'statusline1':['#a7c080',   '142'],
            -- -- -- \ 'statusline2':['#d3c6aa',   '223'],
            -- -- -- \ 'statusline3':['#e67e80',   '167'],
            -- -- -- \ 'none':       ['NONE',      'NONE']

            -- vim.cmd([[colorscheme everforest]])
            -- -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7a8478' })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "main",      -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },

                styles = {
                    bold = false,
                    italic = false,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",

                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    if highlight.undercurl then
                        highlight.undercurl = false
                    end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            vim.cmd("colorscheme rose-pine")
            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jay-babu/mason-nvim-dap.nvim" },
            { "j-hui/fidget.nvim",                tag = "legacy", opts = {} },

            -- -- null-ls
            -- { "jose-elias-alvarez/null-ls.nvim" },
            -- { "jay-babu/mason-null-ls.nvim" },

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    -- Snippet Engine & its associated nvim-cmp source
                    "L3MON4D3/LuaSnip",
                    "saadparwaiz1/cmp_luasnip",

                    -- Adds LSP completion capabilities
                    "hrsh7th/cmp-nvim-lsp",

                    -- Adds a number of user-friendly snippets
                    "rafamadriz/friendly-snippets",
                },
            },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip",            version = "2.*" },
            { "rafamadriz/friendly-snippets" },
            { "honza/vim-snippets" },

            -- other languages
            { "fatih/vim-go" },
            { "rrethy/vim-illuminate" },

            -- rust
            {
                "mrcjkb/rustaceanvim",
                version = "^4",
                ft = { "rust" },
            },
            {
                "saecki/crates.nvim",
                tag = "stable",
                config = function()
                    require("crates").setup()
                end,
            },
        },
    },

    -- copilot
    { "github/copilot.vim" },

    -- nice to have
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-autopairs" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },

    -- navigation
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        },
    },
    { "ThePrimeagen/harpoon" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- git
    { "kdheepak/lazygit.nvim" },
    -- { "airblade/vim-gitgutter" },
    { "lewis6991/gitsigns.nvim" },

    -- Debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "nvim-telescope/telescope-dap.nvim" },
    { "leoluz/nvim-dap-go" },

    -- misc
    { "mbbill/undotree" },
    { "uga-rosa/ccc.nvim" },
    { "nvim-pack/nvim-spectre" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
    { "nycrat/gui-fonts.nvim" },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- looks
    { "laytan/cloak.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "akinsho/bufferline.nvim",             version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },
    -- { 'akinsho/bufferline.nvim',            version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local alpha = require("alpha")
            local startify = require("alpha.themes.startify")

            -- Send config to alpha
            alpha.setup(startify.config)

            -- Disable folding on alpha buffer
            vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
        end,
    },

    -- trouble
    {
        "folke/trouble.nvim",
        event = "BufRead",
        opts = {},
    },

    { "folke/neodev.nvim", opts = {} },

    -- http client
    {
        "rest-nvim/rest.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- stay in current windows (.http file) or change to results window (default)
                stay_in_current_window_after_split = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    -- show the generated curl command in case you want to launch
                    -- the same request via the terminal (can be verbose)
                    show_curl_command = false,
                    show_http_info = true,
                    show_headers = true,
                    -- table of curl `--write-out` variables or false if disabled
                    -- for more granular control see Statistics Spec
                    show_statistics = false,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {
                        json = "jq",
                        html = function(body)
                            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                        end,
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = ".env",
                custom_dynamic_variables = {},
                yank_dry_run = true,
                search_back = true,
            })
        end,
    },

    -- terminal
    {
        "numToStr/FTerm.nvim",
        config = function(_, opts)
            require("FTerm").setup({
                border = "double",
                dimensions = {
                    height = 0.7,
                    width = 0.7,
                },
            })
        end,
    },
})
