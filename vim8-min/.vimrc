" --------------------
" .vimrc configuration file
" Minimal variant for clusters
" Alexander Chadwick
" alexander.chadwick@northwestern.edu

set nocompatible

" --------------------
"  Begin!

" --------------------
"  Basic configurations
filetype on
filetype indent on
filetype plugin on
let fortran_free_source=1
syntax on
set title
set ruler
set nowrap
set wrapmargin=0
set hidden
set tabstop=2
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set number
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set expandtab
set hlsearch
set incsearch
set tw=0
set noswapfile
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells
set nobackup

let fortran_do_enddo=1

" --------------------
"  Graphics configuration
" Speed up vim graphics a bit
set lazyredraw
set ttyfast

" Disable background colors
set t_ut=

" --------------------
" Enable mouse support
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" --------------------
"  Define settings for "smart" home key function. Goes to bol on first press,
"  otherwise it goes to the first column
function ExtendedHome()
	let column = col('.')
	normal! ^
	if column == col('.')
		normal! 0
	endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

" --------------------
"  Configure keys for convenience toggles

"Toggles to cycle open buffers
map <F9> :bnext<CR>
map <F7> :bprevious<CR>

"Toggle for paste mode
set pastetoggle=<F2>

"Toggle for line numbers
nnoremap <F4> :set nonumber!<CR>

"Toggle key to highlight lines past 132 characters
nnoremap <F3> :/\%>132v.\+<CR>

"Toggle key to clear all highlighting and the search pattern
nnoremap <M-F3> :let @/ = ""<CR>
