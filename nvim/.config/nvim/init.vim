call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/goyo.vim' 
call plug#end()
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/keybinds.vim
luafile $HOME/.config/nvim/lua/plug-colorizer.lua
source $HOME/.config/nvim/plug-config/coc.vim
