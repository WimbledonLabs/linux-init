if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Enable mouse for changing cursor position and choosing panes and scrolling
set mouse=a

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
let &colorcolumn=join(range(81,999),",")
set hlsearch

" Show line numbers
set nu

" Highlight the line the cursor is currently on
se cursorline

" For vimdiff hide all syntax highlighting and only show differences
if &diff
    syntax off
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
else
    syntax on
    colorscheme mywolf
    syntax match Braces display '[\.=,{}()\[\]\+\-\*\&\|\~\^\!\>\<\?]'
    autocmd Syntax * syntax match Braces display '[\.=,{}()\[\]\+\-\*\&\|\~\^\!\>\<\?]'
    hi def link Braces Operator
endif

if &filetype == "v"
    setlocal noexpandtab noautoindent
    autocmd FileType verilog setlocal noexpandtab
endif

" Use system clipboard
set clipboard=unnamedplus

" Make backspace not super dumb for inserts
set backspace=indent,eol,start

" Always hide statusline
set laststatus=0
