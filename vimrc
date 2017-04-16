set nocompatible

" PAthogen
" -------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" -------------
" Syntax and indent
" -------------
syntax on
set showmatch

" hilight current line
augroup CursorLineOnltInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_bold=0
"set background=dark
colorscheme solarized
"colorscheme default
"colorscheme badwolf
set background=dark

highlight SignColumn ctermbg=234
"highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
"highlight StatusLineNC ctermfg=245 ctermbg=235

filetype plugin indent on
set autoindent

"---------
"  Folding
"---------
set foldmethod=marker

" -------------
" Basic editing
" -------------
set nu		" number
set rnu		" relative number
set incsearch
set hls
set listchars=tab:>>,nbsp:~ 	" set list to see tabs
set lbr		" linebreak
set ruler	" show current position in file
set scrolloff=5	" above and below
set noshowmode
set laststatus=2
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=1000	" fix slow 0 inserts
set autochdir	" set current dir to dir of last opened file
set hidden
set history=8192
set nojoinspaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ignorecase
set smartcase
set ttyfast
"set wildmode=longest,list
set wildmenu wildmode=longest:full,full
set wildignore=*.beam,*.o,*/.git/*,*.swp,*.html,*.d,*.DCD

" -----------
" Misc config
" -----------
let mapleader=','
let leader=','
set splitbelow

nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>e :e $MYVIMRC<cr>

map <leader>pp :setlocal paste!<cr>
map <C-n> :bn<cr>
map <C-p> :bp<cr>
nmap <Leader>. :bn<cr>
nmap <Leader>- :bp<cr>
nnoremap <C-c> :bp\|bd #<CR>

inoremap $1 ()<esc>i

nmap Q gqap
nmap <SPACE> /
inoremap jj <ESC>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-a>'
let g:multi_cursor_prev_key='<C-q>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<ESC>'

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" tagbar
nnoremap <Leader>t :TagbarToggle<CR>
" gundo
nnoremap <Leader>u :GundoToggle<CR>

" ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<Leader>l' " Ctrl-P

" ag
let g:ag_mapping_message=0
" "command -nargs=+ Gag Gcd | Ag! <args>
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" Match whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " delete any trailing whitespaces
  autocmd BufWritePre * :%s/\s\+$//ge
endif


