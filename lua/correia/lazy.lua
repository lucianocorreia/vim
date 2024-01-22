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
    { "kevinhwang91/nvim-bqf", ft = "qf" },

    -- Colorscheme
    { "sainnhe/everforest" },
    { "rebelot/kanagawa.nvim" },

    -- Detect tabstop and shiftwidth automatically
    -- { 'tpope/vim-sleuth' },

    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig", },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jay-babu/mason-nvim-dap.nvim" },
            { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },

            -- null-ls
            { "jose-elias-alvarez/null-ls.nvim" },
            { "jay-babu/mason-null-ls.nvim" },

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    -- Snippet Engine & its associated nvim-cmp source
                    'L3MON4D3/LuaSnip',
                    'saadparwaiz1/cmp_luasnip',

                    -- Adds LSP completion capabilities
                    'hrsh7th/cmp-nvim-lsp',

                    -- Adds a number of user-friendly snippets
                    'rafamadriz/friendly-snippets',


                },
            },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "simrat39/inlay-hints.nvim" },

            -- Snippets
            { "L3MON4D3/LuaSnip",            version = "2.*" },
            { "rafamadriz/friendly-snippets" },
            { "honza/vim-snippets" },

            -- other languages
            { "simrat39/rust-tools.nvim" },
            { "fatih/vim-go" },
            { "rrethy/vim-illuminate" },
            { "jlcrochet/vim-razor" },
        },
    },

    -- java
    { "mfussenegger/nvim-jdtls" },

    -- copilot
    { "github/copilot.vim" },

    -- nice to have
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-autopairs" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" }
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
        }
    },
    { "ThePrimeagen/harpoon" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    -- git
    { "kdheepak/lazygit.nvim" },
    -- { "airblade/vim-gitgutter" },
    { "lewis6991/gitsigns.nvim" },

    -- Debugging
    -- { "mfussenegger/nvim-dap" },
    -- { "rcarriga/nvim-dap-ui" },
    -- { "theHamsta/nvim-dap-virtual-text" },
    -- { "nvim-telescope/telescope-dap.nvim" },
    -- { "leoluz/nvim-dap-go" },

    -- misc
    { "mbbill/undotree" },
    { "uga-rosa/ccc.nvim" },
    { "nvim-pack/nvim-spectre" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    { "nycrat/gui-fonts.nvim" },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- looks
    { "laytan/cloak.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- { 'akinsho/bufferline.nvim',            version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- trouble
    {
        "folke/trouble.nvim",
        event = "BufRead",
        opts = {

        },
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
                        end
                    },
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = '.env',
                custom_dynamic_variables = {},
                yank_dry_run = true,
                search_back = true,
            })
        end
    },

    -- terminal
    {
        "numToStr/FTerm.nvim",
        config = function(_, opts)
            require 'FTerm'.setup({
                border     = 'double',
                dimensions = {
                    height = 0.8,
                    width = 0.8,
                },
            })
        end
    }
})
