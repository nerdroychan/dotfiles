-- make space a leader key
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.o.number = true
vim.o.relativenumber = true
vim.o.foldmethod = "marker"
vim.o.vb = true
vim.o.colorcolumn = "72,100"

-- autoread
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "VimResume", "BufEnter", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
    command = "echohl WarningMsg | echo \"File changed on disk. Buffer reloaded.\" | echohl None",
    pattern = { "*" },
})

-- vimdiff (need to use .opt)
vim.opt.diffopt:append("iwhite")
vim.opt.diffopt:append("algorithm:histogram")
vim.opt.diffopt:append("indent-heuristic")

-- global undofile
vim.o.undofile = true

-- highlight trailing spaces
vim.cmd([[match Search "\s\+$"]])

-- spellcheck
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.tex", "*.md", "*.txt", "*.html", "*.htm" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

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
vim.keymap.set("n", "<space>w", "<cmd>w<cr>")
---- home row same-time movement
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
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
        init = function() -- small hack to inject option without init
            vim.g.airline_symbols_ascii = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#left_sep"] = " "
            vim.g["airline#extensions#tabline#left_alt_sep"] = "|"
            vim.g["airline#extensions#whitespace#enabled"] = 1
        end,
        config = function()
            vim.cmd([[hi StatusLine cterm=None gui=None]])
            vim.cmd([[hi StatusLineNC cterm=None gui=None]])
            vim.o.showmode = false
        end,
    },
    -- neo-tree instead of netrw
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
            require("neo-tree").setup({
                close_if_last_window = false,
                hijack_netrw_behavior = "open_default",
                popup_border_style = "rounded",
                window = {
                    position = "float",
                    mappings = {
                        ["/"] = "filter_on_submit",
                        ["f"] = "fuzzy_finder",
                    },
                },
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function(file_path)
                            -- clear all filters
                            local state = require("neo-tree.sources.manager").get_state("filesystem")
                            local fs = require("neo-tree.sources.filesystem")
                            fs.reset_search(state, false)
                            -- close neo-tree window
                            require("neo-tree.command").execute({ action = "close" })
                        end
                    },
                },
            })
            vim.api.nvim_create_user_command(
                "Ex",
                function(args)
                    local cmd = "Neotree reveal"
                    if (args["args"]) then
                        cmd = cmd .. " " .. args["args"]
                    end
                    vim.cmd(cmd)
                end,
                { nargs = "?" }
            )
        end,
    },
    -- toggle tags using F3
    {
        "majutsushi/tagbar",
        config = function()
            vim.keymap.set("", "<F3>", "<cmd>TagbarToggle<CR>")
        end,
    },
    -- match up
    {
        "andymass/vim-matchup",
    },
    -- auto close parentheses
    {
        "cohama/lexima.vim",
    },
    -- show git status
    {
        "airblade/vim-gitgutter",
    },
    -- all lsp stuff goes below this line
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Disable semantic highlights
            for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                vim.api.nvim_set_hl(0, group, {})
            end

            -- Setup language servers.
            local lspconfig = require("lspconfig")

            -- Server-specific settings. See `:help lspconfig-setup`
            lspconfig.rust_analyzer.setup { -- rust
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                            allTargets = true,
                        },
                    },
                },
            }

            lspconfig.clangd.setup {} -- c/c++

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "<space>[", vim.diagnostic.goto_prev) -- non-default
            vim.keymap.set("n", "<space>]", vim.diagnostic.goto_next) -- non-default
            vim.keymap.set("n", "<space>l", vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
                == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes(key, true, true, true), mode, true
                )
            end

            local cmp = require"cmp"
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                completion = {
                    autocomplete = false,
                },
                -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#super-tab-like-mapping
                mapping = {
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key.
                                       -- In this case, it's probably `<Tab>`.
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping.confirm({ select = true })
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                }, {
                    { name = "buffer" },
                })
            })
        end
    },
})
