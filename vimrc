" PATHOGEN
execute pathogen#infect()
filetype plugin indent on

" COLORS
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" SPACE AND TABS
set tabstop=4                   "number of visual spaces per TAB
set softtabstop=4               "number of spaces in tab while editing
set shiftwidth=4                "reindent width
set expandtab                   "TAB are now spaces
set backspace=indent,eol,start  "Backspace through everything while in insert

" UI CONFIG
set showcmd             "display command in bottom bar
set cursorline          "hilight current line
set showmatch           "hilight matching [{()}]
set ruler               "displays limited minimal line numbering
set number              "displays line number
set visualbell          "disables the bell
set laststatus=2        "displays status bar
set lazyredraw          "redraws only when needed
set guioptions-=m       "hides the menu bar
set guioptions-=T       "hides the toolbar
set guioptions-=r       "hides the scrollbars

" SEARCH
set incsearch           "search as character are entered
set hlsearch            "highlight matches
set ignorecase          "case insensitive search
set smartcase

" GENERAL SETTINGS
let mapleader=","
set nocompatible
set title
set scrolloff=10
set encoding=utf-8 nobomb
set wildmenu
set wildmode=list:longest,full
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undolevels=100
if exists("&undodir")
    set undodir=~/.vim/undo
    set undofile
    set undoreload=50
endif

" MAPPINGS
noremap <leader>ss :StripWhitespace<CR>
noremap <leader>= ggvG=

noremap <leader>- o<esc>k
noremap <leader>_ O<esc>j

inoremap <leader><leader> <ESC>
vnoremap <leader><leader> <ESC>
