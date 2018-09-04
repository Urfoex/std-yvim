set nocompatible
filetype plugin indent on

syntax on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" set background=light
colorscheme molokai
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
" set termguicolors

" set number
set relativenumber
set cursorline
set cursorcolumn
set laststatus=2
set virtualedit=all
set t_Co=256
set scrolloff=5
set sidescrolloff=1
set tabpagemax=30
set switchbuf=usetab
set splitright
set splitbelow

" works with Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set t_SH =

set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set showcmd
set showmatch
set wildmenu
set hidden

set smartindent
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set wrap
set colorcolumn=80,120
set textwidth=120

set ignorecase
set smartcase
set hlsearch
set incsearch

runtime! macros/matchit.vim

set backspace=indent,eol,start
set history=100 " keep 100 lines of command line history
set undofile
set clipboard+=unnamed

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
set formatoptions+=j
set formatoptions-=t

set sessionoptions-=curdir
set sessionoptions-=options
"set ssop-=curdir
set sessionoptions+=sesdir
"set ssop+=sesdir
let g:session_directory=getcwd()
let g:session_autosave='no'

set diffopt+=filler
set diffopt+=iwhite
set diffopt+=vertical

set encoding=utf-8
set spelllang=en

set foldcolumn=2
set foldmethod=indent
set foldlevel=0
" open all folds on file open
au BufRead * normal zR
"
set concealcursor=vin
set conceallevel=2

set complete+=t
set completeopt=menu,menuone,longest


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

inoremap <C-Space> <c-x><c-u>
inoremap <C-@> <c-x><c-u>


set autoread
nnoremap <silent> <Leader>r :checktime<CR>


map <C-PAGEUP> :bp<CR>
map <C-PAGEDOWN> :bn<CR>

nmap <silent> <leader>F :e!<CR>G:sleep 500m<CR><leader>F


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Remove all trailing whitespaces on write.
" Probably not always wanted...
autocmd BufWritePre * %s/\s\+$//e


" format json-objects
" :%!python -m json.tool
"
" set ttymouse=sgr
