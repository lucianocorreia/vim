local lsp = require("lsp-zero").preset({})
local Remap = require("correia.keymap")
local inoremap = Remap.inoremap
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

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

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
    hi! LspReferenceRead guibg=#585b70
    hi! LspReferenceText  guibg=#585b70
    hi! LspReferenceWrite  guibg=#585b70 ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end)

nnoremap('<leader>cf', ':lua vim.lsp.buf.format()<CR>', { desc = '[C]ode [F]ormat' })
vnoremap('<leader>cf', function()
    vim.lsp.buf.format({
        async = true,
        range = {
            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        }
    })
end)

-- Whenever an LSP attaches to a buffer, we will run this function.
--
-- See `:help LspAttach` for more information about this autocmd event.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('correia-lsp-attach-format', { clear = true }),
    -- This is where we attach the autoformatting for reasonable clients
    callback = function(args)
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        local bufnr = args.buf

        -- Only attach to clients that support document formatting
        if not client.server_capabilities.documentFormattingProvider then
            return
        end

        -- Tsserver usually works poorly. Sorry you work with bad languages
        -- You can remove this line if you know what you're doing :)
        if client.name ~= 'rust_analyzer' then
            return
        end

        -- Create an autocmd that will run *before* we save the buffer.
        --  Run the formatting command for the LSP that has just attached.
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format {
                    async = false,
                    filter = function(c)
                        return c.id == client.id
                    end,
                }
            end,
        })
    end,
})


-- lsp.format_mapping("<leader>ff", {
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ["rust_analyzer"] = { "rust" },
--         ["null-ls"] = {
--             "lua",
--             "c",
--             "cpp",
--             "json",
--             "javascript",
--             "typescript",
--             "typescriptreact",
--             "markdown",
--             "css",
--             "sass",
--             "scss",
--             "php",
--         },
--     },
-- })

lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()
-- require("mason-nvim-dap").setup({
--   ensure_installed = { "python", "cpp" },
--   automatic_installation = true,
--   handlers = {
--     function(config) require("mason-nvim-dap").default_setup(config) end,
--   },
-- })

local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>.', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    },
    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
        -- automatically set inlay hints (type hints)
        -- default: true
        auto = true,

        -- Only show inlay hints for the current line
        only_current_line = false,

        -- whether to show parameter hints with the inlay hints or not
        -- default: true
        show_parameter_hints = true,

        -- prefix for parameter hints
        -- default: "<-"
        parameter_hints_prefix = "<- ",

        -- prefix for all the other hints (type, chaining)
        -- default: "=>"
        other_hints_prefix = "=> ",

        -- whether to align to the length of the longest line in the file
        max_len_align = false,

        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,

        -- whether to align to the extreme right or not
        right_align = true,

        -- padding from the right if right_align is true
        right_align_padding = 5,

        -- The color of the hints
        highlight = "Comment",
    },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
        { name = 'copilot' },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s ", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snp]",
                buffer = "[Buf]",
                path = "[Pth]",
                copilot = "[Cpl]",
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

require("inlay-hints").setup()
