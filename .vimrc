filetype indent on
set ai
set incsearch
set confirm
set number
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=Green
set paste
vnoremap <C-c> "+y
syntax on
set cursorline
set cursorcolumn
set tabstop=4       " A tab character is represented as 4 spaces
set shiftwidth=4    " Indentation level is 4 spaces
set expandtab       " Convert tabs to spaces
set softtabstop=4   " Tab and Backspace key treat tabs as 4 spaces
set showmatch

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'

  Plug 'preservim/nerdtree'

call plug#end()

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
