set nocompatible
filetype plugin indent on
syntax on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" colorscheme codeschool
colorscheme jellybeans

set number                      " linenumber at start of line
" set relativenumber              " relative numbers above and below
set cursorline                  " highlight current line
set ruler                       " current position at lower right
set laststatus=2                " status line for each window
set virtualedit=all             " move cursor anywhere
set t_Co=256                    " 256 colors
set scrolloff=5                 " start scrolling on 5 lines left
set sidescrolloff=1             " scroll side step by step
set tabpagemax=30               " max 30 tab-pages on initial open of multiple files
set switchbuf=usetab            " on switchbuffer also switch to other tab
set splitright                  " create split right
set splitbelow                  " create split below

set showcmd                     " show size of selection
set showmatch                   " show matching bracket
set wildmenu                    " show menu on cmdline-completion
set hidden                      " hide abandoned buffers

set smartindent                 " automatically indent more or less in certain cases
set autoindent                  " automatically insert indent
set cindent                     " indent-settings for c-style-code
set expandtab                   " insert spaces instead of tab
set tabstop=4                   " <Tab> looks like 4 spaces
set softtabstop=4               " in insert-mode: <Tab> is 4 spaces
set shiftwidth=4                " shifting (<<, >>, ...) with is 4 spaces

set wrap                        " wrap text at end of line
" set colorcolumn=80,120          " show mark the 80 and 120 width
set textwidth=80                " try breaking text at 80

set ignorecase                  " ignore case on search
set smartcase                   " ignore case on search  if all lower-case
set hlsearch                    " highlight search-results
set incsearch                   " search while inserting search-string
" Use :nohlsearch<C-R> to clear the highlighting 

set backspace=indent,eol,start  " make backspace more usable
set history=100                 " keep 100 lines of command line history
" set undofile                    " save undo-history in file for reuse on re-open
set clipboard+=unnamed          " use +-register for ydcp

" Change appearance of char in :list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$
" set formatoptions+=j            " on joining comments remove comment-character

" set sessionoptions-=curdir       " don't use current-directory for save&load of session
" set sessionoptions+=sesdir       " use session-directory for save&load of session
" let g:session_directory=getcwd() " set session-directory to current directory (where vim started)
" let g:session_autosave='no'      " do not automatically save sessions

set diffopt+=filler             " on diff: include filler-lines
set diffopt+=iwhite             " on diff: ignore whitespace-changes
set diffopt+=vertical           " on diff: use vertical split

set encoding=utf-8              " UTF-8 encoding for files
set spelllang=en                " spellcheck language is englisch

" set foldcolumn=2                " show line before linenumber with fold-info
" set foldmethod=indent           " use indent as fold-indicator
" set foldlevel=0                 " close all folds
" " open all folds on file open
" au BufRead * normal zR

" set concealcursor=vin           " visual, insert, normal -- conceal/hide things
" set conceallevel=2              " concealed text is concealed

" on completion: show menu with options and only include longest matches
set completeopt=menu,menuone,longest

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Ctrl-Space for completion-menu
inoremap <C-Space> <c-x><c-u>
" Ctrl-Space for completion-menu
inoremap <C-@> <c-x><c-u>

set autoread                    " reread file on external change

" Ctrl-PageUp for previous buffer
map <C-PAGEUP> :bp<CR>
" Ctrl-PageDown for next buffer
map <C-PAGEDOWN> :bn<CR>

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

" make % match more then brackets
runtime! macros/matchit.vim     

" <leader> F aka \F continuously reload file and goto last line
" nmap <silent> F :e!<CR>G:sleep 500m<CR>:redraw<CR>F
nmap <silent> <leader>F :e!<CR>G:sleep 500m<CR><leader>F

set nottimeout                  " do not timeout on key sequence insertion


" vim:set ft=vim et sw=2:
