-- GLOBALS
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- OPTIONS
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.breakindent = true
vim.o.wrap = true

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.termguicolors = true
vim.o.mouse = ''

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.undofile = true
vim.o.updatetime = 250

-- THEME
vim.cmd.colorscheme('catppuccin')

-- Transparent background overrides
local hl_groups = { 'Normal', 'NonText', 'NormalNC', 'SignColumn' }
for _, group in ipairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, { bg = 'none', ctermbg = 'none' })
end

-- KEYMAPS
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')

-- Handle wrapped lines gracefully unless a count is given
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Netrw' })

-- LSP
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.lsp.config('*', {
    on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)

        vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
            vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = 'Format code' })
    end,
})

vim.lsp.enable({ 'lua_ls', 'nixd' })

-- TELESCOPE
local has_telescope, builtin = pcall(require, 'telescope.builtin')
if has_telescope then
    vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Find git files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>fs', function()
        builtin.lsp_document_symbols({ ignore_symbols = 'string' })
    end, { desc = 'LSP Document symbols' })
end
