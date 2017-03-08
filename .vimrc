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
Plugin 'Valloric/MatchTagAlways'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/deoplete.nvim'
Plugin 'carlitux/deoplete-ternjs'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'neomake/neomake'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jgdavey/tslime.vim'
Plugin 'mindriot101/vim-tslime-input'

"
Plugin 'Shougo/denite.nvim'

" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
" Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'

" Plugin 'wincent/Command-T'
" Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jiangmiao/auto-pairs'

""" ELIXIR
Plugin 'elixir-lang/vim-elixir'

""" RUBY
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

""" JS / JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'


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
set incsearch
set smartcase
set autochdir
set foldmethod=manual
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
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set scrolloff=1
set sidescrolloff=5
set statusline=%{fugitive#statusline()}\ %f

" Webpack
set backupcopy=yes

"" Underline the current line when in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

"" Shortcuts for writing, quitting, and copying, and tabs
nnoremap <leader>w :w<cr>
nnoremap <leader>q :wq<cr>
nnoremap <leader>c :%y+<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>x :q!<cr>
nnoremap <leader>d :JsDoc<cr>
nnoremap gj gt
nnoremap gh gT

"""""""""""""""""""""""""""""""""""""""""""
""" Settings for Denite.vim
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file_rec', 'min_cache_files', 1000)
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])

" call denite#custom#var('grep', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#var('grep', 'command', ['ack'])

" Ack command on grep source
call denite#custom#var('grep', 'command', ['ack'])
call denite#custom#var('grep', 'default_opts',
      \ ['-H', '--nopager', '--nocolor', '--nogroup', '--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('grep', 'matchers', ['matcher_fuzzy'])

nnoremap <C-p> :DeniteProjectDir file_rec<cr>
nnoremap <leader>g :DeniteProjectDir grep<cr>
nnoremap <leader>f :DeniteProjectDir grep:::<C-R><C-w><CR>
nnoremap <leader>s :Denite buffer<cr>
nnoremap <leader>j :Denite jump<CR>

"""""""""""""""""""""""""""""""""""""""""""

""" Settings for tslime.vim
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1


""" Settings for gitgutter
set updatetime=250


""" Settings for vim-jsx
let g:jsx_ext_required = 0

""" Settings to make editing ruby files faster
set norelativenumber
set re=1
set ttyfast
set lazyredraw


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
autocmd FileType clojure nnoremap <leader>r :Require!<cr>
autocmd FileType clojure nnoremap <leader>e :Tmux (run-test)<cr>
autocmd FileType clojure nnoremap <leader>re :Require <bar> :Tmux (run-test)<cr>

" react-native 
autocmd FileType javascript nnoremap <leader>r :! $HOME/github/venmo_app/scripts/android_reload.sh<cr>
autocmd FileType javascript nnoremap <leader>re :! $HOME/github/venmo_app/scripts/android_menu.sh<cr>

""" Python specific settings
autocmd FileType python nnoremap <leader>r : call RunPython()<cr>
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

"""""""""""""""""""""""""""""""""""""""""""
""" Linting
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_enabled_makers = ['eslint']
  let b:neomake_jsx_enabled_makers = ['eslint']
  let b:neomake_jsx_eslint_exe = l:eslint
  let b:neomake_javascript_eslint_exe = l:eslint

endfunction
autocmd FileType javascript :call NeomakeESlintChecker()

"""""""""""""""""""""""""""""""""""""""""""

""" Auto pair setting
let g:AutoPairsCenterLine=0

"""""""""""""""""""""""""""""""""""""""""""
" Deocomplete settings
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
 let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
let g:deoplete#omni#input_patterns.clojure = '/'

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" <CR>: close popup and save indent.

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
 " For no inserting <CR> key.
 return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"


" Use deoplete.
let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
""" Ctags setting
" map <ctrl>+F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags
set tags+=~/.vim/ctags/stl
set tags+=$HOME/vimfiles/ctags/stl
"""""""""""""""""""""""""""""""""""""""""""


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

set mouse-=a
set shell=/bin/bash

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"""""""""""""""""""""""""""""""""""""""""""
""" Customize gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right scroll bar
set guioptions-=L  "remove left scroll bar
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

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
"""""""""""""""""""""""""""""""""""""""""""
