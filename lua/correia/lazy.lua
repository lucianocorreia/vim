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
    { "kevinhwang91/nvim-bqf",    ft = "qf" },

    -- Colorscheme
    { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
    { 'sainnhe/gruvbox-material', priority = 1000 },

    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "jay-babu/mason-nvim-dap.nvim" },

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

            -- Snippets
            { "L3MON4D3/LuaSnip",            version = "2.*" },
            { "rafamadriz/friendly-snippets" },
            { "honza/vim-snippets" },
        },
    },

    -- copilot
    { "github/copilot.vim" },

    -- nice to have
    { "numToStr/Comment.nvim" },
    { "windwp/nvim-autopairs" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "kylechui/nvim-surround" },

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
    --   { "mfussenegger/nvim-dap" },
    --   { "rcarriga/nvim-dap-ui" },
    --   { "theHamsta/nvim-dap-virtual-text" },
    --   { "nvim-telescope/telescope-dap.nvim" },

    -- writing
    { "preservim/vim-pencil" },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
    },

    -- misc
    { "mbbill/undotree" },
    { "uga-rosa/ccc.nvim" },
    { "nvim-pack/nvim-spectre" },
    {
        "folke/noice.nvim",
        dependencies = { { "MunifTanjim/nui.nvim" }, { "rcarriga/nvim-notify" }, { "nvim-lua/plenary.nvim" } },
    },
    { "nycrat/todo.nvim" },
    { "nycrat/gui-fonts.nvim" },

    -- looks
    { "laytan/cloak.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "lukas-reineke/indent-blankline.nvim" },
    -- { 'akinsho/bufferline.nvim',            version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },
})
