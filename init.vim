" Main options file

syntax on
filetype plugin indent on

set encoding=utf-8        " File encoding
set fileencoding=utf-8    " File encoding
set shiftwidth=4          " Number of auto-indent spaces
set tabstop=4             " Number of columns per tab
set softtabstop=4         " Number of spaces per Tab
set expandtab             " Use spaces instead of tabs
set autoindent            " Auto-indent new lines
set smartindent           " Enable smart-indent
set number                " Show line numbers
set relativenumber        " Enable relative line numbers
set smartcase             " Enable smart-case search
set ignorecase            " Always case-insensitive
set incsearch             " Searches for strings incrementally
set mouse=nv              " Enable mouse for normal and visual modes
set hidden                " Enable moving between unsaved buffers
set noshowmode            " Disable secondary mode bar
set clipboard=unnamedplus " Copy paste between vim and everything else
set pumheight=10          " Show max. 10 completions
set iskeyword+=-          " Treat dash separated words as a word text object
set conceallevel=0        " So that I can see `` in markdown files
set background=dark       " Tell vim what the background color looks like
set t_Co=256              " Support 256 colors
set autochdir             " Your working directory will always be the same as your 
                          "     working directory
set timeoutlen=500        " By default timeoutlen is 1000 ms (vim-which-key)
set laststatus=2
 
" Auto source when writing to init.vm (you can run :source $MYVIMRC)
au! BufWritePost $MYVIMRC source % 

" Set leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

" let g:doom_one_terminal_colors = v:true

call plug#begin()
    
    Plug 'tpope/vim-sensible'
    
    " Themes and window look 
    Plug 'flazz/vim-colorschemes'               " a lot of colorschemes
    Plug 'romgrk/barbar.nvim'                   " tab line
    Plug 'kyazdani42/nvim-web-devicons'         " icons for tabline
    Plug 'ryanoasis/vim-devicons'               " icons for all thing
    Plug 'itchyny/lightline.vim'                " status line
    Plug 'luochen1990/rainbow'                  " rainbow brackets
    Plug 'mhinz/vim-startify'

    " General plugins
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    Plug 'kyazdani42/nvim-tree.lua'             " better file tree

    " General text editing
    Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} " indenting indicator
    Plug 'jiangmiao/auto-pairs'                 " bracket pairs
    Plug 'tpope/vim-commentary'
    Plug 'easymotion/vim-easymotion'
    Plug 'sheerun/vim-polyglot'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'kevinhwang91/nvim-bqf'                " Better quickfix window

    " Wiki
    " Plug 'vimwiki/vimwiki' 

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language: Python
    " Plug 'psf/black', {'branch': 'stable'}
    " Plug 'zchee/deoplete-jedi'
    " Plug 'davidhalter/jedi-vim'
    " Plug 'python-rope/ropevim'
    
    " Language: C++
    Plug 'octol/vim-cpp-enhanced-highlight', {'on_ft': ['h', 'hpp' , 'c', 'cpp']}
    Plug 'rhysd/vim-clang-format',           {'on_ft': ['h', 'hpp' , 'c', 'cpp']}
    
    " Language: LaTeX
    Plug 'lervag/vimtex'
    
    " Language: Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()


if has('win32')
	source $HOME/AppData/Local/nvim/settings/options.vim
	source $HOME/AppData/Local/nvim/settings/which-key.vim
	source $HOME/AppData/Local/nvim/settings/statusline.vim
    source $HOME/AppData/Local/nvim/settings/theme.vim

    let g:python3_host_prog = 'C:\Python39\python.exe'
else
    source $HOME/.config/nvim/settings/options.vim
    source $HOME/.config/nvim/settings/which-key.vim
    source $HOME/.config/nvim/settings/statusline.vim
    source $HOME/.config/nvim/settings/theme.vim
endif

let g:rainbow_active = 1







