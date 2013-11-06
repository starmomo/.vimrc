:version 4.4
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-kr,cp949,euc-jp,shift-jis,big5,latin1,ucs-21e
set guifont=Consolas:h11:cANSI
set guifont=Bitstream_Vera_Sans_Mono:h9
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim  " ~/.vim/my_mswin.vim

set t_Co=256
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
endfunction

let s:cpo_save=&cpo
set cpo&vim
" let g:NERDTreeNetrw=0
autocmd vimenter * if !argc() | NERDTree | endif "bufenter * if (winnr("$") ==1 && exists("b:NERDTreeType") && b:NERDTreeType =="primary") |q|endif
" vim-preview plugin
" Clolr scheme
" mkdir -p ~/.vim/colors && cd ~.vim/color
" wget -O wombat256mod.vim
" http://www.im.org/scripts/download_script.php?rsrc_id=13400
syntax on
colorscheme wombat256mod  " dmolokai 
filetype off
filetype plugin on
filetype indent on
ca ㅈ q!
ca ㅈㅂ wq!
set modifiable
set history=700
set undolevels=700
set tabstop=4 softtabstop=4 shiftwidth=4
set number shiftround ruler expandtab hlsearch
""
""Webbrowser Preview
nnoremap <C-w>f :silent update<Bar>silent !firefox %:p &<CR>
nnoremap <C-w>c :silent update<Bar>silent !chromium-browser %:p &<CR>
"""Quick save command
map <C-s> :update<CR>
vnoremap <Leader>s :sort<CR>
nnoremap <Leader>e :q!<CR>
nnoremap <Leader>E :qa!<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <S-CR> <ESC>o
inoremap jj <Esc>
nnoremap no :noh<CR>

set wmh=0
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l
imap <C-h> <C-o>h
imap <C-j> <C-g>j
imap <C-k> <C-g>k
imap <C-l> <C-o>l
map <space> <C-f>
map <space><space> <C-b>

" Rebind <Leader> key
let mapleader=","
map <Leader>n :tabnew<CR>
map <Leader>m <Esc>:tabprevious<CR>
map <Leader>. :tabn<CR>
map <Leader>q :tabclose<CR>

"""===install or plugin use====="""
" ctags install $ ctags -R "add path in .vimrc
" set tags +=~/tags,tags,../tags,../../tags
" Setting for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'jQuery'
Bundle 'Align'
Bundle 'tComment'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle 'molokai'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'AutoComplPop'
"Error: taglist: exuberant ctags [http://ctags.sf.net] not found in path. plugin is not
"loaded.
"sudo apt-get install ctags
Bundle 'taglist.vim'
Bundle 'cscope.vim'
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-rails.git'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'file:///home/starmomo/.vim/'
" ...

filetype plugin indent on " required!
"
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
