# This is Unbunto12.04 ~/user/.vimrc

:version 7.2

let g:NERDTreeHijackNetrw=0
syntax on
filetype off
filetype plugin indent on
set history=700
set undolevels=700
set fileencodings=ucs-bom,utf-8,euc-kr,latin1
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set ruler
set expandtab
set hlsearch
nnoremap <ESC> :noh<CR>
set incsearch
set ignorecase
set smartcase
set paste   	"don't inline writing when paste it
set pastetoggle=<F2>  " 붙여넣기 모드에서 붙여넣기는 자동indent(들여쓰기) 방지.
set showmode   " 모드를 보여줌
set clipboard=unnamed
set makeprg=gcc\ -o\ %<\ % 
"nnoremap <silent> <F7> :TlistUpdate<CR>
"nnoremap <silent> <F8> :Tlist<CR>
"nnoremap <silent> <F9> :TlistSync<CR> 
"""<F2> : folding , <F3> : unfolding, <F4> : Tlist
map <F2> v]}zf
map <F3> zo
map <F4> :Tlist<CR><C-w><C-w>
autocmd FileType c map <F9> <Esc>:w!<CR>|:!gcc-o %< %<CR>a
autocmd FileType c map <F10> <Esc>:!./%<<CR>a
autocmd FileType cpp map <F9> <Esc>:w!<CR>|:!gcc-o %< %<CR>a
autocmd FileType cpp map <F10> <Esc>:!./%<<CR>a
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
""" Quicksave command-not work
"noremap <C-s> :update<CR>
"vnoremap <C-s> :update<CR>
"inoremap <C-s> :update<CR>
""" Quick quit command
noremap <Leader>e :quit<CR>   " Quit current window                         
noremap <Leader>E :qa!<CR>    " Quit all windows
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>"
set wmh=0
map <C-h> <C-w>h
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_
map <C-l> <C-w>l
"Fix vi arrow keys in insert mode  No work"
":map!  xa    " [ctrl-v][backspace] [ctrl-v][esc]xa "
":map! <A-h> OD  " [ctrl-v][left-arrow] [ctrl-v][esc]ha "
":map! <-j> OB  " [ctrl-v][down-arrow] [ctrl-v][esc]ja "
":map! <A-k> OA  " [ctrl-v][up-arrow] [ctrl-v][esc]ka "
":map! <A-l> OC  " [ctrl-v][right-arrow] [ctrl-v][esc]la "
map <space> <C-f>
map <space><space> <C-b>
" easier moving between tabs
map <Tab> :tabnew<CR>  
map <Tab>p :tabprevious<CR>  " Good work, n - p option
map <Tab>n :tabnext<CR>
map <Tab>q :tabclose<CR>
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" easier moving of code blocks
vmap <S-tab> <gv   " better indentation
vmap <tab> >gv   " better indentation
" Show whitespace
" Must b inserted BEFORE the cllorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\w\+$/
" Color scheme
" mkdir -P ~/.vim/colors && cd ~.vim/colors
" wget -O wombat256mod.vim http://www.im.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod

" Showing line numbers and length
set number " show line numbers
set tw=79  " width of document (used by gd)
set wrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
set colorcolumn=80
highlight colorcolumn ctermbg=233

"경고음대신 번쩍이는 비쥬얼벨로 경고 사용
set visualbell
" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -P ~/.vim/autoload ~/.vom/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.git.com/tpope/vim-pathogen/HEAD/autoload/P
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()

"====== Python IDE Setup =========

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
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
	if a:action == 'j'
	    return "\<C-N>"
	elseif a:action == 'k'
	    return "\<C-P>"
	endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup(;k;)<CR>

" Python folding
" mkdir -P ~/.vim/ftplugin
" wget -P ~/.vim/ftplugin/python_editing.vim http://www.vim.org/script
set nofoldenable
"===== pycon-apac-2012/vim as a Python IDE =====
"yank후에 마크위치로 이동하기에, 다시 커서를 이동시킴
vnoremap y y`>
"라인단위 yank후에 마크위치로 이동하기에, 다시 커서를 이동시킴
vnoremap Y Y`>
""붙여넣기 후 붙여넣기된 끝으로 커서이동
noremap p p`]
" 줄끝까지 복사
nnoremap Y y$
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
filetype plugin indent on

" 2013.04.11 by andy- one line space devide other contents. 
set ai "자동 들여쓰기
set background=dark
map <F3> :NERDTreeFind<CR>
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
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
