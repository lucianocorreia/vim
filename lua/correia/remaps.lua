local Remap = require("correia.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local vnoremap = Remap.vnoremap
local tnoremap = Remap.tnoremap

local silent = { silent = true }

-- nnoremap("<C-z>", "<Cmd>silent !font-switcher; kill -SIGUSR1 $(ps -A | grep 'kitty$' | awk '{print $1}')<CR>")

-- nnoremap("<C-b>", "<Cmd>silent !font-switcher -d; kill -SIGUSR1 $(ps -A | grep 'kitty$' | awk '{print $1}')<CR>")

-- easier to enter normal mode
inoremap("kj", "<Esc>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>ge", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- buffers
nnoremap("<leader>bn", "<Cmd>bnext<CR>", { desc = "Next [B]uffer", silent = true })
nnoremap("<leader>bp", "<Cmd>bprevious<CR>", { desc = "Previous [B]uffer", silent = true })
nnoremap("<leader>bd", "<Cmd>bd<CR>", { desc = "[B]uffer [D]elete", silent = true })

-- Movement
nnoremap("<C-L>", "<C-W><C-L>", { desc = "Move to the [L]eft window" })
nnoremap("<C-H>", "<C-W><C-H>", { desc = "Move to the [H]ight window" })
nnoremap("<C-K>", "<C-W><C-K>", { desc = "Move to the [K]ight window" })
nnoremap("<C-J>", "<C-W><C-J>", { desc = "Move to the [J]ight window" })
nnoremap("<C-d>", "<C-d>zz", { desc = "Move [D]own" })
nnoremap("<C-u>", "<C-u>zz", { desc = "Move [U]p" })
nnoremap("n", "nzzzv", { desc = "Move [N]ext" })
nnoremap("N", "Nzzzv", { desc = "Move [N]ext" })

-- nnoremap("<leader>[", "<C-o>")
-- nnoremap("<leader>]", "<C-i>")

-- -- Resize Window
nnoremap("H", "2<C-W>>", { desc = "Resize [H]orizontal" })
nnoremap("L", "2<C-W><", { desc = "Resize [L]eft" })

-- Copy Paste
nnoremap("<leader>y", "yiw", { desc = "Copy [Y]ank word", silent = true })
nnoremap("<leader>p", "viwP", { desc = "Paste in world", silent = true })

-- inoremap("<D-v>", "<C-o>\"+p", silent)
-- nnoremap("<D-v>", "\"+p", silent)
-- vnoremap("<D-v>", "\"+p", silent)

-- built in terminal
nnoremap("<leader>tt", '<Cmd>lua require("FTerm").toggle()<CR>', { desc = "Toggle [T]erminal" })
tnoremap("<leader>tt", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle [T]erminal" })

--
tnoremap("<D-v>", function()
	local keys = vim.api.nvim_replace_termcodes('<C-\\><C-n>"+pi', true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, silent)

-- writing
-- nnoremap("<C-p>", "<Cmd>PencilToggle<CR><Cmd>echo \"Pencil Toggled\"<CR>")
nnoremap("<C-s>", "<Cmd>set spell!<CR>", { desc = "Toggle [S]pell", silent = true })

-- inoremap("<C-e>", "<Cmd>Goyo<CR>", silent)
-- inoremap("<C-p>", "<Cmd>PencilToggle<CR><Cmd>echo \"Pencil Toggled\"<CR>")
inoremap("<C-s>", "<Cmd>set spell!<CR>", { desc = "Toggle [S]pell", silent = true })

-- plugins
nnoremap("<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer", silent = true })
nnoremap("<leader>E", "<Cmd>NvimTreeFindFile<CR>", { desc = "Find [E]xplorer", silent = true })
nnoremap("<leader>co", "<Cmd>CccPick<CR>", { desc = "Ccc [O]pen", silent = true })
nnoremap("<leader>cc", "<Cmd>CccHighlighterToggle<CR>", { desc = "Ccc [C]olor [C]olumn", silent = true })
nnoremap("<leader>cv", "<Cmd>CccConvert<CR>", { desc = "Ccc [C]onvert", silent = true })
nnoremap("<leader>u", "<Cmd>UndotreeToggle<CR>", { desc = "Toggle [U]ndo", silent = true })
nnoremap("<leader>gg", "<Cmd>LazyGit<CR>", { desc = "Lazy [G]it", silent = true })

-- Move lines
vnoremap("J", ":m '>+1<CR>gv=gv", { desc = "Move [J] down" })
vnoremap("K", ":m '<-2<CR>gv=gv", { desc = "Move [K] up" })
vnoremap("<", "<gv", { desc = "Move [L]eft", silent = true })
vnoremap(">", ">gv", { desc = "Move [R]ight", silent = true })

-- hlsearch
nnoremap("<leader>hh", ":nohl<CR>", { desc = "Clear [H]ighlight", silent = true })

-- wrap
nnoremap("<leader>ow", "<Cmd>set wrap<CR>", { desc = "Toggle [O]verflow (wrap)", silent = true })
nnoremap("<leader>oq", "<cmd>set nowrap<cr>", { desc = "Toggle [O]verflow (wrap)", silent = true })

-- misc
nnoremap("<leader>rp", ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>", { desc = "Replace [P]attern" })
nnoremap("<leader>w", "<Cmd>w<CR>", { desc = "Save [W]rite" })

-- Running Code
nnoremap("<leader>cb", "<Cmd>Build<CR>", { desc = "Build", silent = true })
nnoremap("<leader>cd", "<Cmd>DebugBuild<CR>", { desc = "Debug [B]uild", silent = true })
nnoremap("<leader>cx", "<Cmd>Run<CR>", { desc = "Run", silent = true })
nnoremap("<leader>ct", "<Cmd>Test<CR>", { desc = "Test", silent = true })

-- Go run commands
nnoremap("<leader>gtf", "<Cmd>GoTestFunc<CR>", { desc = "Go [T]est [F]unction", silent = true })
nnoremap("<leader>gtp", "<Cmd>GoTestFile<CR>", { desc = "Go [T]est [P]ackage", silent = true })
nnoremap("<leader>gto", "<Cmd>GoCoverage<CR>", { desc = "Go [T]est [O]verage", silent = true })
nnoremap("<leader>gtc", "<Cmd>GoCoverageToggle<CR>", { desc = "Go [T]est [C]overage", silent = true })
nnoremap("<leader>gtb", "<Cmd>GoCoverageBrowser<CR>", { desc = "Go [T]est [B]rowser", silent = true })

nnoremap("<leader>gat", "<Cmd>GoAddTags<CR>", { desc = "Go [A]dd [T]ags", silent = true })
nnoremap("<leader>ger", "<Cmd>GoIfErr<CR>", { desc = "Go [E]rr [R]eport", silent = true })

-- lsp
nnoremap("<leader>sh", "<Cmd>RustEnableInlayHints<CR>", silent)
nnoremap("<leader>hs", "<Cmd>RustDisableInlayHints<CR>", silent)

-- gui only
nnoremap("<D-->", "<Cmd>FontSizeDecrement<CR>", silent)
nnoremap("<D-=>", "<Cmd>FontSizeIncrement<CR>", silent)
inoremap("<D-->", "<Cmd>FontSizeDecrement<CR>", silent)
inoremap("<D-=>", "<Cmd>FontSizeIncrement<CR>", silent)

nnoremap("<D-m>", "<Cmd>FontIndexIncrement<CR>")
nnoremap("<D-n>", "<Cmd>FontIndexDecrement<CR>")
inoremap("<D-m>", "<Cmd>FontIndexIncrement<CR>")
inoremap("<D-n>", "<Cmd>FontIndexDecrement<CR>")

-- Troble
nnoremap("<leader>xx", function()
	require("trouble").open()
end, { desc = "Trouble" })

nnoremap("<leader>xw", function()
	require("trouble").open("workspace_diagnostics")
end, { desc = "Trouble [W]orkspace" })

nnoremap("<leader>xd", function()
	require("trouble").open("document_diagnostics")
end, { desc = "Trouble [D]ocument" })

nnoremap("<leader>xq", function()
	require("trouble").open("quickfix")
end, { desc = "Trouble [Q]uickfix" })

nnoremap("<leader>xl", function()
	require("trouble").open("loclist")
end, { desc = "Trouble [L]oclist" })

nnoremap("<leader>xt", "<Cmd>exe ':TodoTrouble cwd=' .. fnameescape(expand('%:p'))<CR>", { desc = "Trouble [T]odo" })

nnoremap("gR", function()
	require("trouble").open("lsp_references")
end, { desc = "Trouble [R]eferences" })

-- rest http client
nnoremap("<leader>rr", "<Plug>RestNvim", { desc = "Rest [R]equest", silent = true })
nnoremap("<leader>rv", "<Plug>RestNvimPreview", { desc = "Rest [V]iew", silent = true })

-- fold
vnoremap("<C-f>", ":fold<CR>", { desc = "Fold", silent = true })
nnoremap("<C-f>", "<Cmd>foldopen<CR>", { desc = "Fold [O]pen", silent = true })
