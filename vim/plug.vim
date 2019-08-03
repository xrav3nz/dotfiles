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
" {{{
  nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
  nnoremap <leader>F :Files<CR>
  nnoremap <leader>t :BTags<CR>
  nnoremap <leader>b :Buffer<CR>
" }}}


" search across all files
Plug 'mileszs/ack.vim'
" {{{
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
" }}}

" navigate files in a sidebar
Plug 'scrooloose/nerdtree'
" {{{
  nmap <leader>ne :NERDTreeToggle<cr>
" }}}

Plug 'tpope/vim-commentary'

" language/framework specific
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'

" full LSP support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{{
  let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver']
  nmap <leader>cn <Plug>(coc-diagnostic-next)
  nmap <leader>cf <Plug>(coc-fix-current)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
" }}}

" syntax linting
Plug 'w0rp/ale'
" {{{
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters_explicit = 1
  let g:ale_set_signs = 0

  nnoremap <leader>af :ALEFix<CR>
  nnoremap <leader>an :ALENextWrap<CR>
" }}}


" ctags management
Plug 'ludovicchabant/vim-gutentags'
" {{{
  let g:gutentags_ctags_exclude = ['.git', 'node_modules', 'log', 'vendor', 'temp', 'tmp', 'test']
  let g:gutentags_cache_dir = '~/.vim/tags'
" }}}

" navigate between tmux & vim with C-hjkl
Plug 'christoomey/vim-tmux-navigator'

" manipulate (), [], {}, etc easily
Plug 'tpope/vim-surround'

call plug#end()

let g:gruvbox_contrast_dark = "hard"
set background=dark
colorscheme gruvbox
