" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')

" gruvbox color scheme
Plug 'morhetz/gruvbox', Cond(!exists('g:vscode'))

" powerful fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', Cond(!exists('g:vscode'))
Plug 'jesseleite/vim-agriculture', Cond(!exists('g:vscode'))
if exists('g:vscode')
  nnoremap <leader>f <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
  nnoremap <leader>b <Cmd>call VSCodeNotify("workbench.action.showAllEditors")<CR>
else
  nnoremap <expr> <leader>f (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
  nnoremap <leader>F :Files<CR>
  nnoremap <leader>t :BTags<CR>
  nnoremap <leader>b :Buffer<CR>
endif

" navigate files in a sidebar
Plug 'scrooloose/nerdtree', Cond(!exists('g:vscode'))
if !exists('g:vscode')
  nmap <leader>ne :NERDTreeToggle<cr>
endif

" full LSP support
Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})
if !exists('g:vscode')
  let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver']
  nmap <leader>cn <Plug>(coc-diagnostic-next)
  nmap <leader>cf <Plug>(coc-fix-current)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
endif

" syntax linting
Plug 'w0rp/ale', Cond(!exists('g:vscode'), {'branch': 'release'})
if exists('g:vscode')
  nnoremap <leader>af <Cmd>call VSCodeCall('editor.action.formatDocument')<CR>
  nnoremap <leader>an <Cmd>call VSCodeCall('editor.action.marker.next')<CR>
else
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_linters_explicit = 1
  let g:ale_set_signs = 0

  nnoremap <leader>af :ALEFix<CR>
  nnoremap <leader>an :ALENextWrap<CR>
endif


Plug 'tpope/vim-commentary', Cond(!exists('g:vscode'))
if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif

" language/framework specific
Plug 'jiangmiao/auto-pairs', Cond(!exists('g:vscode'))
Plug 'pangloss/vim-javascript', Cond(!exists('g:vscode'))
Plug 'vim-ruby/vim-ruby', Cond(!exists('g:vscode'))
Plug 'tpope/vim-rails', Cond(!exists('g:vscode'))
Plug 'tpope/vim-endwise', Cond(!exists('g:vscode'))
Plug 'cakebaker/scss-syntax.vim', Cond(!exists('g:vscode'))
Plug 'HerringtonDarkholme/yats.vim', Cond(!exists('g:vscode'))
Plug 'mustache/vim-mustache-handlebars', Cond(!exists('g:vscode'))
Plug 'maxmellon/vim-jsx-pretty', Cond(!exists('g:vscode'))
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mattn/emmet-vim', Cond(!exists('g:vscode'))
Plug 'google/vim-jsonnet', Cond(!exists('g:vscode'))
" {{{
  let g:ruby_indent_assignment_style = 'variable'
  let g:ruby_indent_hanging_elements = 0
" }}}
if exists('g:vscode')
  nmap <leader>rt <Cmd>call VSCodeNotify('rails-navim.openAlternateFile')<CR>
endif

Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'), {'do': ':TSUpdate'})
Plug 'nvim-lua/plenary.nvim', Cond(!exists('g:vscode'))
Plug 'nvim-telescope/telescope-fzf-native.nvim', Cond(!exists('g:vscode'), { 'do': 'make' })
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'), { 'tag': '0.1.8' })
Plug 'nvim-telescope/telescope-live-grep-args.nvim', Cond(!exists('g:vscode'))
if exists('g:vscode')
  nnoremap <leader>/ <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
else
  nnoremap <leader>/ :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
endif


" navigate between tmux & vim with C-hjkl
Plug 'christoomey/vim-tmux-navigator', Cond(!exists('g:vscode'))
if exists('g:vscode')
  nnoremap <silent> <c-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
  nnoremap <silent> <c-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
  nnoremap <silent> <c-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
  nnoremap <silent> <c-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>
endif

" manipulate (), [], {}, etc easily
Plug 'tpope/vim-surround'

Plug 'tpope/vim-unimpaired'

" unix helpers
Plug 'tpope/vim-eunuch'

Plug 'ojroques/vim-oscyank', {'branch': 'main'}
if exists('g:vscode')
  vnoremap  <leader>y  "+y
  nnoremap  <leader>yy  "+y_
  nnoremap  <leader>y  "+y
else
  nmap <leader>y <Plug>OSCYankOperator
  nmap <leader>yy <leader>y_
  vmap <leader>y <Plug>OSCYankVisual
endif

call plug#end()

if !exists("g:vscode")
  let g:gruvbox_contrast_dark = "hard"
  let g:gruvbox_contrast_light = "soft"
  set background=dark
  colorscheme gruvbox
endif
