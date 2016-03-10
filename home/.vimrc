
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()


NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'sudo.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'TwitVim'
NeoBundle 'netrw.vim'
NeoBundle 'tpope/vim-abolish'
"NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'ruby-matchit'

NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'rhysd/github-complete.vim'
NeoBundle 'junegunn/vim-emoji'




" vimscript
"NeoBundle 'PDV--phpDocumentor-for-Vim'

"NeoBundle 'git://github.com/vim-scripts/lint.vim.git'

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'


NeoBundle 'mattn/benchvimrc-vim'
NeoBundle 'mattn/emoji-vim'
NeoBundle 'mattn/vim-maketable'

NeoBundle 'othree/html5.vim'

"NeoBundle 'jeetsukumaran/vim-markology'

" FOR coffeescript
" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'
" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------
" function
"--------
"function! GetStatusEx()
"let str = ''
"let str = str . '' . &fileformat . ']'
"if has('multi_byte') && &fileencoding != ''
"let str = '[' . &fileencoding . ':' . str
"endif
"return str
"endfunction

"--------
" config
"--------

set number
set autoindent
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set wrapscan
set title
set ruler
set nolist
set showcmd
set showmatch
set nobomb
set expandtab
set hlsearch
set incsearch
set vb t_vb=
set laststatus=2

"set cursorcolumn
"set cursorline

"set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>

syntax on
colorscheme desert

"--------
" keymap
"--------

nnoremap j gj
nnoremap k gk
" search hl cancel
nmap <ESC><ESC> :nohlsearch<CR><ESC>


"--------
" 起動位置の保存
"--------
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"--------
" netrw
"--------
" netrwは常にtree view
let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く
let g:netrw_altv = 1
" 'o'でファイルを開くときは上に開く
let g:netrw_alto = 0

let g:netrw_winsize = 75

"--------
" config by filetype
"--------
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et


"--------
" neosnippet
"--------
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



" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': ['html'] }
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_javascript_checker = 'jshint'

"""filetype plugin indent on     " required!
"""filetype indent on
"""syntax on
"""" taglistの設定 coffeeを追加
"""" let g:tlist_coffee_settings = 'coffee;f:function;v:variable'
"""
"""" QuickRunのcoffee
"""" let g:quickrun_config['coffee'] = {
""""      \'command' : 'coffee',
""""      \'exec' : ['%c -cbp %s']
""""      \}
"""
""""------------------------------------
"""" vim-coffee-script
""""------------------------------------
"""" 保存時にコンパイル
"""autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
"""
""""------------------------------------
"""" jasmine.vim
""""------------------------------------
"""" ファイルタイプを変更
"""function! JasmineSetting()
"""  au BufRead,BufNewFile *Helper.js,*Spec.js  set filetype=jasmine.javascript
"""  au BufRead,BufNewFile *Helper.coffee,*Spec.coffee  set filetype=jasmine.coffee
"""  au BufRead,BufNewFile,BufReadPre *Helper.coffee,*Spec.coffee  let b:quickrun_config = {'type' : 'coffee'}
"""  call jasmine#load_snippets()
"""  map <buffer> <leader>m :JasmineRedGreen<CR>
"""  command! JasmineRedGreen :call jasmine#redgreen()
"""  command! JasmineMake :call jasmine#make()
"""endfunction
"""au BufRead,BufNewFile,BufReadPre *.coffee,*.js call JasmineSetting()

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=237
au FileType coffee,ruby,eruby,javascript,python IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle

if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif


"----------
" unite for rails
"----------
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_winwidth = 40
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,um :<C-u>Unite  file_mru <CR>
nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>


"-----
" hardtab/全角スペースの色付け
"-----
"set lcs=tab:>.,trail:_,extends:\
"set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

" 保存時に行末の空白を除去する
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
    %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()
"autocmd BufWritePre * :%s/\s\+$//ge

"------
"tab
"------

"" Anywhere SID.
"function! s:SID_PREFIX()
"  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
"endfunction
"
"" Set tabline.
"function! s:my_tabline()  "{{{
"  let s = ''
"  for i in range(1, tabpagenr('$'))
"    let bufnrs = tabpagebuflist(i)
"    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
"    let no = i  " display 0-origin tabpagenr.
"    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
"    let title = fnamemodify(bufname(bufnr), ':t')
"    let title = '[' . title . ']'
"    let s .= '%'.i.'T'
"    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
"    let s .= no . ':' . title
"    let s .= mod
"    let s .= '%#TabLineFill# '
"  endfor
"  let s .= '%#TabLineFill#%T%=%#TabLine#'
"  return s
"endfunction "}}}
"let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
"set showtabline=2 " 常にタブラインを表示
"
"" The prefix key.
"nnoremap    [Tag]   <Nop>
"nmap    t [Tag]
"" Tab jump
"for n in range(1, 9)
"  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
"endfor
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"
"map <silent> [Tag]c :tablast <bar> tabnew<CR>
"" tc 新しいタブを一番右に作る
"map <silent> [Tag]x :tabclose<CR>
"" tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR>
"" tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR>
"" tp 前のタブ

