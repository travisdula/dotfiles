" Thanks to ChristianChiarulli on Github for much of this <https://github.com/ChristianChiarulli/nvim/blob/master/keys/mappings.vim>
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Change escape keys
inoremap jk <Esc>
inoremap kj <Esc>

" Leader key settings
let mapleader = "\<Space>"
nnoremap <leader>g :Goyo<CR>:<Esc>
nnoremap <leader>h :noh<CR>:<Esc>
"autocmd FileType cpp nnoremap <leader>c :!g++ % -ggdb -o %:r <CR>
"autocmd FileType java nnoremap <leader>c :!javac %:r<CR>
