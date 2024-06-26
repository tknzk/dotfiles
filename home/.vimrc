" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/Users/tknzk/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/Users/tknzk/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundles'))
  call dein#begin(expand('~/.vim/bundles'))


  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/vimshell')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('jpalardy/vim-slime')
  call dein#add('scrooloose/syntastic')
  call dein#add('pangloss/vim-javascript')
  call dein#add('thinca/vim-quickrun')

  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-fugitive')
  call dein#add('itchyny/lightline.vim')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('tpope/vim-rails')
  call dein#add('vim-scripts/ruby-matchit')
  call dein#add('Blackrush/vim-gocode')
  call dein#add('rhysd/github-complete.vim')
  call dein#add('junegunn/vim-emoji')

  call dein#add('preservim/vim-indent-guides')

  call dein#add('vim-scripts/sudo.vim')
  call dein#add('vim-scripts/VimClojure')
  call dein#add('vim-scripts/netrw.vim')
  call dein#add('vim-scripts/lint.vim')

  call dein#add('davidhalter/jedi-vim',{ 'autoload': { 'filetypes':['python'] } })
  call dein#add('kevinw/pyflakes-vim', { 'autoload': { 'filetypes':['python'] }})
  call dein#add('hdima/python-syntax', { 'autoload': { 'filetypes':['python'] }})
  call dein#add('fatih/vim-go', { 'autoload': { 'filetypes':['go'] }})
  call dein#add('benmills/vim-golang-alternate', { 'autoload': { 'filetypes':['go'] }})
  call dein#add('vim-jp/vim-go-extra', { 'autoload': { 'filetypes': ['go'] }})
  call dein#add('jelera/vim-javascript-syntax', { 'autoload':{ 'filetypes':['javascript'] }})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" vim-indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=238
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1
au FileType coffee,ruby,eruby,javascript,python,haml IndentGuidesEnable
nmap <silent><Leader>ig <Plug>IndentGuidesToggle


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
"au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
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
let g:syntastic_mode_map = { 'mode': 'passive',
  \ 'active_filetypes': [''],
  \ 'passive_filetypes': ['html'] }
" rubocop
let g:syntastic_ruby_checkers = ['rubocop']


""""" "let g:syntastic_auto_loc_list = 1
""""" "let g:syntastic_javascript_checker = 'jshint'


if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif

""""" "----------
""""" " unite for rails
""""" "----------
""""" let g:unite_enable_start_insert = 1
""""" let g:unite_enable_split_vertically = 0
""""" let g:unite_winwidth = 40
""""" nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
""""" nnoremap <silent> ,um :<C-u>Unite  file_mru <CR>
""""" nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
""""" nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
""""" nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
""""" nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
""""" nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
""""" nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
""""" nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
""""" nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
""""" nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
""""" nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
""""" nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
""""" nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
""""" nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
""""" nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
""""" nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
""""" nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
"""""
"""""
"-----
" hardtab/全角スペースの色付け
"-----
"set lcs=tab:>.,trail:_,extends:\
"set list
" highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
" highlight JpSpace cterm=underline ctermfg=7 guifg=7
" au BufRead,BufNew * match JpSpace /　/

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


""""" "------
""""" "tab
""""" "------
"""""
""""" "" Anywhere SID.
""""" "function! s:SID_PREFIX()
""""" "  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
""""" "endfunction
""""" "
""""" "" Set tabline.
""""" "function! s:my_tabline()  "{{{
""""" "  let s = ''
""""" "  for i in range(1, tabpagenr('$'))
""""" "    let bufnrs = tabpagebuflist(i)
""""" "    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
""""" "    let no = i  " display 0-origin tabpagenr.
""""" "    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
""""" "    let title = fnamemodify(bufname(bufnr), ':t')
""""" "    let title = '[' . title . ']'
""""" "    let s .= '%'.i.'T'
""""" "    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
""""" "    let s .= no . ':' . title
""""" "    let s .= mod
""""" "    let s .= '%#TabLineFill# '
""""" "  endfor
""""" "  let s .= '%#TabLineFill#%T%=%#TabLine#'
""""" "  return s
""""" "endfunction "}}}
""""" "let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
""""" "set showtabline=2 " 常にタブラインを表示
""""" "
""""" "" The prefix key.
""""" "nnoremap    [Tag]   <Nop>
""""" "nmap    t [Tag]
""""" "" Tab jump
""""" "for n in range(1, 9)
""""" "  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
""""" "endfor
""""" "" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
""""" "
""""" "map <silent> [Tag]c :tablast <bar> tabnew<CR>
""""" "" tc 新しいタブを一番右に作る
""""" "map <silent> [Tag]x :tabclose<CR>
""""" "" tx タブを閉じる
""""" "map <silent> [Tag]n :tabnext<CR>
""""" "" tn 次のタブ
""""" "map <silent> [Tag]p :tabprevious<CR>
""""" "" tp 前のタブ
"""""
