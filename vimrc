
let g:openssl_backup = 1
let delimitMate_expand_cr=1
let delimitMate_autoclose=0

" pathogen
call pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on

" fugitive
if exists('g:loaded_fugitive')
    if has("autocmd")
        autocmd BufReadPost fugitive://* set bufhidden=delete
    endif
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

if exists('g:loaded_unimpaired')
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e
    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv
endif

let mapleader=","

" toggle show invisible chars
nmap <leader>l :set list!<CR>

if has("multi_byte")
    set encoding=utf-8
    set listchars=tab:▸\ ,eol:¬  " ▸:U+25b8 ¬:U+00ac
else
    set listchars=tab:~\ ,eol:$  
endif

highlight NonText ctermfg=cyan
" highlight SpecialKey guifg=#RRGGBB

" spelling
" ]s [s z= zg/zw ~/.vim/spell/LL.EEE.add
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_us

nmap <silent> <leader>pt :%! perltidy<CR>
nmap <silent> <leader>ptv :'<,'>! perltidy<CR>
nmap <silent> <leader>c :! perl -MVi::QuickFix -c %<CR>

if exists('g:loaded_ack')
    nnoremap <leader>a :Ack
endif

" don't gripe on unsaved buffers
set hidden

"quick window movements
map <a-w>  <c-w>
map <a-l> <c-w>l
map <a-k> <c-w>k
map <a-j> <c-w>j
map <a-h> <c-w>h
imap <a-l> <esc><c-w>li
imap <a-k> <esc><c-w>ki
imap <a-j> <esc><c-w>ji
imap <a-h> <esc><c-w>hi

" quit tab movements
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

" Visually select the text that was last edited/pasted (c.v. gv)
nmap gV `[v`]

set background=dark
set t_Co=256
colorscheme darkburn

set cul " cuc
highlight CursorLine cterm=NONE ctermbg=0

" only if autocommands
" if has("autocmd")
"     filetype on
" 
"     " autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
"     " autocmd BufNewFile,BufRead *.rss setfiletype xml
" endif

" auto .vimrc
" if has("autocmd")
"     autocmd BufWritePost .vimrc source $MYVIMRC
" endif
" nmap <leader>v :tabedit $MYVIMRC<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set nocompatible
set directory=/tmp
set backspace=indent,eol,start
" set nohlsearch
nnoremap <leader><space> :nohl<CR>
set incsearch
set ignorecase
set smartcase
set expandtab
set smarttab
set autoindent
"set copyindent
set shiftround
set sw=4
set ts=4
set pastetoggle=<F2>
set history=1000
set undolevels=1000

nnoremap <tab> %
vnoremap <tab> %
" inoremap jj <ESC>

let perl_include_POD = 1
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
let perl_fold = 1

" http://www.slideshare.net/genehackdotorg/tweakers-anonymous
" autocmd BufWritePost *.pl !chmod +x %

" digraphs from rjbs
dig xx 9792 " female sign
dig xy 9794 " male sign

" die macro record from mst
nnoremap q <NOP>
