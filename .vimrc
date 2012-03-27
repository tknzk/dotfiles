set number
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
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

"autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict

"set complete+=k

syntax on
colorscheme desert

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

