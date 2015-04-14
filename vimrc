" PATHOGEN
execute pathogen#infect()
filetype plugin indent on

" COLORS
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" GENERAL SETTINGS
set nocompatible
set title
set scrolloff=10
set encoding=utf-8 nobomb
set listchars=tab:▸\ ,eol:¬
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

" SPACE AND TABS
set tabstop=4                   "number of visual spaces per TAB
set softtabstop=4               "number of spaces in tab while editing
set shiftwidth=4                "reindent width
set expandtab                   "TAB are now spaces
set backspace=indent,eol,start  "Backspace through everything while in insert

" SEARCH
set incsearch           "search as character are entered
set hlsearch            "highlight matches
set ignorecase          "case insensitive search
set smartcase

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

" STATUS LINE CONFIG
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" FILE EXPLORER CONFIG
let g:netrw_banner = 0
let s:netrw_up = maparg('-', 'n')
let g:netrw_list_hide = netrw_gitignore#Hide() . ',^\.\.\=/\=$'
let g:netrw_sort_sequence = '[\/]$,*,\%(' . join(map(split(&suffixes, ','), 'escape(v:val, ".*$~")'), '\|') . '\)[*@]\=$'')'

" CTRLP CONFIG
let g:ctrlp_working_path_mode = 'c'

" GOLANG SYNTAX HIGHTLIGHTING
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" MAPPINGS
let mapleader = ','
let g:user_emmet_leader_key = '<C-Z>'"

noremap <leader>ss :StripWhitespace<CR>
function! Reindent()
    let save_cursor = getpos(".")
    :normal gg=G'.
    call setpos('.', save_cursor)
endfunction
noremap <leader>= :call Reindent()<CR>
noremap <leader>- o<esc>k
noremap <leader>_ O<esc>j

noremap [t :bp<CR>
noremap ]t :bn<CR>
noremap <leader>t :enew<CR>
noremap <leader>q :bd<CR>
noremap <leader><CR> :!<Space>
noremap <leader><Tab> <C-W>w
noremap <leader>/ :Ack<Space>

inoremap <leader><leader> <ESC>
vnoremap <leader><leader> <ESC>
