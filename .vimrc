:version 7.4

set fileencodings=ucs-bom,utf-8,euc-kr,cp949,euc-jp,shift-jis,big5,latin1,ucs-21e
set encoding=utf-8 tabstop=4 softtabstop=4 shiftwidth=4

let s:cpo_save=&cpo
set cpo&vim
" let g:NERDTreeNetrw=0
" vim-preview plugin
syntax on
filetype off
filetype plugin on
filetype indent on
ca ㅈ q!
ca ㅈㅂ wq!
set modifiable
set history=700
set undolevels=700
set shiftround ruler expandtab hlsearch
nnoremap <ESC> :noh<CR>
set incsearch ignorecase smartcase
" set paste 		"don't inline writing when paste it
" set pastetoggle=<F2>  " 붙여넣기 모드에서 붙여넣기는 자동indent(들여쓰기) 방지.
set showmode   " 모드를 보여줌
set showcmd
set mousehide  " Hide the mouse when typing text
set clipboard=unnamed
set makeprg=gcc\ -o\ %<\ % 
set whichwrap=b,s,>,<,[,] " <BS> 이전 행으로 이동, <space> 다음 행으로 이동
 " Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Rebind <Leader> key
let mapleader = ","

" Removes highlight of your last search
noremap <C-n> :noh<CR>
vnoremap <C-n> :noh<CR>
inoremap <C-n> :noh<CR>

vnoremap <Tab> <Esc>gV
" inoremap <Tab> <Esc>`^
inoremap jj <Esc>
nnoremap jj <Esc>
nnoremap <Space> i
noremap <S-H> ^
noremap <S-L> $
"nnoremap <silent> <F7> :TlistUpdate<CR>
"nnoremap <silent> <F8> :Tlist<CR>
"nnoremap <silent> <F9> :TlistSync<CR> 
"""<F2> : folding , <F3> : unfolding, <F4> : Tlist
map <F2> v]}zf
" map <F3> zo
" map <F4> :Tlist<CR><C-w><C-w>
" map <F5> :shell python3 %
autocmd FileType c map <F10> <Esc>:!./%<CR>a
autocmd FileType cpp map <F10> <Esc>:!./%<CR>a
autocmd FileType cpp map <F9> <Esc>:w!<CR>|:!gcc-o %<CR>a
autocmd FileType java <F9> <Esc>:w!<CR>|:!javac "%:p" && java -cp "%:p:h" "%:t:r"<CR>a
autocmd FileType ruby map <F9> <Esc>:w!<CR>|:!ruby "%:p"<CR>a
autocmd FileType ruby map <F10> <Esc>:!rspec "%:p"<CR>a
autocmd FileType python3 map <F10> <Esc>:!python3 "%:p"<CR>a
"""moving between file buffers
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!10<CR>
map ,n :bn!<CR>       "next buffer
map ,p :bp!<CR>       "previous buffer
map ,w :bw!<CR>        "close current file buffer
map + :al<CR>         "open all buffer
" map sort function to a key
vnoremap <Leader>s :sort<CR>

" dasier moving between tabs
map <Leader>n :tabnew<CR>  
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnest<CR>
map <Leader>q :tabclose<CR>

""" WebBrowser Preview
nnoremap <C-w>f :silent update<Bar>silent !firefox %:p &<CR>
nnoremap <C-w>c :silent update<Bar>silent !chromium-browser %:p &<CR>
nnoremap <C-w>i :silent update<Bar>silent !iexplorer %:p &<CR>
" nnoremap <C-w>o :silent update<Bar>silent !opera %:p &<CR>
" nnoremap <C-w>s :silent update<Bar>silent !safari %:p &<CR>

""" Quicksave command-not work
"noremap <C-s> :update<CR>
"vnoremap <C-s> :update<CR>
"inoremap <C-s> :update<CR>
""" Quick quit command
noremap <Leader>e :quit<CR>   " Quit current window                         
noremap <Leader>E :qa!<CR>    " Quit all windows
 " shift-Enter, 아래줄로 커서 넘기기
map <S-CR> <ESC>o
 " 현재 줄의 마지막에 이어쓰기
map! <C-TAB> <S-CR><ESC>i<BS>
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>"
set wmh=0
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l
imap <C-h> <C-o>h
imap <C-j> <C-g>j
imap <C-k> <C-g>k
imap <C-l> <C-o>
"Fix vi arrow keys in insert mode  No work"
":map!  xa    " [ctrl-v][backspace] [ctrl-v][esc]xa "
":map! <A-h> OD  " [ctrl-v][left-arrow] [ctrl-v][esc]ha "
":map! <-j> OB  " [ctrl-v][down-arrow] [ctrl-v][esc]ja "
":map! <A-k> OA  " [ctrl-v][up-arrow] [ctrl-v][esc]ka "
":map! <A-l> OC  " [ctrl-v][right-arrow] [ctrl-v][esc]la "
map <space> <C-f>
map <space><space> <C-b>
" easier moving between tabs
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" easier moving of code blocks
vnoremap < <gv   " better indentation
vnoremap > >gv   " better indentation
" Showing line numbers and length
set number " show line numbers
set tw=79  " width of document (used by gd)
set wrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight colorcolumn ctermbg=233

"경고음대신 번쩍이는 비쥬얼벨로 경고 사용
set novisualbell
" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile



"====== Plugin Setting, Python IDE Setup =========
"
""" FuzzyFinder Settings
nmap ,fb :FuzzyFinderBuffer<CR>
nmap ,ff :FuzzyFinderFile<CR>
nmap ,ft :FuzzyFinderTag<CR>

