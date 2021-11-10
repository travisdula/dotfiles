call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim' 
Plug 'arcticicestudio/nord-vim' 
Plug 'airblade/vim-gitgutter' 
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybinds.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/coc.vim
