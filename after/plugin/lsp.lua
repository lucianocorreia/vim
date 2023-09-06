local lsp = require("lsp-zero").preset({})
local Remap = require("correia.keymap")
local inoremap = Remap.inoremap
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap

lsp.on_attach(function(client, bufnr)
    -- lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, silent = true }

    nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    nnoremap("<leader>rn", function() vim.lsp.buf.rename() end, opts)
    nnoremap("<leader>gi", function() vim.lsp.buf.implementation() end, opts)
    nnoremap("<leader>gr", function() vim.lsp.buf.references() end, opts)
    nnoremap("<leader>gd", function() vim.lsp.buf.definition() end, opts)
    nnoremap("<leader>gF", function() vim.lsp.buf.declaration() end, opts)
    nnoremap("K", function() vim.lsp.buf.hover() end, opts)
    -- inoremap("<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    inoremap("<C-j>", function() vim.lsp.buf.signature_help() end, opts)

    nnoremap("<leader>de", function() vim.diagnostic.open_float() end, opts)
    -- nnoremap("<leader>m", function()
    --   vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    -- end, opts)

    -- xnoremap("<leader>m", function()
    --   vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    -- end, opts)
end)


vim.keymap.set('n', '<leader>cf', ':lua vim.lsp.buf.format()<CR>', { desc = '[C]ode [F]ormat' })
lsp.format_mapping("<leader>ff", {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["rust_analyzer"] = { "rust" },
        ["null-ls"] = {
            "lua",
            "c",
            "cpp",
            "json",
            "javascript",
            "typescript",
            "typescriptreact",
            "markdown",
            "css",
            "sass",
            "scss",
            "php",
        },
    },
})

lsp.setup()

-- require("mason-nvim-dap").setup({
--   ensure_installed = { "python", "cpp" },
--   automatic_installation = true,
--   handlers = {
--     function(config) require("mason-nvim-dap").default_setup(config) end,
--   },
-- })

local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require("cmp")
cmp.setup({
    performance = {
        debounce = 0,
        throttle = 0,
        confirm_resolve_timeout = 0,
    },
    preselect = "Item",
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "buffer" },
        { name = "path" },
        { name = 'nvim_lsp_signature_help' },
        -- { name = 'cmp_tabnine' },
        { name = 'crates' },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    view = {},
    window = {
        completion = {
            border = "rounded",
        },
        documentation = {
            border = "rounded",
        },
    },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})


local txt_formatter = {
    method = null_ls.methods.FORMATTING,
    filetypes = { "txt", "text" },
    generator = null_ls.formatter({
        command = "txt-format",
        args = { "$FILENAME" },
        to_stdin = true,
        from_stderr = true,
    }),
}

null_ls.setup({
    on_attach = function(client, bufnr) null_opts.on_attach(client, bufnr) end,
    sources = { txt_formatter },
})

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false,
    handlers = {},
})

-- vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
--   callback = function () vim.lsp.inlay_hint(0, true) end,
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
--   callback = function () vim.lsp.inlay_hint(0, false) end,
-- })
