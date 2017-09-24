" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" monokai color scheme
Plug 'xrav3nz/vim-monokai'

" fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" navigate files in a sidebar
Plug 'scrooloose/nerdtree'

" sublime-type multiple selections
Plug 'terryma/vim-multiple-cursors'

call plug#end()
