-- leader is neat
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- tabs
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- override some defaults
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.relativenumber = true
vim.o.foldmethod = "marker"
vim.o.vb = true
vim.o.colorcolumn = "72,100"

-- vimdiff (need to use .opt)
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")

-- netrw
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0

-- global undofile
vim.o.undofile = true

-- highlight trailing spaces
vim.cmd([[match Search "\s\+$"]])

-- keymaps
---- disable arrow keys
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")
---- but let left/right switch buffer
vim.keymap.set("n", "<left>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<right>", "<cmd>bnext<CR>")
---- better movement on line wraps
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "J", "10gj")
vim.keymap.set("n", "K", "10gk")
---- always center search results
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
---- clear highlights with enter
vim.keymap.set("n", "<CR>", "<cmd>noh<CR><CR>")
---- switch buffer with Ctrl+N/P
vim.keymap.set("n", "<C-N>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-P>", "<cmd>bprev<CR>")
---- sometimes shift key does not register
vim.keymap.set("n", ";", ":")
---- quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
---- home row same-time movement
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
---- function keys
vim.keymap.set("", "<F2>", "<cmd>10Lexplore<CR>")
vim.keymap.set("", "<F4>", "<cmd>set paste!<CR>")

-- plugins (lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- need to use opt instead of o
require("lazy").setup({
    -- gruvbox ftw, and no need for special themes on other plugins
    {
        "morhetz/gruvbox",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.gruvbox_italic = 1
            vim.g.gruvbox_contrast_dark = "hard"
            vim.o.background = "dark"
            vim.cmd([[
                if exists("+termguicolors")
                    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
                    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
                    if &t_Co >= 256
                        set termguicolors
                    endif
                endif
            ]])
        end,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    -- the airline for basic status
    {
        "vim-airline/vim-airline",
        lazy = false,
        init = function() -- small hack to inject option without init
            vim.g.airline_symbols_ascii = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#left_sep"] = " "
            vim.g["airline#extensions#tabline#left_alt_sep"] = "|"
            vim.g["airline#extensions#whitespace#enabled"] = 1
        end,
        config = function()
            vim.o.showmode = false
        end,
    },
    -- toggle tags using F3
    {
        "majutsushi/tagbar",
        lazy = false,
        config = function()
            vim.keymap.set("", "<F3>", "<cmd>TagbarToggle<CR>")
        end,
    },
    -- match up
    {
        "andymass/vim-matchup",
        lazy = false,
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    -- auto close parentheses
    {
        "cohama/lexima.vim",
        lazy = false,
    },
    -- show git status
    {
        "airblade/vim-gitgutter",
        lazy = false,
    },
    -- change pwd to git root
    {
        "airblade/vim-rooter",
        lazy = false,
        config = function()
            vim.g.rooter_silent_chdir = 1
        end,
    },
})
