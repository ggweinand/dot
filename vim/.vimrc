" designed for vim 8+

if has("eval") " vim-tiny detection
	let skip_defaults_vim = 1
endif

set nocompatible

"### Vi Compatible ###

" indent new lines
set autoindent

" write files when changing and multiple files open
set autowrite

" deactivate line numbers
set nonumber

" col and row position in bottom right
set ruler

" show command and insert mode
set showmode

set tabstop=2

"#####################

" disable visual bell
set t_vb=

let mapleader=" "

set softtabstop=2

set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
	set nofixendofline
	
	set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

	set foldmethod=manual
	set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

set textwidth=72

set norelativenumber

" default spell checking
" set spell

" disable spellcapcheck
set spc=

set nobackup
set noswapfile
set nowritebackup

set icon

set hlsearch
set incsearch
set linebreak

" avoid 'Hit Enter' messages
set shortmess=aoOtTI

" prevents truncaded yanks, deletes, etc.
set viminfo='20,<1000,s1000

" wrap around when searching
set wrapscan
set nowrap

" command history
set history=100

" set fast scrolling
set ttyfast

" sense filetype
filetype plugin on

" make j/k move between display lines in markdown
au FileType markdown, pandoc noremap j gj
au FileType markdown, pandoc noremap k gk

" ruler formatting
set ruf=%50(%=%#StatusLineNC#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" automatically install/update vim plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
if filereadable(expand("~/.vim/autoload/plug.vim"))
	call plug#begin('~/.local/share/vim/plugins')
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'rwxrob/vim-pandoc-syntax-simple'
	Plug 'joshdick/onedark.vim'
	Plug 'sheerun/vim-polyglot'
	call plug#end()

	" pandoc
	let g:pandoc#formatting#mode = 'h' " A'
	let g:pandoc#formatting#textwidth = 72
endif

" make Y consistent with D and C
map Y y$

" enable omni-completion
set omnifunc=syntaxcomplete#Complete

" force some files to specific file type
au bufnewfile, bufRead *.bash* set ft=bash
au bufnewfile, bufRead *.profile* set ft=sh
au bufnewfile, bufRead *.txt* set ft=text

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" set paste
set pastetoggle=<F3>
nmap <leader>2 :set paste<CR>i

" better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

" rename tmux window to file name
if exists('$TMUX')
	autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
	autocmd VimLeave * call system("tmux setw automatic-rename")
endif

" theme
let g:onedark_termcolors=16
if has("syntax")
	syntax enable
endif
colorscheme onedark
