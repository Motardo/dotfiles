set nocompatible
filetype indent plugin on
syntax on

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular'
Plug 'jelera/vim-javascript-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'Motardo/nim.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'skywind3000/asyncrun.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'wavded/vim-stylus'
Plug 'w0rp/ale'
call plug#end()"

set path+=**
set wildmenu
set showcmd
set hlsearch
set nomodeline
set nowrap

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=239 ctermfg=15
endif
set ignorecase
set smartcase
set nostartofline
set confirm
set visualbell
set cmdheight=2
set number
set notimeout

set t_Co=256
colorscheme xoria256
set cursorline

set shiftwidth=2
set expandtab
set tabstop=8

set backupcopy=yes

set grepprg=gr\ -nH
command! -nargs=+ Gr execute "silent" "grep!" shellescape("<args>") | copen 8

"------------------------------------------------------------
" Mappings

nnoremap , :
vnoremap , :

nnoremap : ,
vnoremap : ,

nnoremap \ %
vnoremap \ %

nnoremap Y y$

nnoremap zl $
nnoremap zh ^

" Quickfix list navigation
nnoremap gc :cclose<cr>
nnoremap go :copen<cr>
nnoremap g<Space> :cn<cr>
nnoremap gy :cp<cr>
nnoremap g. :cc<cr>
"g abclostyz./>
"z pquy./>,;:?

" Location list navigation
nnoremap zc :lcl<cr>
nnoremap zo :lop<cr>
nnoremap z<Space> :lne<cr>
nnoremap zy :lpr<cr>
nnoremap z. :ll<cr>

vnoremap . :norm.<cr>

nnoremap <C-L> :noh<cr>:redraw<cr>

" Insert mode mappings
"------------------------------------------------------------

noremap! jk <esc>
inoremap <C-F> <Esc>gUiw`]a
inoremap <C-L> <Esc>%%a

" Leader key mappings
"------------------------------------------------------------

let mapleader=" "
"let maplocalleader=" "

nnoremap <leader>P O<esc>"+P
nnoremap <leader>a :ALEToggle<cr>
nnoremap <leader>f :CtrlPBuffer<cr>
nnoremap <leader>j ddp
nnoremap <leader>k kddpk
nnoremap <leader>l :set nolist!<cr>
nnoremap <leader>n :set norelativenumber!<cr>
nnoremap <leader>p o<esc>"+p
nnoremap <leader>q :q<cr>
nnoremap <leader>w :write<cr>
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>x O// eslint-disable-next-line no-
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>; mqA;<esc>`q
nnoremap <leader><TAB> <C-^>

let NERDSpaceDelims=1

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
autocmd FileType netrw setl bufhidden=delete

let g:elm_syntastic_show_warnings = 1"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint', 'jshint', 'jscs']
let g:syntastic_haskell_checkers = ['hlint', 'hdevtools']
let g:syntastic_html_tidy_ignore_errors = ['unescaped &', 'lacks "action']
let g:syntastic_javascript_eslint_exe='$(which eslint)'
"------------------------------------------------------------

set wildignore+=node_modules,build,.git

highlight Normal ctermbg=None

let g:jsx_ext_required = 0
" Highlight ES6 template strings
"hi link javaScriptTemplateDelim String
"hi link javaScriptTemplateVar Text
"hi link javaScriptTemplateString String

let g:elm_format_autosave = 1

" Extended Text Objects
let s:items = [ "<bar>", "\\", "/", ":", ".", "*", "_" ]
for item in s:items
    exe "nnoremap yi".item." T".item."yt".item
    exe "nnoremap ya".item." F".item."yf".item
    exe "nnoremap ci".item." T".item."ct".item
    exe "nnoremap ca".item." F".item."cf".item
    exe "nnoremap di".item." T".item."dt".item
    exe "nnoremap da".item." F".item."df".item
    exe "nnoremap vi".item." T".item."vt".item
    exe "nnoremap va".item." F".item."vf".item
endfor

" == ale ==
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" == emmet ==
" let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" == syntastic ==

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" == supertab ==

let g:SuperTabDefaultCompletionType = "context"

" == deoplete ==
let g:deoplete#enable_at_startup = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" == tabular ==

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" == ctrl-p ==

"map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
