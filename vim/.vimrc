colorscheme jellybeans
set autoread " autoread file when changed outside vim

if system('uname -s') == "Darwin\n"
    " iterm sucks
else
    set relativenumber
endif

filetype plugin on
filetype indent on
set autoindent
syntax on

set cursorline " highlight line with the cursor

" 1 tab == 4 spaces
set shiftwidth=4 " affects >> << == and automatic indentation
set tabstop=4 " how tab will be displayed
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces

autocmd Filetype go setlocal noexpandtab
autocmd Filetype ruby,eruby,yaml,css,scss,js,cpp setlocal softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype eruby setlocal omnifunc=htmlcomplete#CompleteTags
au BufRead,BufNewFile *.coffee   set filetype=coffee
au BufRead,BufNewFile *.cc   set filetype=cpp

set ruler " display line and column number
set backspace=2 "backspace acts like it should
set mouse=a
set number " show line numbers
set wildmenu " visual autocomplete for command menu
set laststatus=2 " always display status line

set incsearch " search as characters are entered
set hlsearch " highlight matches in search
set ic " search case insensitive

set t_Co=256
set scrolloff=5 " scroll offset, number of lines above and below the cursor
set background=dark
set showmode
set showmatch " show matching bracket
set path+=** " find method will lookup whole tree
set noeb vb t_vb= " disable beeping
let g:netrw_list_hide = '\.o$,\.obj$,'
let g:netrw_banner = 0

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" jk goes to next visible line, not actual textfile line
nnoremap j gj
nnoremap k gk

" select recently pasted text
nnoremap gV `[v`]

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:¬,
nnoremap <F3> :set list!<CR> " display whitespaces

" jump to next error from :make
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

nnoremap <C-d> :e `dirname %`<CR>

" in visual mode
" / will search only in selected text
" * will search for selected text in whole file
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap * y:let @/ = @"<CR>

imap <C-Space> <C-X><C-O>

set directory=$HOME/.vim/swapfiles// " swapfiles

" move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open splits on right/below
set splitright
set splitbelow

nnoremap <C-E> :Buffers<CR>
nnoremap <C-F> :Files<CR>
nnoremap <C-G> :BCommits<CR>

nnoremap <F6> :!./%<CR>
autocmd Filetype go nnoremap <F5> :w<CR>:w !go run %<CR>
autocmd Filetype haskell nnoremap <F5> :w<CR>:w !runghc %<CR>
autocmd Filetype python nnoremap <F5> :w<CR>:w !python3 %<CR>
autocmd Filetype c nnoremap <F5> :w<CR>:w !gcc -Wall -Wextra % && ./a.out<CR>
autocmd Filetype ruby nnoremap <F5> :w<CR>:w !ruby %<CR>
autocmd Filetype tex nnoremap <F5> :w<CR>:!pdflatex main.tex; pkill -HUP mupdf<CR>
