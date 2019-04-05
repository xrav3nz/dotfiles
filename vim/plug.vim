" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" gruvbox color scheme
Plug 'morhetz/gruvbox'

" powerful fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" search across all files
Plug 'mileszs/ack.vim'

" navigate files in a sidebar
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-commentary'

Plug 'itchyny/lightline.vim'

" language/framework specific
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" syntax linting
Plug 'w0rp/ale'

" ctags management
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

" gutentags exclude
let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'log', 'vendor', 'temp', 'tmp', 'test']
let g:gutentags_cache_dir = '~/.vim/tags'

" use the silver searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" since we are using lightline.vim
set noshowmode
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_set_signs = 0
