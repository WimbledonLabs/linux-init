set nocompatible               " Be iMproved

" 256 color mode... doesn't seem to work
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

filetype plugin indent on

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Enable mouse for changing cursor position and choosing panes and scrolling
" It's nicer this way :)
set mouse=nicr

" Show tabs and trailing whitespace
set listchars=tab:>~,nbsp:_,trail:.
set list

" Pressing tab inserts spaces
set expandtab
" Controls indent operators
set shiftwidth=4
" Number of columns a tab represents in a file
set tabstop=4
" Backspace deletes spaces according to tab stops
set softtabstop=4

" Change file to unix line endings
set ff=unix

" Subtly show a column that hints at long lines
let &colorcolumn=join(range(81,81),",")
set hlsearch

" Show line numbers
set nu

" Workaround for a bug in vim-8. This preserves the xclipboard when exiting vim
set t_BE=

" Highlight the line the cursor is currently on
se cursorline
hi CursorLine ctermbg=0

" For vimdiff hide all syntax highlighting and only show differences
if &diff
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
else
    " Jump to last position when reopening a file.... somehow
    " Not used in diff mode since it just ends up being confusing
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif

    "syntax match Braces display '[\.=,{}()\[\]\+\-\*\&\|\~\^\!\>\<\?]'
    "autocmd Syntax * syntax match Braces display '[\.=,{}()\[\]\+\-\*\&\|\~\^\!\>\<\?]'
    "hi def link Braces Operator
endif

syntax on
colorscheme mywolf

" Use system clipboard
set clipboard=unnamedplus

" Show cursor position
set ruler

" Highlight search terms
set hlsearch

" Make backspace not super dumb for inserts
set backspace=indent,eol,start

set foldmethod=indent
set foldnestmax=5
set foldlevel=5

set incsearch

" Search the current buffer "." and the tags "t" for word completion
set complete=.,t

" Use space to toggle folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

au BufNewFile,BufRead Jenkinsfile setf groovy

set undodir=$HOME/.vim/undodir
set undofile

" Don't have a CVE for old vim versions
set nomodeline
