" Settings *******************************************************************

" Auto source when writing to init.vm (you can run :source $MYVIMRC)
au! BufWritePost $MYVIMRC source %      

" General settings and editing -----------------------------------------------
syntax enable        " Enables syntax highlighing
set hidden           " Required to keep multiple buffers open multiple buffers
"set wrap            " Wrap lines
set textwidth=80
set colorcolumn=+1   " Highlight column after 'textwidth'
set encoding=utf-8   " The encoding displayed
set cmdheight=2      " More space for displaying messages
set iskeyword+=-     " treat dash separated words as a word text object"
set mouse=a          " Enable your mouse
set splitbelow       " Horizontal splits will automatically be below
set splitright       " Vertical splits will automatically be to the right
set t_Co=256         " Support 256 colors
set conceallevel=0   " So that I can see `` in markdown files
set tabstop=2        " Insert 2 spaces for a tab

" Change the number of space characters inserted for indentation
set shiftwidth=2     

set smarttab         " Makes tabbing smarter will realize you have 2 vs 4
set expandtab        " Converts tabs to spaces
set smartindent      " Makes indenting smart
set autoindent       " Good auto indent
set number           " Line numbers
set background=dark  " Tell vim what the background color looks like
"set showtabline=2   " Always show tabs
set updatetime=300   " Faster completion
set timeoutlen=1000  " By default timeoutlen is 1000 ms

"Stop newline continution of comments
set formatoptions-=cro

" Copy paste between vim and everything else
set clipboard=unnamedplus

" Color and scheme
colorscheme dracula

" Gui specific settings
set guifont=FiraCode\ Nerd\ Font\ Regular\ 11

" Formating for C++
