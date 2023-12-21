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
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

-- lspconfig["omnisharp"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	enable_editorconfig_support = true,
-- 	enable_roslyn_analyzers = true,
-- 	organize_imports_on_format = true,
-- 	enable_import_completion = true,
-- 	analyze_open_documents_only = false,
-- 	filetypes = { "cs", "vb" },
-- })


lspconfig["tailwindcss"].setup({
    filetypes = {
        'templ',
        'html',
        'css',
    },
    init_options = {
        userLanguages = {
            templ = "html"
        }
    }
})


local rust_tools = require('rust-tools')
local ih = require("inlay-hints")
ih.setup()

rust_tools.setup({
    tools = {
        on_initialized = function()
            ih.set_all()
        end,
        inlay_hints = {
            auto = false,
        },
    },
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>.', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    },
    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
        -- automatically set inlay hints (type hints)
        -- default: true
        auto = false,

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
        right_align = false,

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

require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 400,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
    -- should_enable: a callback that overrides all other settings to
    -- enable/disable illumination. This will be called a lot so don't do
    -- anything expensive in it.
    should_enable = function(bufnr) return true end,
    -- case_insensitive_regex: sets regex case sensitivity
    case_insensitive_regex = false,
})
