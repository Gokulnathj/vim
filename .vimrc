" Basic settings
filetype indent on         " Enable filetype-based indentation
set ai                     " Enable auto-indentation
set incsearch              " Incremental search
set confirm                " Confirm before overwriting files
set ignorecase             " Ignore case in search
set smartcase              " Use case-sensitive search if pattern has uppercase letters
set wildmenu               " Enhanced command-line completion
set wildmode=list:longest,full  " Wildmenu completion settings
set hlsearch               " Highlight search results
hi Search ctermbg=White    " Set background color for search results
hi Search ctermfg=Green    " Set foreground color for search results
set paste                  " Enable paste mode
set number                 " Show line numbers
set cursorline             " Highlight the current line
set tabstop=4              " A tab character is represented as 4 spaces
set shiftwidth=4           " Indentation level is 4 spaces
set expandtab              " Convert tabs to spaces
set softtabstop=4          " Tab and Backspace key treat tabs as 4 spaces
set showmatch              " Highlight matching parentheses and brackets

" Clipboard
vnoremap <C-c> "+y         " Copy selected text to system clipboard

" Syntax highlighting
syntax on                 " Enable syntax highlighting

" Plugins Configuration
call plug#begin('~/.vim/plugged')

  " Linting and syntax checking plugin
  Plug 'dense-analysis/ale'

  " NERDTree for file navigation
  Plug 'preservim/nerdtree'

call plug#end()

" Status line configuration
set statusline=            " Clear the status line on startup
set statusline+=\ %F\ %M\ %Y\ %R   " File info on the left side of the status line
set statusline+=%=                " Divider between left and right side
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%  " Right side status line
set laststatus=2           " Always show status line

" Keybindings
nnoremap <Leader>n :NERDTreeToggle<CR> " Toggle NERDTree with <Leader>n
nnoremap <C-w><C-w> :wincmd p<CR>      " Switch between windows with Ctrl-w w

" Auto Commands (autocmd)

" Auto open NERDTree when Vim starts, even if a file is specified
autocmd vimenter * NERDTree | wincmd p

" Close NERDTree automatically when all buffers are closed
autocmd BufEnter * if (winnr('$') == 1 && &filetype == 'nerdtree') | quit | endif

" Make sure the cursor is on the file, not NERDTree (when opening a file)
autocmd BufEnter * if exists('t:NERDTree') && winbufnr(0) != bufnr('NERDTree') | wincmd p | endif

" Return to the last edit position when opening files
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |

" Disable mouse support for more efficient navigation and selection
set mouse=

" Disable line numbers in NERDTree window for cleaner UI
autocmd FileType nerdtree setlocal nonumber

" Yank to both the Vim buffer and macOS clipboard for all motions
nnoremap y "+y
vnoremap y "+y
