"================================================
"" vim-plug
"================================================

call plug#begin('~/.config/nvim/plugged') 

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'sirver/ultisnips'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'rking/ag.vim'
Plug 'Raimondi/delimitMate'
Plug 'b4winckler/vim-objc', { 'for': 'objc' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'jpalardy/vim-slime'
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'

call plug#end()


colorscheme molokai


"================================================
" General 
"================================================
syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000

set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256
set cmdheight=1


"================================================
"" Files and Bakcup
"================================================
set backup                  " backup: keep a backup file
set backupdir=~/.tmp        " op=,.,/var/tmp/vi.recover,/tmp " bdir: backup directory
set directory=~/.tmp        " op=,.,/var/tmp/vi.recover,/tmp " dir to save swp files"

"================================================
"" using tab to edit files
"================================================
noremap tn :tabnew
noremap <silent> th :tabprev<CR>
noremap <silent> tl :tabnext<CR>
noremap <silent> td :tabclose<CR>

let mapleader=","


"================================================
""NERDTree 
"================================================
map <Leader>n :NERDTreeToggle<CR>

"================================================
"" Hoogle
"================================================
nnoremap <Leader>h :Hoogle
nnoremap <silent> <Leader>hc :HoogleClose<CR>

"================================================
"" syntastic
"================================================
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"================================================
"" ghcmod
"================================================
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

"================================================
"" hdevtool
"================================================
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

"================================================
"" tagbar
"================================================
nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }


"================================================
""tabularize 
"================================================
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

"================================================
""ctrlp 
"================================================
let g:ctrlp_custom_ignore = '\v[\/]dist$'

"================================================
"" vim-slime
"================================================
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

"================================================
"" gocode
"================================================
set rtp+=$GOROOT/misc/vim
let g:go_disable_autoinstall = 0
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"


let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

autocmd FileType go autocmd BufWritePre <buffer> Fmt

"================================================
"" UltiSnips 
"================================================
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


if has('nvim') " This way you can also put it in your vim config file
  call remote#host#Register('fibonacci', "*", rpcstart('/Users/mno2/Develop/haskell/nvim-hs-emoji/nvim-hs-devel.sh'))
  let haskellChannel = remote#host#Require('fibonacci')

  if haskellChannel < 1
    echom 'Failure to initialize the haskell channel for remote procedure calls'
    cq!
  endif
endif
