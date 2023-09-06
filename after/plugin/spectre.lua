local Remap = require("correia.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

local spectre = require("spectre")

nnoremap("<leader>R", spectre.open)
nnoremap("<leader>rw", function() spectre.open_visual({ select_word = true }) end)
-- vnoremap("<leader>s", spectre.open_visual)
-- nnoremap("<leader>sp", spectre.open_file_search)
