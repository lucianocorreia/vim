local nnoremap = require("correia.keymap").nnoremap

local telescope_builtin = require("telescope.builtin")
local silent = { silent = true }

require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.85,
			preview_cutoff = 120,
			horizontal = {
				preview_width = function(_, cols, _)
					if cols < 120 then
						return math.floor(cols * 0.5)
					end
					return math.floor(cols * 0.6)
				end,
				mirror = false,
			},
			vertical = { mirror = false },
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		file_ignore_patterns = {
			"node_modules/",
			"%.git/",
			"%.DS_Store$",
			"target/",
			"build/",
			"%.o$",
		},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
	pickers = {
		find_files = { hidden = true },
		live_grep = {
			-- @usage don't include the filename in the search results
			only_sort_text = true,
			prompt_position = "top",
		},
		diagnostics = {
			bufrn = 0,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		-- coc = {
		--   theme = 'ivy',
		--   prefer_locations = true -- always use Telescope locations to preview definitions/declarations/implementations etc
		-- }
	},
})

-- nnoremap("<leader>sw", telescope_builtin.live_grep, silent)
nnoremap("<leader>sw", function()
	require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({
		previewer = true,
		winblend = 10,
		prompt_position = "top",
	}))
end, silent)

nnoremap("<leader>st", function()
	require("telescope.builtin").help_tags(require("telescope.themes").get_ivy({
		previewer = true,
		winblend = 10,
		prompt_position = "top",
	}))
end, silent)

nnoremap("<leader>so", function()
	require("telescope.builtin").lsp_document_symbols(require("telescope.themes").get_ivy({
		previewer = true,
		winblend = 10,
		prompt_position = "top",
	}))
end, silent)

-- nnoremap("<leader>sd", telescope_builtin.diagnostics, silent)
nnoremap("<leader>sk", telescope_builtin.keymaps, { desc = "[S]earch [K]eymaps" })

nnoremap("<leader>sd", function()
	require("telescope.builtin").diagnostics(require("telescope.themes").get_ivy({
		previewer = false,
		winblend = 10,
	}))
end, { desc = "[S]earch [F]iles" })

nnoremap("<leader>sf", function()
	require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
		previewer = false,
		winblend = 10,
		prompt_position = "top",
	}))
end, { desc = "[S]earch [F]iles" })

nnoremap("<leader><leader>", function()
	require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
		previewer = false,
		prompt_position = "top",
	}))
end, { desc = "[S]earch [B]uffers" })

nnoremap("<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

nnoremap("<leader>s/", function()
	require("telescope.builtin").live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
		prompt_position = "top",
	})
end, { desc = "[S]earch [/] in Open Files" })

require("telescope").load_extension("fzf")
require("telescope").load_extension("lazygit")
