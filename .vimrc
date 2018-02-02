filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/surround.vim'
Plug 'ap/vim-buftabline'
Plug 'Yggdroot/LeaderF'
Plug 'eugen0329/vim-esearch'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
call plug#end()

" Allow multiple buffers to be open at once
set hidden

"Use system clipboard
:set clipboard=unnamed

"Backspace
set backspace=2 " make backspace work like most other programs

" Allow incremental search
set incsearch

" set line numbers
set number

" Automatically start NERDTree on open
autocmd VimEnter * NERDTree

" Automatically close vim if NERDTree is only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Pushing 't' will toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

"Open file finder"
map <C-p> :LeaderfFile<CR>

" Highlight Current Line
" :set cursorline

" Syntax Coloring
"
" :set spell
" :set spl=en
:syntax on
:colorscheme desert

" Buffers
set hidden
nnoremap <C-]> :bnext<CR>
nnoremap <C-[> :bprev<CR>

" enable mouse
:set mouse=a

au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"

" Source the vimrc file after saving it
if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
endif