""" UltiSnips Settings
set runtimepath+=~/_vim/vundle/ultisnips
let g:UltiSnipsExpandTrigger="<c-9>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Show whitespace
" Must b inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\w\+$/
" Color scheme
" mkdir -P ~/.vim/colors && cd ~.vim/colors
" wget -O wombat256mod.vim http://www.im.org/scripts/download_script.php?src_id=13400
syntax enable
colorscheme wombat 
" Setup Pathogen to manage your plugins
" mkdir -P ~/.vim/autoload ~/.vom/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.git.com/tpope/vim-pathogen/HEAD/autoload/P
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RepeGotoDefinition()<CR>
let ropevim_enable_shortcuts=1
let g:pymode_rope_goto_def_newwin="vnew"
let g:pymode_rope_extended_complete=1
let g:pymode_breakpoint=0
let g:pymode_syntax=1
let g:pymode_sysntax_builtin_objs=0
let g:pymode_syntax_builtin_funcs=0
map <Leader>b 0import ipdb; ipdb.set_trace() #BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://strackoverflow.com/questions/170023/hot-to-map-keys-
"set completeopt=longest,menuone
" function! OmniPopup(action)
"   if pumvisible()
"	  if a:action == 'j'
"	     return "\<C-N>"
"	  elseif a:action == 'k'
"	     return "\<C-P>"
"	  endif
"   endif
"   return a:action
" endfunction
" 입력모드에서의 충돌 때문에 주석처리함.
" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup(;k;)<CR>

" Python folding
" mkdir -P ~/.vim/ftplugin
" wget -P ~/.vim/ftplugin/python_editing.vim http://www.vim.org/script
set nofoldenable
"===== pycon-apac-2012/vim as a Python IDE =====
"yank후에 마크위치로 이동하기에, 다시 커서를 이동시킴
vnoremap y y`>
"라인단위 yank후에 마크위치로 이동하기에, 다시 커서를 이동시킴
noremap Y Y`>
""붙여넣기 후 붙여넣기된 끝으로 커서이동
noremap p p`]
" 줄끝까지 복사
map Y y$
"비주얼블럭의 내용을 클립보드로 붙여넣기
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>
"Control+v키가 비주얼 블럭모드 키라서 Control+w로 대체 (에디트플러스의 Alt+w에서 착상)
"noremap <C-w> <C-v>
"클립보드의 내용을 vim으로 붙여넣기
nnoremap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" Python3 by andy, 2013.05.07
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set nocindent
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" 2013.04.11 by andy- one line space devide other contents. 
set ai cindent "자동 들여쓰기
" set background=dark
" map <F3> :NERDTreeFind<CR> " 작동하지 않음.
set rtp+=$VIMRUNTIME/bundle/vundle/
call vundle#rc()
" Ctags 설정
let Tlist_Ctags_Cmd="C:\Windows\ctags.exe"
set tags+=~/tags
set complete=.,w,b,u,t,i,]
set tagbsearch
" let Vundle manage Vundle
" GUI
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'https://github.com/Lokaltog/vim-powerline.git' 
" original repos on github
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'taglist.vim'
Bundle 'cscope.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
set encoding=utf-8
set guifont=Consolas:h11:cANSI
lang mes en_US
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
