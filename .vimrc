"
" Bjarni Olsen's Vim Configuration
"

set nocompatible

" Get pathogen up and running
filetype off
execute pathogen#infect()

" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set expandtab
set autoindent
set copyindent
set smartindent
set preserveindent

set number
set showmatch
set matchtime=1

" set the search scan to wrap lines
set wrapscan

" Make command line two lines high
set ch=3

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=indent,eol,start

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

set nolist
"set listchars=tab:>·,trail:·,extends:#,nbsp:·

" Keep some stuff in the history
set history=1000

" Many levels of undo
set undolevels=1000

" Change the terminals title
set title

" Highlight current line
set cursorline

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Make the command-line completion better
set wildmenu

" Set the textwidth to be 80 chars
" set textwidth=80

" get rid of the silly characters in separators
set fillchars = ""

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

set ignorecase
set smartcase

" Automatically read a file that has changed on disk
set autoread

let mapleader = ","
let maplocalleader = ",,"

"set foldlevelstart=0

" Space to toggle fold
"nnoremap <Space> za 
"vnoremap <Space> za 

"-----------------------------------------------------------------------------
" MAPPINGS
"-----------------------------------------------------------------------------
" Edit the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" map / to search for visually selected text
vnoremap / y/<C-r>"<CR><S-n>

" stupid danish keyboard, fix goto-mark-key
"nmap ½ `

" map F1 to something sensible instead of help
nmap <f2> :nohlsearch<cr>

" map leader-space to omnicompletion
"set completeopt=longest,menuone
"inoremap <M-a> <C-x><C-o>
"inoremap <expr> <CR> >
"inoremap <silent> <M-s> </<C-X><C-O><C-X>

" map for saving file
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>

" move between splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" copy/Paste from/to clipboard
if has('unix')
    nnoremap <C-S-c> "+y
    vnoremap <C-S-c> "+y
    nnoremap <C-S-v> "+gP
    vnoremap <C-S-v> "+gP
else
    nnoremap <C-S-c> "*y
    vnoremap <C-S-c> "*y
    nnoremap <C-S-v> "*p
    vnoremap <C-S-v> "*p
endif

" map Leader j to LustyJuggler buffer plugin
nnoremap <Leader>l :LustyJuggler<CR>
let g:LustyJugglerSuppressRubyWarning = 1

" Go to start / end og line
noremap H ^
noremap L g_

" Write mail from SviMTP skeleton
"nnoremap <M-s> :e ~/.vim/bundle/SviMTP/skeleton.mail<ESC>:set ft=mail<CR>A
"nnoremap <M-e> :e ~/.vim/bundle/SviMTP/evernote.mail<ESC>:set ft=mail<CR>jA
"nnoremap <M-w> :e ~/.vim/bundle/SviMTP/wunderlist.mail<ESC>:set ft=mail<CR>jA

"-----------------------------------------------------------------------------
" AUTO COMMANDS
"-----------------------------------------------------------------------------
augroup number_toggle
  autocmd!
  au FocusLost * :set number
  au FocusGained * :set relativenumber
augroup END

augroup omnifunc
	autocmd!
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END
" Toggle absolute and relative line numbers
nnoremap <C-n> :call NumberToggle()<CR>

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off
nmap ½ :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 50

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

"-----------------------------------------------------------------------------
" Lightline.vim Plugin Settings
"-----------------------------------------------------------------------------
let g:lightline = {
	\ 'component': {
	\   'readonly': '%{&readonly?"x":""}',
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '|', 'right': '|' }
\ }

"-----------------------------------------------------------------------------
" NeoComplCache Plugin Settings
"-----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"-----------------------------------------------------------------------------
" Vim Miximizer Plugin settings
"-----------------------------------------------------------------------------
let g:maximizer_default_mapping_key = '<M-q>'

"-----------------------------------------------------------------------------
" FUNCTIONS
"-----------------------------------------------------------------------------
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction

function! FixLines()
	%s/\r//g
endfunction

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
  set background=dark
  "colorscheme solarized
  "colorscheme twilight
  "colorscheme badwolf
  colorscheme gruvbox

  if has("gui_gtk2")
    set guifont=Inconsolata\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif

else
	let g:seoul256_background = 235
	colorscheme seoul256
	"Light background
	"let g:seoul256_background = 256
	"colorscheme seoul256-light
endif

set backup
set noswapfile

" windows stuff (ignore on Linux)
if has('win32')
  set backupdir=c:\temp
  set directory=c:\temp
else
  set undodir=~/.backup/undo//
  set backupdir=~/.backup/backup//
  set directory=~/.backup/swap//
endif
