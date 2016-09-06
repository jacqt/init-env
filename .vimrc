""" Begun Vundle Section
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"Plugin 'lambdatoast/elm.vim'

""" UTILS
"Plugin 'scrooloose/syntastic'
"Plugin 'Yggdroot/indentLine'
" Plugin 'Valloric/MatchTagAlways'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'neomake/neomake'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
Plugin 'tpope/vim-obsession'

" Plugin 'wincent/Command-T'
" Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jiangmiao/auto-pairs'

""" ELIXIR
Plugin 'elixir-lang/vim-elixir'

""" RUBY
" Plugin 'tpope/vim-rails'
" Plugin 'vim-ruby/vim-ruby'

""" JS / JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

""" CLOJURE / CLOJURESCRIPT / COMMON LISP
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
"Plugin 'vim-scripts/VimClojure'
"Plugin 'vim-scripts/cljfold.vim'
"Plugin 'kovisoft/slimv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" End Vundle Section
""""""""""

""" Generic useful settings
set hlsearch
set autochdir
set foldmethod=syntax
set foldnestmax=3
set foldlevel=1
set number
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set ff=unix
let mapleader = " "
filetype plugin on
syntax on
set nocp

""" Settings for vim-jsx
let g:jsx_ext_required = 0

""" Settings to make editing ruby files faster
set norelativenumber
set re=1

""" Customize gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right scroll bar
set guioptions-=L  "remove left scroll bar
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

""  Tmux navigation
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window vim-%")

"" Underline the current line when in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

nnoremap <C-6> <C-S-^>

""" Color schemes
"color twilight
"color oceandeep
"color sorcerer
"color molokai
"color wombat256
"color moria
"color bclear
color wombat256mod
" color darkblue

""" Clojure specific settings
let g:paredit_shortmaps=0
"let g:clojure_foldwords ="def,ns"
let g:rainbow_active = 1

""" Python specific settings
autocmd FileType python nnoremap \re : call RunPython()<cr>
autocmd FileType python iab ## #############################################################
autocmd FileType python set foldmethod=indent
autocmd FileType python nnoremap <space> za
autocmd FileType python vnoremap <space> zf
function RunPython()
  rightbelow 8 new | r!python #
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfunction

""" Linting
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']


""" Auto pair setting
let g:AutoPairsCenterLine=0

" Deocomplete settings
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
 let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
let g:deoplete#omni#input_patterns.clojure = '/'

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
 return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
 " For no inserting <CR> key.
 "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""" Ctags setting
" map <ctrl>+F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags
set tags+=~/.vim/ctags/stl
set tags+=$HOME/vimfiles/ctags/stl


""" Useful commands
" put this in your ~/.vimrc file and :source ~/.vimrc
" then you can do: Dos2Unix
" dos2unix ^M
fun! Dos2unixFunction()
  let _s=@/
  let l = line(".")
  let c = col(".")
  try
    set ff=unix
    w!
    "%s/\%x0d$//e
  catch /E32:/
    echo "Sorry, first save the file."
  endtry
  let @/=_s
  call cursor(l, c)
endfun
com! Dos2Unix keepjumps call Dos2unixFunction()

" Redirect output to new tab
function! TM(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TM call TM(<q-args>)
"
set backspace=indent,eol,start

"To set the fonts right
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

set timeoutlen=1000 ttimeoutlen=0

" Customize the tabline
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')

    let s .= '%' . tabnr . 'T'
    let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tabnr

    let n = tabpagewinnr(tabnr,'$')
    if n > 1 | let s .= ':' . n | endif

    let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '

    let bufmodified = getbufvar(bufnr, "&mod")
    if bufmodified | let s .= '+ ' | endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MyTabLine()

set mouse=
set shell=/bin/bash

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
