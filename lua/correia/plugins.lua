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
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					mocha = {
						rosewater = "#f5e0dc",
						flamingo = "#f2cdcd",
						pink = "#f5c2e7",
						-- mauve = "#eba0ac",
						red = "#f38ba8",
						maroon = "#eba0ac",
						peach = "#fab387",
						yellow = "#f9e2af",
						green = "#a6e3a1",
						teal = "#94e2d5",
						sky = "#89dceb",
						sapphire = "#74c7ec",
						blue = "#89b4fa",
						lavender = "#b4befe",
						text = "#cdd6f4",
						subtext1 = "#bac2de",
						subtext0 = "#a6adc8",
						overlay2 = "#9399b2",
						overlay1 = "#7f849c",
						overlay0 = "#6c7086",
						surface2 = "#585b70",
						surface1 = "#45475a",
						surface0 = "#313244",
						-- base = "#1e1e2e",
						-- mantle = "#181825",
						-- crust = "#11111b",
						base = "#181825",
						mantle = "#181825",
						crust = "#181825",
					},
					-- mocha = {
					-- 	rosewater = "#ea6962",
					-- 	flamingo = "#ea6962",
					-- 	red = "#ea6962",
					-- 	maroon = "#ea6962",
					-- 	pink = "#d3869b",
					-- 	mauve = "#d3869b",
					-- 	peach = "#e78a4e",
					-- 	yellow = "#d8a657",
					-- 	green = "#a9b665",
					-- 	teal = "#89b482",
					-- 	sky = "#89b482",
					-- 	sapphire = "#89b482",
					-- 	blue = "#7daea3",
					-- 	lavender = "#7daea3",
					-- 	text = "#ebdbb2",
					-- 	subtext1 = "#d5c4a1",
					-- 	subtext0 = "#bdae93",
					-- 	overlay2 = "#a89984",
					-- 	overlay1 = "#928374",
					-- 	overlay0 = "#595959",
					-- 	surface2 = "#4d4d4d",
					-- 	surface1 = "#404040",
					-- 	surface0 = "#292929",
					-- 	base = "#1d2021",
					-- 	mantle = "#191b1c",
					-- 	crust = "#141617",
					-- },
				},
				highlight_overrides = {
					-- mocha = function(mocha)
					-- 	return {
					-- 		Comment = { fg = mocha.overlay0 },
     --                        text = { fg = mocha.subtext1 },
					-- 	}
					-- end,
				},
				integrations = {
					cmp = true,
					telescope = true,
					harpoon = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					alpha = true,
					notify = false,
					neogit = true,
					navic = true,
					mason = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

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
	-- 		vim.g.gruvbox_material_background = "hard"
	-- 		vim.g.gruvbox_material_foreground = "mix"
	-- 		vim.g.gruvbox_material_cursor = "blue" -- 'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
	-- 		vim.g.gruvbox_material_visual = "blue background" -- `'grey background'`, `'green background'`, `'blue background'`, `'red background'`, `'orange background'`, `'yellow background'`, `'aqua background'`, `'purple background'`, `'grey foreground'`, `'green foreground'`, `'blue foreground'`, `'red foreground'`, `'orange foreground'`, `'yellow foreground'`, `'aqua foreground'`, `'purple foreground'`
	-- 		vim.g.gruvbox_material_menu_selection_background = "blue"
	-- 		vim.g.gruvbox_material_ui_contrast = "high"
	-- 		vim.g.gruvbox_material_float_style = "dim" -- bright, dim
	-- 		vim.g.gruvbox_material_diagnostic_text_highlight = 1
	-- 		vim.g.gruvbox_material_diagnostic_line_highlight = 1
	-- 		vim.g.gruvbox_material_diagnostic_virtual_text = "colored" -- 'grey'`, `'colored'`, `'highlighted'`
	-- 		vim.g.gruvbox_material_current_word = "bold" -- 'grey background'`, `'bold'`, `'underline'`, `'italic'`

	-- 		vim.cmd([[colorscheme gruvbox-material]])
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
