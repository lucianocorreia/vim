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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]]) -- some issues with gitgutter color if in after
			vim.cmd.hi("Comment gui=none")
		end,
	},
	-- {
	-- 	"sainnhe/everforest",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- vim.g.everforest_background = "hard"
	-- 		-- vim.g.everforest_enable_italic = 1
	-- 		-- vim.g.everforest_diagnostic_text_highlight = 1
	-- 		-- vim.g.everforest_diagnostic_virtual_text = "colored"
	-- 		-- vim.g.everforest_diagnostic_line_highlight = 1
	-- 		-- vim.g.everforest_current_word = "bold"
	-- 		-- vim.g.everforest_ui_contrast = "high"
	-- 		-- vim.g.show_eob = 1
	-- 		-- vim.geverforest_float_style = "dim"
	-- 		-- vim.g.everforest_better_performance = 1
	-- 		-- vim.cmd([[colorscheme everforest]])
	-- 	end,
	-- },
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- vim.g.gruvbox_material_background = "soft"
	-- 		-- vim.g.gruvbox_material_foreground = "mix"
	-- 		-- vim.g.gruvbox_material_cursor = "blue" -- 'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
	-- 		-- vim.g.gruvbox_material_visual = "blue background" -- `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'orange background'`, `'yellow background'`, `'aqua background'`, `'purple background'`, `'grey foreground'`, `'green foreground'`, `'blue foreground'`, `'red foreground'`, `'orange foreground'`, `'yellow foreground'`, `'aqua foreground'`, `'purple foreground'`
	-- 		-- vim.g.gruvbox_material_menu_selection_background = "blue"
	-- 		-- vim.g.gruvbox_material_ui_contrast = "high"
	-- 		-- vim.g.gruvbox_material_float_style = "dim" -- bright, dim
	-- 		-- vim.g.gruvbox_material_diagnostic_text_highlight = 1
	-- 		-- vim.g.gruvbox_material_diagnostic_line_highlight = 1
	-- 		-- vim.g.gruvbox_material_diagnostic_virtual_text = "colored" -- 'grey'`, `'colored'`, `'highlighted'`
	-- 		-- vim.g.gruvbox_material_current_word = "bold" -- 'grey background'`, `'bold'`, `'underline'`, `'italic'`

	-- 		-- vim.cmd([[colorscheme gruvbox-material]])
	-- 	end,
	-- },
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			options = {
	-- 				-- Compiled file's destination location
	-- 				compile_path = vim.fn.stdpath("cache") .. "/github-theme",
	-- 				compile_file_suffix = "_compiled", -- Compiled file suffix
	-- 				hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
	-- 				hide_nc_statusline = true, -- Override the underline style for non-active statuslines
	-- 				transparent = false, -- Disable setting background
	-- 				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	-- 				dim_inactive = false, -- Non focused panes set to alternative background
	-- 				module_default = true, -- Default enable value for modules
	-- 				styles = { -- Style to be applied to different syntax groups
	-- 					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
	-- 					functions = "NONE",
	-- 					keywords = "NONE",
	-- 					variables = "NONE",
	-- 					conditionals = "NONE",
	-- 					constants = "NONE",
	-- 					numbers = "NONE",
	-- 					operators = "NONE",
	-- 					strings = "NONE",
	-- 					types = "NONE",
	-- 				},
	-- 				inverse = { -- Inverse highlight for different types
	-- 					match_paren = false,
	-- 					visual = false,
	-- 					search = false,
	-- 				},
	-- 				darken = { -- Darken floating windows and sidebar-like windows
	-- 					floats = false,
	-- 					sidebars = {
	-- 						enabled = true,
	-- 						list = {}, -- Apply dark background to specific windows
	-- 					},
	-- 				},
	-- 				modules = { -- List of various plugins and additional options
	-- 					-- ...
	-- 				},
	-- 			},
	-- 			palettes = {},
	-- 			specs = {},
	-- 			groups = {},
	-- 		})

	-- 		vim.cmd("colorscheme github_dark_default")
	-- 	end,
	-- },
    {
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jay-babu/mason-nvim-dap.nvim" },
			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

			-- null-ls
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "jay-babu/mason-null-ls.nvim" },

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
			{ "L3MON4D3/LuaSnip", version = "2.*" },
			{ "rafamadriz/friendly-snippets" },
			{ "honza/vim-snippets" },

			-- other languages
			{ "fatih/vim-go" },
			{ "rrethy/vim-illuminate" },
			{ "jlcrochet/vim-razor" },

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
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
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
