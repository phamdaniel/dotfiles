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
set expandtab                   "TAB are now spaces
set backspace=indent,eol,start  "Backspace through eveyinthing while in insert

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

