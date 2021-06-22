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
Plug 'tpope/vim-endwise'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/emmet-vim'
" {{{
  let g:ruby_indent_assignment_style = 'variable'
" }}}

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
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters_explicit = 1
  let g:ale_set_signs = 0

  nnoremap <leader>af :ALEFix<CR>
  nnoremap <leader>an :ALENextWrap<CR>
" }}}


" navigate between tmux & vim with C-hjkl
Plug 'christoomey/vim-tmux-navigator'

" manipulate (), [], {}, etc easily
Plug 'tpope/vim-surround'

Plug 'tpope/vim-unimpaired'

" unix helpers
Plug 'tpope/vim-eunuch'

Plug 'ojroques/vim-oscyank'
nnoremap <leader>yy "+yy <bar> :OSCYankReg " <CR>
nnoremap <leader>y :set operatorfunc=OSCYankOperator<cr>g@
vnoremap <leader>y :<c-u>call OSCYankOperator(visualmode())<cr>
function! OSCYankOperator(type)
 if a:type ==? 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  endif

  call YankOSC52(getreg('@'))
endfunction

call plug#end()

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
set background=dark
colorscheme gruvbox
