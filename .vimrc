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

if has("autocmd")
    " カーソル位置を記憶する
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

inoremap <c-e><c-h> <left>
inoremap <c-e><c-l> <right>
inoremap <c-e><c-k> <up>
inoremap <c-e><c-j> <down>
inoremap <c-e>O <esc>O
inoremap <c-e>o <esc>o
inoremap <c-e><c-e> <esc>A
inoremap <c-e><c-a> <esc>I

nmap <ESC><ESC> :nohlsearch<CR><ESC>


"autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict

"set complete+=k

syntax on

"scriptencoding utf-8
"scriptencoding euc-jp

augroup highlightIdegraphicSpace
  autocmd!
  autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen
  "guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END


colorscheme desert
"colorscheme jellybeans

""<TAB>で補完
"" {{{ Autocompletion using the TAB key
"" This function determines, wether we are on the start of the line text (then tab indents) or
"" if we want to try autocompletion
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"    return "\<TAB>"
"    else
"if pumvisible()
"    return "\<C-N>"
"    else
"    return "\<C-N>\<C-P>"
"    end
"    endif
"    endfunction
"" Remap the tab key to select action with InsertTabWrapper
"    inoremap <c-n> <c-r>=InsertTabWrapper()<cr>
"" }}} Autocompletion using the TAB key
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

" ref.vim
let g:ref_phpmanual_path = $HOME . '/Dropbox/php-chunked-xhtml'
let g:ref_refe_cmd = $HOME . '/Dropbox/ruby-refm/refe-1_9_2'


" omnifunc
setlocal omnifunc=syntaxcomplete#Complete

autocmd filetype php :set makeprg=php\ -l\ %
autocmd filetype php :set errorformat=%m\ in\ %f\ on\ line\ %l
""
" PHP Lint
"
nmap ,l :call PHPLint()<CR>
"autocmd BufWritePost :call PHPLint()<CR>
"autocmd BufWritePost *.php :call PHPLint()<CR>
"autocmd BufWritePost *.php set noexpandtab | retab! | w | set expandtab | retab! :call PHPLint()<CR>

function PHPLint()
  let result = system(&ft . ' -l ' . bufname(""))
  echo result
endfunction

" phplint
"autocmd BufWritePost *.php :call PHPLint()
"
"function PHPLint()  let result = system( &ft . ' -l ' . bufname(""))
"  let headPart = strpart(result, 0, 16)
"  if headPart != "No syntax errors"
"    echo result
"  endif
"endfunction


" php-doc.vim
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

"let loaded_matchparen = 1

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

au FileType yaml set expandtab ts=2 sw=2 enc=utf-8 fenc=utf-8
"au FileType yaml set expandtab ts=2 sw=2 enc=euc-jp fenc=euc-jp

"set fileencodings=iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1


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

"let g:jellybeans_use_lowcolor_black = 0


" indent-guides
let g:indent_guides_auto_colors = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
