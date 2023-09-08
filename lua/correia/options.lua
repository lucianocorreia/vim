local options = {
    autoindent = true,
    smartindent = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    showtabline = 1,
    cmdheight = 1,
    showmatch = true,

    number = true,
    relativenumber = false,
    numberwidth = 5,
    incsearch = true,
    hlsearch = true,
    ignorecase = true,
    smartcase = true,

    splitbelow = true,
    splitright = true,

    termguicolors = true,
    hidden = true,
    signcolumn = "yes",
    showmode = true,
    errorbells = false,
    wrap = false,
    cursorline = true,
    fileencoding = "utf-8",

    backup = false,
    writebackup = false,
    swapfile = false,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,

    colorcolumn = "120",
    updatetime = 20,
    scrolloff = 15,
    mouse = "a",
    --   guicursor = "a:block",

    title = true,
    -- titlestring = "%t - Wvim",
    titlestring = "Neovim - %t",
    -- guifont = "FiraCode Nerd Font:h28",
    clipboard = "unnamedplus",
}

vim.opt.nrformats:append("alpha") -- increment letters
vim.opt.shortmess:append("IsF")

-- vim.o.shortmess = "filnxstToOFS"

for option, value in pairs(options) do
    vim.opt[option] = value
end
