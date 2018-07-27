"
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree' " Directory structure
Plug 'Xuyuanp/nerdtree-git-plugin' " Git integration with nerdtree
Plug 'itchyny/lightline.vim' " File info at bottom of vim
Plug 'SirVer/ultisnips' " Snippet Engine
Plug 'honza/vim-snippets' " Group of snippets
"Plug 'Shougo/neocomplete.vim' " Neocomplete
"Plug 'Shougo/neosnippet.vim'
"Plug 'vim-scripts/surround.vim' " Plugin to edit surrounding elements
Plug 'elixir-editors/vim-elixir' " Elixir support for vim
Plug 'slashmili/alchemist.vim' " Elixir support for vim
Plug 'scrooloose/nerdcommenter' " Comment support
Plug 'pangloss/vim-javascript' " Javascript support for vim
Plug 'mxw/vim-jsx' " Jsx support for vim
"Plug 'mattn/emmet-vim' " Html expansion
Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'airblade/vim-gitgutter' " Vim gutter integration
Plug 'rafi/awesome-vim-colorschemes' " Vim color schemes
Plug 'tmux-plugins/vim-tmux-focus-events' " Tmux and vim integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder for file names/content
Plug 'junegunn/fzf.vim' " Vim plugin for fzf
Plug 'christoomey/vim-tmux-navigator' " used for pane nav with tmux
Plug 'ryanoasis/vim-devicons' " dev icons for vim
call plug#end()

" Syntax Coloring
syntax on
colorscheme onedark

let NERDTreeShowHidden=1 " Display ignored files in NERDTree
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/my-snippets/UltiSnips']
let g:UltiSnipsListSnippets = "<c-r>"
let g:fzf_history_dir = '~/.local/share/fzf-history' " Enable per-command history.
let g:esearch = {'use': 'visual'} " Esearch with visual text
let mapleader = "\<Space>"
let g:ag_apply_qmappings=1
let g:ag_mapping_message=1
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

" Settings
set clipboard=unnamed "Use system clipboard
set backspace=2 " make backspace work like most other programs
set incsearch " Allow incremental search
set autoread " Auto-reload changed files
set number
"set relativenumber
set hidden " allow multiple buffers
"set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
"set expandtab " On pressing tab, insert 2 spaces
set noswapfile " Disable .swp files
"set mouse=a " enable mouse
set laststatus=2 " always enable lightline even if nerdtree isn't toggled
"set nofoldenable                                " Enables code folding
"set foldmethod=syntax
"set foldlevel=1

" Autocmd
function! TrimWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  %s/\r//ge
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace() " Trim trailing spaces on save
autocmd VimEnter * NERDTree " Automatically start NERDTree on open
autocmd bufenter * if (winnr("$") == 1
      \ && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree())
      \ | q | endif " Automatically close vim if NERDTree is only buffer left
"autocmd bufwritepost .vimrc source $MYVIMRC " Source the vimrc file after saving it

" Mappings
map <leader>n :NERDTreeToggle<CR>
map <leader><s-n> :NERDTreeFind<CR>
" Open file finder"
map <leader>p :Files<CR>
" Open file finder full screen
map <leader><s-p> :Files!<CR>
" Search and replace word under cursor
nnoremap <Leader>r :%s/<C-r><C-w>//g<left><left>
" Search and replace word in clipboard
nnoremap <Leader><s-r> :%s/<C-r>0//g<left><left>
map <C-w>] :bnext<CR>
map <C-w>[ :bprev<CR>
map <C-w>x :bd<CR>
map <leader>f :Ag<CR> " Ag search full-screen
map <leader><s-f> :Ag!<CR> " Ag search
map L $
map H 0

" Map to make it easier to edit and source config files
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>ec :edit $HOME/comprc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"" Differentiate from input and normal mode
"au InsertEnter * silent execute "!echo -en \<esc>[5 q"
"au InsertLeave * silent execute "!echo -en \<esc>[2 q"

"Ag will only show file contents with a preview
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \   <bang>0)

"Ag will only show file names with a preview
command! -bang -nargs=* Files
      \ call fzf#vim#files(<q-args>,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
