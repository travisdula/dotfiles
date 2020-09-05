let mapleader = "\<Space>"
autocmd FileType cpp nnoremap <leader>c :!g++ % -ggdb -o %:r <CR>
autocmd FileType java nnoremap <leader>c :!javac %:r<CR>
