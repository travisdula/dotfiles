vim.cmd [[colorscheme nord]]
vim.cmd [[:hi statusline guibg=NONE]]

vim.diagnostic.config({
    virtual_text = true,      -- Turn virtual text on/off
    signs = true,             -- Show icons in the sign column
    underline = true,         -- Underline problematic code
    update_in_insert = false, -- Update diagnostics while typing
    severity_sort = true,     -- Sort diagnostics by severity (e.g., errors first)
})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.lsp.config('*', {
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>cf', function()
            vim.lsp.buf.format({ async = true })
        end, { desc = 'Format buffer' })
        vim.keymap.set('v', '<leader>cf', function()
            vim.lsp.buf.format({ async = true })
        end, { desc = 'Format selection' })
    end,
})

vim.lsp.enable({ 'lua_ls', 'nixd' })

vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wrap = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Telescope find git' })
vim.keymap.set(
    'n',
    '<leader>fs',
    function()
        builtin.lsp_document_symbols({ ignore_symbols = 'string' })
    end,
    { desc = 'Telescope find git' }
)
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
