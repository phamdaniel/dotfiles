" PATHOGEN
execute pathogen#infect()
filetype plugin indent on

" COLORS
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" GENERAL SETTINGS
set nocompatible                "disable vi compatible mode
set title                       "include filename in title bar
set autoread                    "reload the file if it was changed elsewhere
set scrolloff=10                "scroll 10 lines before the window border
set encoding=utf-8 nobomb       "use UTF-8 without BOM
set listchars=tab:▸\ ,eol:¬     "define invisible charcters
set foldmethod=syntax           "allow folding
set foldnestmax=3               "max folding depth
set nofoldenable                "don't fold by default
set backupdir=~/.vim/backups    "set backup folder
set directory=~/.vim/swaps      "set swap folder
set undolevels=100              "set number of undos maintained
if exists("&undodir")           "persist undos through multiple sessions
    set undodir=~/.vim/undo
    set undofile
    set undoreload=50
endif

" SPACE AND TABS
set tabstop=4           "number of visual spaces per TAB
set softtabstop=4       "number of spaces in tab while editing
set shiftwidth=4        "reindent width
set shiftround          "indent to correct columns
set expandtab           "TAB are now spaces
set backspace=2         "Backspace through everything while in insert
set preserveindent      "follow the convention laid before us

" SEARCH
set incsearch           "search as character are entered
set hlsearch            "highlight matches
set ignorecase          "case insensitive search
set smartcase           "case sensitive if query has mixed cases

" UI CONFIG
set showcmd             "display command in bottom bar
set cursorline          "hilight current line
set showmatch           "hilight matching [{()}]
set ruler               "displays limited minimal line numbering
set number              "displays line number
set visualbell          "disables the bell
set laststatus=2        "displays status bar
set lazyredraw          "redraws only when needed
set nohlsearch          "disable seach hilighting"
set guioptions-=m       "hides the menu bar
set guioptions-=T       "hides the toolbar
set guioptions-=r       "hides the scrollbars
set wildmenu
set wildmode=list:longest,full
set wildignore=*.pyc,*.exe,*.dll,*.o

" STATUS LINE CONFIG
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height=6
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style"  }
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        Errors
    endif
endfunction

" FILE EXPLORER CONFIG
let g:netrw_banner = 0
let s:netrw_up = maparg('-', 'n')
let g:netrw_list_hide = netrw_gitignore#Hide() . ',^\.\.\=/\=$'
let g:netrw_sort_sequence = '[\/]$,*,\%(' . join(map(split(&suffixes, ','), 'escape(v:val, ".*$~")'), '\|') . '\)[*@]\=$'')'

" CTRLP CONFIG
let g:ctrlp_working_path_mode = 'c'

" SUPERTAB CONFIG
let g:SuperTabDefaultCompletionType = "context"

" RAINBOW COFIGS
let g:rainbow_active = 1

" GIT COMMIT CONFIGS
autocmd Filetype gitcommit setlocal spell textwidth=72

" GOLANG SYNTAX HIGHTLIGHTING
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" MAPPINGS
let mapleader = ','

nmap j gj
nmap k gk
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
noremap \p :setlocal paste!<cr>
noremap \q :call ToggleErrors()<CR>
noremap <leader>h :setlocal hlsearch!<CR>

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
noremap <leader><Tab> <C-W>w
noremap <leader>/ :Ack<Space>

inoremap <leader><leader> <ESC>
vnoremap <leader><leader> <ESC>
