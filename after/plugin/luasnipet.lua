local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

require("luasnip.loaders.from_snipmate").lazy_load()

-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node

-- -- custom snippets
-- ls.add_snippets("php", {
--   s("logger(json_encode($, JSON_PRETTY_PRINT)", {
--     t("autosnippet"),
--   }),
-- }, {
--   key = "kj",
-- })
