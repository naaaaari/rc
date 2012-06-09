"---------------------------------------------------------------------
" base settings
"---------------------------------------------------------------------
set title
set ruler

syntax on
set nocompatible               " be iMproved
filetype plugin indent on

set rtp+=~/.vim/vundle/
call vundle#rc()

"from Github
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/unite.vim'
"Bundle 'tpope/vim-surround'

"from vim-script

Bundle 'vim-scripts/css_color.vim'
Bundle 'vim-scripts/sudo.vim'
Bundle 'vim-scripts/VimClojure'


set autoread

set splitbelow
set splitright

set autoindent
set smartindent

set hlsearch
set nowrapscan
set showmatch
set showmode

set expandtab
set tabstop=4
set shiftwidth=4

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set browsedir=buffer

set laststatus=2
set showcmd

set wildmode=list,full


set fileencodings=utf8,iso-2022-jp,cp932,euc-jp


set t_Co=256

"set cursorline
"highlight  cursorline cterm=NONE ctermbg=17  ctermfg=none guibg=Grey90 guifg=white

set clipboard=unnamed,autoselect
set incsearch
set smartindent
set smarttab

if exists('&ambiwidth')
  set ambiwidth=double
endif

highlight Pmenu ctermbg=4

"swp files
set directory-=.

"backup files
set backup
set backupdir=/tmp

"show special character
set list
set lcs=tab:>-,trail:_,extends:>,precedes:<

scriptencoding utf-8
"augroup highlightIdegraphicSpace
"    autocmd!
"    autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

"colorscheme
"colorscheme wombat256
colorscheme desert

" remove autocomment
autocmd FileType * set formatoptions-=ro

" for perl files
"autocmd BufNewFile,BufRead *.psgi set filetype=perl
"autocmd BufNewFile,BufRead *.t set filetype=perl



"---------------------------------------------------------------------
" Key mappings
"---------------------------------------------------------------------

" mapleader
let mapleader = ","

" for scratch
nnoremap <Leader>s :Scratch<CR>

" for basics
nnoremap <Space>w :<C-u>write<CR>
nnoremap <Space>q :<C-u>quit<CR>
nnoremap <Space>a :<C-u>wqall<CR>

nnoremap <Space>v :<C-u>tabnew ~/.vimrc<CR>
nnoremap <Space>s :<C-u>source ~/.vimrc<CR>

nnoremap <Space>zz :<C-u>tabnew ~/.zshrc<CR>
nnoremap <Space>ze :<C-u>tabnew ~/.zshenv<CR>
nnoremap <Space>za :<C-u>tabnew ~/.zshalias<CR>

nnoremap <Space>zlz :<C-u>tabnew ~/.zshrc.local<CR>
nnoremap <Space>zle :<C-u>tabnew ~/.zshenv.local<CR>
nnoremap <Space>zla :<C-u>tabnew ~/.zshalias.local<CR>

nnoremap <Space>e :e ++enc=utf-8<CR> :set encoding=utf-8<CR> :w<CR>

nnoremap <Space>] <C-w>]

" for command line
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" for perl
inoremap <C-d> $
inoremap <C-a> @
inoremap <C-p> <C-x><C-o>

" for others
vnoremap < <gv
vnoremap > >gv


" expand path
cmap <C-x> <C-r>=expand('%:p:h')<CR>/
" expand file (not ext)
cmap <C-z> <C-r>=expand('%:p:r')<CR>

" for alc
nnoremap <Leader>a <Esc>:Ref alc<Space>

" for perldoc
nnoremap <Leader>p <Esc>:Ref perldoc<Space>


" expand path

" add \n
nnoremap U :<C-u>call append(expand('.'), '')<Cr>j

" replace Y
nnoremap Y y$

"yank and paste clipboard
if !has('gui')
  nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
  vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r !pbpaste<CR>
  vnoremap <silent> <Space>p :r !pbpaste<CR>
else
  " GVim(Mac & Win)
  noremap <Space>y "+y<CR>
  noremap <Space>p "+p<CR>
endif

"repeat command
nnoremap c. q:k<Cr>

"no search offset
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

"substitute word under cursor
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

"replace word under cursor with yanked string
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

"tabnew with gf
nnoremap gf <C-w>gf




"カーソル一文字単位移動
inoremap <silent> <C-s> <Left>
inoremap <silent> <C-d> <Right>

"単語単位移動（行末で止めたい場合）
inoremap <silent> <C-f> <S-Left>
inoremap <silent> <C-b> <S-Right>



inoremap jj <Esc>
inoremap .. ->

"---------------------------------------------------------------------
" for neocomplcache
"---------------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'perl' : $HOME . '/.vim/dict/perl.dict',
    \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    \ 'html' : $HOME . '/.vim/dict/javascript.dict',
    \ 'scala' : $HOME . '/.vim/dict/scala.dict'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir = "~/.vim/snippets"

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> pumvisible() ? neocomplcache#close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#close_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
inoremap <expr><C-h> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>"
inoremap <expr><BS> pumvisible() ? neocomplcache#cancel_popup()."\<C-h>" : "\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete


