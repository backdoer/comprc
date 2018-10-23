filetype off

call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree' " Directory structure
"Plug 'Xuyuanp/nerdtree-git-plugin' " Git integration with nerdtree
Plug 'francoiscabrol/ranger.vim' " Ranger
Plug 'tpope/vim-vinegar' " Vinegar
Plug 'itchyny/lightline.vim' " File info at bottom of vim
Plug 'SirVer/ultisnips' " Snippet Engine
Plug 'honza/vim-snippets' " Group of snippets
Plug 'elixir-editors/vim-elixir' " Elixir support for vim
"Plug 'slashmili/alchemist.vim' " Elixir support for vim
Plug 'scrooloose/nerdcommenter' " Comment support
Plug 'pangloss/vim-javascript' " Javascript support for vim
Plug 'mxw/vim-jsx' " Jsx support for vim
"Plug 'mattn/emmet-vim' " Html expansion
"Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'airblade/vim-gitgutter' " Vim gutter integration
Plug 'rafi/awesome-vim-colorschemes' " Vim color schemes
Plug 'tmux-plugins/vim-tmux-focus-events' " Tmux and vim integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder for file names/content
Plug 'junegunn/fzf.vim' " Vim plugin for fzf
Plug 'christoomey/vim-tmux-navigator' " used for pane nav with tmux
Plug 'ryanoasis/vim-devicons' " dev icons for vim
Plug 'vim-ruby/vim-ruby' " ruby syntax
"Plug 'vim-scripts/surround.vim' " Plugin to edit surrounding elements
"Plug 'jiangmiao/auto-pairs' " self closing pairs
Plug 'AndrewRadev/splitjoin.vim' " one/multi line function switches
Plug 'kana/vim-submode' " submode
call plug#end()

set shell=bash

"""""""""""""""""
""" Core
"""""""""""""""""
syntax on
colorscheme onedark " theme
set re=1 " This uses a different regex engine more suited for ruby
let mapleader = "\<Space>"
set clipboard=unnamed "Use system clipboard
set backspace=2 " make backspace work like most other programs
set incsearch " Allow incremental search
set autoread " Auto-reload changed files
set hidden " allow multiple buffers
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set noswapfile " Disable .swp files
set number
"set relativenumber
"set nofoldenable " Enables code folding
"set foldmethod=syntax
"set foldlevel=1

"""""""""""""""""
""" Nerd Tree
"""""""""""""""""
"let NERDTreeMapOpenSplit='<C-x>'
"let NERDTreeMapOpenVSplit='<C-v>'
"let NERDTreeMapOpenInTab='<C-t>'
"let g:NERDTreeMapJumpPrevSibling="" " To allow tmux/vim navigation
"let g:NERDTreeMapJumpNextSibling="" " To allow tmux/vim navigation
"let NERDTreeShowHidden=1 " Display ignored files in NERDTree
"autocmd bufenter * if (winnr("$") == 1
			"\ && exists("b:NERDTree")
			"\ && b:NERDTree.isTabTree())
			"\ | q | endif " Automatically close vim if NERDTree is only buffer left
"autocmd VimEnter * NERDTree " Automatically start NERDTree on open
"let g:NERDTreeWinSize=40
"map <leader>n :NERDTreeToggle<CR>
"map <leader><s-n> :NERDTreeFind<CR>

"""""""""""""""""
""" Ranger
"""""""""""""""""
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
noremap <leader>n :RangerWorkingDirectory<CR>
noremap <leader><s-n> :RangerCurrentFile<CR>
let g:ranger_map_keys = 0
noremap <leader>t :RangerWorkingDirectoryNewTab<CR>
noremap <leader><s-t> :RangerCurrentFileNewTab<CR>

""""""""""""""""""""
""" Netrw
""""""""""""""""""""
noremap <leader>v :vsplit .<CR>
noremap <leader>x :split .<CR>
noremap <leader><s-v> :vsplit %:h/<CR>
noremap <leader><s-x> :split %:h/<CR>

"""""""""""""""""
""" Snippets
"""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/my-snippets/UltiSnips']
let g:UltiSnipsListSnippets = "<c-r>"
"let g:UltiSnipsExpandTrigger="<tab>"

"""""""""""""""""
""" FZF
"""""""""""""""""
let g:fzf_history_dir = '~/.local/share/fzf-history' " Enable per-command history.
let g:esearch = {'use': 'visual'} " Esearch with visual text
let g:ag_apply_qmappings=1
let g:ag_mapping_message=1
map <leader>p :Files<CR> " Open file finder
map <leader><s-p> :Files!<CR> " Open file finder full screen
map <leader>f :Ag<CR> " Ag search full-screen
map <leader><s-f> :Ag!<CR> " Ag search
command! -bang -nargs=* Ag
			\ call fzf#vim#ag(<q-args>,
			\   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
			\   <bang>0) "Ag will show file contents with a preview

command! -bang -nargs=* Files
			\ call fzf#vim#files(<q-args>,
			\   <bang>0 ? fzf#vim#with_preview('up:60%')
			\           : fzf#vim#with_preview('right:50%:hidden', '?'),
			\   <bang>0) "Ag will show file names with a preview

"""""""""""""""""
""" Lightline
"""""""""""""""""
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction
set laststatus=2 " always enable lightline even if nerdtree isn't toggled

"""""""""""""""""
""" Linting
"""""""""""""""""
function! TrimWhiteSpace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  %s/\r//ge
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace() " Trim trailing spaces on save

"""""""""""""""""
""" Navigation
"""""""""""""""""
map L $
map H 0
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"""""""""""""""""""""""
""" Search and Replace
"""""""""""""""""""""""
" Search and replace word under cursor
nnoremap <Leader>r :%s/<C-r><C-w>//g<left><left>
" Search and replace word in clipboard
nnoremap <Leader><s-r> :%s/<C-r>0//g<left><left>

""""""""""""""""""""
""" Buffers/Windows
""""""""""""""""""""
map <C-w>] :bnext<CR>
map <C-w>[ :bprev<CR>
map <C-w>x :bd<CR>
map ; :Buffers<CR>
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
noremap <leader>e :edit!<CR>
map <leader><s-e> :edit!<CR>

""""""""""""""""""""
""" Resizing Windows
""""""""""""""""""""
call submode#enter_with('resize', 'n', '', '<leader>+', '<leader>+')
call submode#enter_with('resize', 'n', '', '<leader>_', '<leader>_')
call submode#map('resize', 'n', '', '=', ':vertical res +5<CR>')
call submode#map('resize', 'n', '', '-', ':vertical res -5<CR>')
call submode#map('resize', 'n', '', '+', ':res +5<CR>')
call submode#map('resize', 'n', '', '_', ':res -5<CR>')

"""""""""""""""""""""
""" Quick File Edits
"""""""""""""""""""""
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ec :vsplit $HOME/comprc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr>

""""""""""""""""
""" Tests
""""""""""""""""
"nmap <Leader>t :execute "!clear && mix test %\\:" . line(".")<CR>
"nmap <Leader>T :execute "!clear && mix test %"<CR>
