" Basic Setup:
set nocompatible
syntax enable
filetype plugin on

" Line Numbers
"set relativenumber
set number

set path+=**
set wildmenu

" Enable mouse and default to system clipboard (+)
set mouse=a
set clipboard=unnamedplus

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l


" Vim-Plug
" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/pack/bundle')
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'mattn/emmet-vim'
call plug#end()


" NERDTree
nmap <C-f> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Vim-Test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Emmet
let g:user_emmet_leader_key = '<C-y>'
