
set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
"NeoBundle 'hallettj/jslint.vim.git'

" vimscript
NeoBundle 'PDV--phpDocumentor-for-Vim'

"NeoBundle 'git://github.com/vim-scripts/lint.vim.git'

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on


set number
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set softtabstop=2
"set tabstop=2
"set shiftwidth=2
set shellslash
set title
set nolist
set showmatch
set incsearch
set hlsearch
set laststatus=2
set statusline=%f\ %m%=%{(&fenc!=''?&fenc:&enc).':'.&ff}%{(&list?'>':'')}\ %l-%v\ %p%%\ [%02B]
set ignorecase
set smartcase
set wrapscan
set nobomb
set ambiwidth=double
set modeline

colorscheme desert

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge
"

" ## netrw
" netrwは常にtree view
let g:netrw_liststyle = 3
" .svnで始まるファイルは表示しない
"#let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide = '.svn'
" 'v'でファイルを開くときは右側に開く
let g:netrw_altv = 1
" 'o'でファイルを開くときは上に開く
let g:netrw_alto = 0


" ## neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" php-doc.vim
"inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-D> :call PhpDocSingle()<CR>
"vnoremap <C-D> :call PhpDocRange()<CR>


" search hl cancel
nmap <ESC><ESC> :nohlsearch<CR><ESC>

nmap ,l :call PHPLint()<CR>


" Set JavaScript Lint as compiler.
"if ! exists('b:current_compiler')
"    compiler jsl
"endif

