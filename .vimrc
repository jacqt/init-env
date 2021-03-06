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
" Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/deoplete.nvim'
Plugin 'w0rp/ale'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'Shougo/vimproc.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'mindriot101/vim-tslime-input'

Plugin 'vim-scripts/kwbdi.vim'
Plugin 'tpope/vim-surround'

Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/echodoc.vim'

" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-session'
" Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
Plugin 'joeytwiddle/sexy_scroller.vim'

" Plugin 'wincent/Command-T'
" Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'jiangmiao/auto-pairs'

""" ELIXIR
Plugin 'elixir-lang/vim-elixir'

""" RUBY
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

""" TS / TSX / JS / JSX
Plugin 'mhartington/nvim-typescript'
" Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mxw/vim-jsx'
" Plugin 'pangloss/vim-javascript'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'jason0x43/vim-js-indent'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'alvan/vim-closetag'

""" CLOJURE / CLOJURESCRIPT / COMMON LISP
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'

" Plugin 'neoclide/vim-jsx-improve'
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
set foldmethod=indent
set foldnestmax=3
set foldlevel=1
set nonumber
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



autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
autocmd BufWinEnter,Winenter * set nolazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Settings for neovim terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au TermOpen * setlocal nonumber norelativenumber

" Remap navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Map Ctrl+] to escape
tnoremap <C-[> <C-\><C-n>
" When entering a terminal, go into insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

tnoremap <C-p> <C-\><C-n>pi
tnoremap <C-n> <C-\><C-n>:rightb vsplit<CR><C-\><C-n>:terminal<CR>
nnoremap <C-n> :rightb vsplit<CR><C-l>:terminal<CR>:startinsert<CR>

nnoremap <C-A-n> :botright split<CR><C-l>:terminal<CR>:startinsert<CR>
tnoremap <C-A-n> <C-\><C-n>:split<CR><C-\><C-n>:terminal<CR>:startinsert<CR>

" Stop neovim from closing terminals after :q
autocmd TermOpen * set bufhidden=hide

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Abbrevations
iab teh the
iab cl console.log
iab im import

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

" Webpack
set backupcopy=yes

"" Underline the current line when in insert mode
" :autocmd InsertEnter,InsertLeave * set cul!

"" Shortcuts for writing, quitting, and copying, and tabs
nnoremap <leader>w :w<cr>
map <unique> <Leader>q <Plug>Kwbd
nnoremap <leader>c :%y+<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>x :q!<cr>
nnoremap <leader>v :vs<cr>
nnoremap <leader>i :sp<cr>
nnoremap <leader>pr :file term:///.//repl<cr>
nnoremap <leader>pt :file term:///.//terminal<cr>
nnoremap gn gt
nnoremap gp gT

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
      \ ['-H', '--nopager', '--nocolor', '--nogroup', '--column', '--ignore-dir', '.happypack', '--ignore-dir', 'dist'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('grep', 'matchers', ['matcher_fuzzy'])

nnoremap <C-p> :DeniteProjectDir file_rec<cr>
nnoremap <leader>g :DeniteProjectDir grep<cr>
nnoremap <leader>f :DeniteProjectDir grep:::<C-R><C-w><CR>
nnoremap <leader>s :Denite buffer<cr>

"""""""""""""""""""""""""""""""""""""""""""

""" Settings for tslime.vim
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1


""" Settings for gitgutter
" set updatetime=250


""" Settings for vim-jsx
let g:jsx_ext_required = 0

""" Settings to make editing ruby files faster
set norelativenumber
set re=1
set ttyfast
set nolazyredraw


nnoremap <C-6> <C-S-^>

""" Color schemes
"color twilight
"color oceandeep
"color sorcerer
"color molokai
"color wombat256
"color moria
"color bclear
" color wombat256mod
" color darkblue
let g:gruvbox_contrast_dark='hard'
color gruvbox
set background=dark
highlight Normal ctermbg=none

""" Clojure specific settings
let g:paredit_shortmaps=0
"let g:clojure_foldwords ="def,ns"
let g:rainbow_active = 1
autocmd FileType clojure nnoremap <leader>r :Require!<cr>
autocmd FileType clojure nnoremap <leader>e :Tmux (run-test)<cr>
autocmd FileType clojure nnoremap <leader>re :Require <bar> :Tmux (run-test)<cr>

" react-native 
" autocmd FileType javascript nnoremap <leader>r :! $HOME/github/venmo_app/scripts/android_reload.sh<cr>
" autocmd FileType javascript nnoremap <leader>re :! $HOME/github/venmo_app/scripts/android_menu.sh<cr>

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
" Asynchronous Lint Engine (ALE)

" Don't run linters so aggressively
let g:ale_lint_delay = 1000
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tsserver', 'tslint'],
\}
let g:ale_typescript_tslint_config_path = '/home/anthony/github/hammerhead/tslint.json'
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '⚠️' " could use emoji
highlight ALEErrorSign ctermbg=none ctermfg=red
highlight SignColumn ctermbg=none
highlight ALEError ctermfg=red ctermbg=none cterm=underline


let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" do not lint node_modules :)
let g:ale_pattern_options = {
\   '.*node_modules/.*\.ts$': {'ale_enabled': 0},
\   '.*node_modules/.*\.tsx$': {'ale_enabled': 0},
\}
"""""""""""""""""""""""""""""""""""""""""""

let g:javascript_plugin_flow = 1
nnoremap <leader>k :TSType<cr>
nnoremap <leader>j :TSDef<cr>
nnoremap <leader>d :TSDefPreview<cr>
nnoremap <leader>ar :TSRename<cr>
nnoremap <leader>ai :TSImport<cr>
nnoremap <leader>ad :JsDoc<cr>

let g:flow#enable = 0
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

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
" let g:deoplete#keyword_patterns.typescript = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.clojure = '/'

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
 " For no inserting <CR> key.
 return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"

" Use deoplete.
let g:tern_request_timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

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
set t_Co=256
