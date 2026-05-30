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
-- Format the entire buffer
vim.keymap.set('n', '<leader>cf', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer' })

-- In visual mode, format only the selected lines
vim.keymap.set('v', '<leader>cf', function()
  vim.lsp.buf.format({ async = true })
end, { desc = 'Format selection' })

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
