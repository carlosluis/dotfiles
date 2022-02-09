" Disable vi compatibility
set nocompatible
" filetype plugin on

" Quickly timeout keycodes but don't timeout mappings
set notimeout ttimeout ttimeoutlen=100

set clipboard=unnamed

"===================== REMAPPINGS ===========================================
" Save the use of shift: do commands like ;q! ;wq etc..
nnoremap ; :

" Quickly exit insert mode with jj
inoremap jj <Esc>

" Change mapleader from \ to space bar
nnoremap <SPACE> <Nop>
let mapleader=" "

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>


" Mapping for yanking to/from system clipboard
noremap <leader>y "+y
noremap <leader>p "+p
nnoremap 3` <ESC>3i`<ESC>

" Press F2 for pasting from clipboard preserving indent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" ===================== SETTINGS ===========================================
" Auto word wrap to 100 characters
set wrap        
set textwidth=100
set formatoptions+=t

" Show column width that matches the textwidth
set colorcolumn=101

" Show line numers
set number

"=====  Indentation ======
set autoindent

" Number of spaces to use for autoindenting
set shiftwidth=4

" 1 tab = 4 spaces
set tabstop=4    

" Insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab  

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Copy the previous indentation on autoindenting
set copyindent  

" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

"=====  Search and highlighting ======
" Show matching parantheses
set showmatch    

" Ignore case when searching
set ignorecase  

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase  

" Highlight search terms
set hlsearch  

" Show search matches as you type
set incsearch

"===================== PLUGINS ==========================================
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here
Plugin 'joshdick/onedark.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/calendar-vim'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on    " required

"===================== THEME & COLORS ====================================
" Stuff for darkvim and lightlime to work as intended
syntax on
set background=dark
set cursorline
colorscheme onedark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

"===================== PLUGIN-SPECIFIC SETTINGS ==========================
"=====  Auto-pair settings ======
" Fast wrap the word. all pairs will be consider as a block (include <>).
" (|)'hello' after fast wrap at |, the word will be ('hello')
" (|)<hello> after fast wrap at |, the word will be (<hello>)
let g:AutoPairsShortcutFastWrap = '<C-B>'

" ===== NERDTree settings ======
map <C-n> :NERDTreeToggle<CR>

" ===== Calendar settings ======
map <C-c> :Calendar<CR>

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
let g:ycm_confirm_extra_conf = 0
