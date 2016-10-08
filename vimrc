set nocompatible
filetype indent plugin on
syntax on

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elmcast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()"

set showcmd " Show partial commands in the last line of the screen
set hlsearch
set nomodeline
"set statusline=%<%f\ %h%m%r%n%=%-14.(%l,%c%V%)\ %P
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

set shiftwidth=4
set tabstop=4

"------------------------------------------------------------
" Mappings

nnoremap , :
vnoremap , :

nnoremap : ,
vnoremap : ,

nnoremap % \
vnoremap % \

nnoremap Y y$

nnoremap zl $
nnoremap zh ^

nnoremap zc :lcl<cr>
nnoremap zo :lop<cr>
nnoremap zn :lne<cr>
nnoremap zp :lpr<cr>

vnoremap . :norm.<cr>

" Insert mode mappings
"------------------------------------------------------------

noremap! jk <esc>
noremap! <C-F> <Esc>gUiw`]a
inoremap <C-L> <Esc>%%a

" Leader key mappings
"------------------------------------------------------------

let mapleader=" "
"let maplocalleader=" "

nnoremap <leader>P "+P
nnoremap <leader>f :buffers<CR>:buffer<space>
nnoremap <leader>j ddp
nnoremap <leader>k kddpk
nnoremap <leader>l :set nolist!<cr>
nnoremap <leader>n :set norelativenumber!<cr>
nnoremap <leader>p o<esc>"+p
nnoremap <leader>q :q<cr>
nnoremap <leader>s <esc>:write<cr>
nnoremap <leader>ve :e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

"nnoremap <Leader>m	:call ElmMake()<cr> "Compile the current buffer.
"nnoremap <Leader>b	:call ElmMakeMain()<cr> "Compile the Main.elm file in the project.
"nnoremap <Leader>r	:call ElmRepl()<cr> "Opens an elm repl in a subprocess.
"nnoremap <Leader>e	:call ElmErrorDetail()<cr> "Shows the detail of the current error or warning.
"nnoremap <Leader>d	:call ElmShowDocs()<cr> "Shows the type and docs for the word under the cursor.
"nnoremap <Leader>w	:call ElmBrowseDocs()<cr> "Opens the docs web page for the word under the cursor.
au FileType elm nmap <leader>m <Plug>(elm-make)
au FileType elm nmap <leader>b <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_preview=1
autocmd FileType netrw setl bufhidden=delete

" Syntastic status line message
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Automaticaly open :Errors split
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_html_tidy_ignore_errors = ['unescaped &', 'lacks "action']
"------------------------------------------------------------

set wildignore+=node_modules
set wildignore+=public/lib

let g:ycm_key_detailed_diagnostics = ''
let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1

highlight Normal ctermbg=None

"let g:elm_browser_command = ''
"let g:elm_setup_keybindings = 1
let g:elm_format_autosave = 1
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

