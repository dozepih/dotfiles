set nocompatible
syntax on
set t_Co=256
set background=dark

filetype plugin indent on

" Shortcuts
let leader=","
let mapleader=","
let g:ctrlp_map = '<Leader>l' " Ctrl-p
nnoremap <Leader>ö :Ack<Space>
map <C-n> :bn<cr>
map <C-p> :bp<cr>
noremap <tab> v>
noremap <s-tab> v<
vnoremap <tab> v>
vnoremap <s-tab> v<

nmap <Leader>. :bn<CR>
nmap <Leader>m :bp<CR>
nmap <Leader>p :set paste!<cr>
nmap Q gqap
nmap <SPACE> /
inoremap jj <ESC>

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>e :e $MYVIMRC<cr>
nnoremap <C-c> :bp\|bd #<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Modes
let g:erlang_show_errors=0

syntax enable
set encoding=utf-8

set textwidth=79        " Width
set colorcolumn=+1
set expandtab           " Spaces instead of tabs
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Colors
hi ColorColumn ctermbg=black
"hi StatusLine ctermbg=darkblue ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=red
hi Identifier   ctermfg=red cterm=none guifg=palegreen


set nowrap
set nobackup
set autoread            " Reread files when changed
set ruler               " Show line and column number
"set cursorline        " Hightlight the screen line
set linebreak     " Do linebreaks
set incsearch     " Incremental search
set ignorecase          " No case when searching
set hlsearch      " Hilight search
set scrolloff=3       " Add three lines of spac%e
" "set relativenumber     " Show linenumbers
set backspace=eol,start,indent
set wildignore=*.beam,*.o,*/.git/*,*.swp,*.html,*.d,*.DCD
set laststatus=2
set wildmenu
set wildmode=longest,list

if hostname() == "snorgars"
   set shiftwidth=4
endif

nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|\.(git|hg|svn)$'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Autocommand
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd FileType text setlocal textwidth=78

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Filetypes
au FileType make set noexpandtab    " Use real tabs

