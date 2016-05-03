" --------
" VIM-PLUG
" --------
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'craigemery/vim-autotag'

Plug 'jiangmiao/auto-pairs'
Plug 'eiginn/netrw'
Plug 'luochen1990/rainbow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'

Plug 'bling/vim-airline'
Plug 'danhp/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-startify'

Plug 'mattn/emmet-vim',                 {'for': 'html'}
Plug 'fatih/vim-go',                    {'for': 'go'}
Plug 'suan/vim-instant-markdown',       {'for': 'markdown'}
call plug#end()

" -------
" OPTIONS
" -------

" COLORS
syntax enable
let themeColour=$THEMECOLOUR
if themeColour == 'light'
	set background=light
	let g:airline_theme='solarized'
else
	set background=dark
	let g:airline_theme='luna'
endif
colorscheme solarized
set t_Co=256

" GENERAL SETTINGS
set nocompatible                "disable vi compatible mode
set title                       "include filename in title bar
set autoread                    "reload the file if it was changed elsewhere
set hid                         "change buffer without saving
set scrolloff=10                "scroll 10 lines before the window border
set encoding=utf-8 nobomb       "use UTF-8 without BOM
set listchars=tab:.\ ,eol:¬     "define invisible characters
set list                        "show invisible characters
set foldmethod=syntax           "allow folding
set foldnestmax=3               "max folding depth
set nofoldenable                "don't fold by default
set mouse=nvi                   "enable mouse scrolling
set ttimeoutlen=50              "make Esc work faster
set tags=tags;                  "tell vim to go up parent to find ctags
set backupdir=~/.vim/backups    "set backup folder
set directory=~/.vim/swaps      "set swap folder
set undolevels=500              "set number of undos maintained
if exists("&undodir")           "persist undos through multiple sessions
	set undodir=~/.vim/undo
	set undofile
	set undoreload=500
endif
set viminfo='100,n$HOME/.vim/files/info/viminfo

" Restore cursor to position in previous session
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" SPACE AND TABS
set tabstop=4           "number of visual spaces per TAB
set softtabstop=4       "number of spaces in tab while editing
set shiftwidth=4        "reindent width
set shiftround          "indent to correct columns
set backspace=2         "backspace through everything while in insert
set preserveindent      "follow the convention laid before us

" FILETYPE SETTINGS
filetype plugin indent on
augroup markdown         " use flavored-markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" SEARCH
set incsearch           "search as character are entered
set hlsearch            "highlight matches
set ignorecase          "case insensitive search
set smartcase           "case sensitive if query has mixed cases

" UI CONFIG
set showcmd             "display command in bottom bar
set cursorline          "hilight current line
set showmatch           "hilight matching [{()}]
set ruler               "display limited minimal line numbering
set number              "display line number
set visualbell          "disable the bell
set laststatus=2        "display status bar
set lazyredraw          "redraw only when needed
set nohlsearch          "disable seach hilighting
set guioptions-=m       "hide the menu bar
set guioptions-=T       "hide the toolbar
set guioptions-=r       "hide the scrollbars
set wildmenu            "enable command autocompletion
set wildmode=list:longest,full
set wildignore=*.pyc,*.exe,*.dll,*.o
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" -------
" PLUGINS
" -------

" STATUS LINE CONFIG
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
let g:syntastic_quiet_messages = {'type': 'style', 'level': 'warnings'}
function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		Errors
	endif
endfunction

" FILE EXPLORER CONFIG
let g:netrw_banner = 0
let g:netrw_liststyle=3
let s:netrw_up = maparg('-', 'n')
let g:netrw_list_hide = netrw_gitignore#Hide() . ',^\.\.\=/\=$'
let g:netrw_sort_sequence = '[\/]$,*,\%(' . join(map(split(&suffixes, ','), 'escape(v:val, ".*$~")'), '\|') . '\)[*@]\=$'')'

" CTRLP CONFIG
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" SUPERTAB CONFIG
let g:SuperTabDefaultCompletionType = "context"

" RAINBOW COFIGS
let g:rainbow_active = 1

" GOLANG SYNTAX HIGHTLIGHTING
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" STARTIFY CONFIGS
let g:ctrlp_reuse_window = 'startify'
let g:startify_custom_header = []
let g:startify_enable_special = 0
let g:startify_files_number = 8
let g:startify_list_order = [
	\ ['MRU within this dir:'],'dir',
	\ ['MRU:'], 'files',
	\ ['Sessions:'], 'sessions',
	\ ['Bookmarks:'], 'bookmarks'
	\ ]
let g:startify_skiplist =  ['COMMIT_EDITMSG']

" --------
" MAPPINGS
" --------

let mapleader = ','

nmap j gj
nmap k gk
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
noremap \p :setlocal paste!<cr>
noremap \q :call SyntasticToggleMode()<CR>
noremap \Q :call ToggleErrors()<CR>
noremap <leader>h :setlocal hlsearch!<CR>

" Codestyle mappings
noremap <leader>ss :StripWhitespace<CR>
function! Reindent()
	let save_cursor = getpos(".")
	:normal gg=G'.
	call setpos('.', save_cursor)
endfunction
noremap <leader>= :call Reindent()<CR>
function! InsertLine(flag)
	let save_cursor = getpos(".")
	if a:flag == 0
		:normal o
	else
		:normal O
		let save_cursor[1] = save_cursor[1] + 1
	endif
	call setpos('.', save_cursor)
endfunction
noremap <leader>- :call InsertLine(0)<CR>
noremap <leader>_ :call InsertLine(1)<CR>

" Code search/navigation
noremap <leader>e :e .<CR>
noremap <leader>/ :Ack<Space>
nnoremap <leader>. :CtrlPTag<cr>
noremap <leader>d <C-]>
noremap <leader>D <C-T>

" Copy/paste using system clipboard
noremap <leader>y "+y
noremap <leader>p "+p

" Tabpage binding
noremap [t :bp<CR>
noremap ]t :bn<CR>
noremap <leader>t :enew<CR>
noremap <leader>q :bd<CR>

inoremap <leader><leader> <ESC>
vnoremap <leader><leader> <ESC>
