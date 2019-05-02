filetype off

call plug#begin('~/.vim/plugged')
	"Plug 'scrooloose/nerdtree' " Directory structure
	"Plug 'Xuyuanp/nerdtree-git-plugin' " Git integration with nerdtree
	Plug 'ryanoasis/vim-devicons' " dev icons for vim
	Plug 'rbgrouleff/bclose.vim'
	Plug 'francoiscabrol/ranger.vim' " Ranger
	Plug 'tpope/vim-vinegar' " Vinegar
	Plug 'itchyny/lightline.vim' " File info at bottom of vim
	Plug 'SirVer/ultisnips' " Snippet Engine
	Plug 'honza/vim-snippets' " Group of snippets
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
	Plug 'vim-ruby/vim-ruby' " ruby syntax
	"Plug 'vim-scripts/surround.vim' " Plugin to edit surrounding elements
	"Plug 'jiangmiao/auto-pairs' " self closing pairs
	Plug 'AndrewRadev/splitjoin.vim' " one/multi line function switches
	Plug 'kana/vim-submode' " submode
	Plug 'w0rp/ale' " Async Linting
	Plug 'tpope/vim-abolish' " String case coercion
	Plug 'chiedo/vim-case-convert'
	Plug 'leafgarland/typescript-vim' " Typescript support
call plug#end()

""""""""""""""""""
"""" Core
""""""""""""""""""
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
let &number=1 " Show current line number (using let syntax just because...)
"set relativenumber " Show relative line numbers
set ignorecase " ignore case in search
set smartcase " honor case if capital present
set wrap
nnoremap <leader><s-w> :set wrap!<cr>
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

""""""""""""""""
"" Ranger
""""""""""""""""
" This is a hack because of the way Ranger closes
noremap <leader>0 :syntax on<CR>
let g:ranger_command_override = 'ranger --cmd="unmap a" --cmd="map R rename_append"  --cmd="map D console mkdir " --cmd="map \% console touch " --cmd="set show_hidden=true"'
let g:ranger_map_keys = 0
noremap <leader>n :RangerWorkingDirectory<CR>
noremap <leader><s-n> :RangerCurrentFile<CR>
"noremap <leader>t :RangerWorkingDirectoryNewTab<CR>
"noremap <leader><s-t> :RangerCurrentFileNewTab<CR>

""""""""""""""""""""
""" Netrw
""""""""""""""""""""
set splitright
set splitbelow
noremap <leader>\ :vsplit .<CR>
noremap <leader>d :e .<CR>
noremap <leader>- :split .<CR>
noremap <leader>t :tabf .<CR>
noremap <leader>\| :vsplit %:h/<CR>
noremap <leader>_ :split %:h/<CR>
noremap <leader><s-b> :tabnew <CR>
noremap <leader><s-d> :Explore<CR>
noremap <leader><s-t> :tabf %:h/<CR>
"noremap <leader>v :vsplit .<CR>
"noremap <leader>d :e .<CR>
"noremap <leader>x :split .<CR>
"noremap <leader>t :tabf .<CR>
"noremap <leader><s-v> :vsplit %:h/<CR>
"noremap <leader><s-x> :split %:h/<CR>
"noremap <leader><s-d> :E<CR>
"noremap <leader><s-t> :tabf %:h/<CR>

"""""""""""""""""
""" Snippets
"""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/my-snippets/UltiSnips']
"let g:UltiSnipsListSnippets = "<c-r>"
"let g:UltiSnipsExpandTrigger="<tab>"

"""""""""""""""""
""" FZF
"""""""""""""""""
" For File search
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l ""'
" For Ag full text search
" Default options are --nogroup --column --color
let s:ag_options = ' --hidden '

let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-space': 'split',
	\ 'ctrl-v': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history' " Enable per-command history.
let g:esearch = {'use': 'visual'} " Esearch with visual text
let g:ag_apply_qmappings=1
let g:ag_mapping_message=1
" Open file finder
noremap <leader>p :Files<CR>
" Open file finder full screen
noremap <leader><s-p> :Files!<CR>
" Ag search full-screen
noremap <leader>f :Ag<CR>
" Ag search
noremap <leader><s-f> :Ag!<CR>
command! -bang -nargs=* Ag
			\ call fzf#vim#ag(<q-args>,
			\   s:ag_options,
			\  <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
			\          : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
			\  <bang>0)

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

""""""""""""""""
"" Linting
""""""""""""""""
"function! TrimWhiteSpace()
	"let l = line(".")
	"let c = col(".")
	"%s/\s\+$//e
	"%s/\r//ge
	"call cursor(l, c)
"endfunction
"autocmd BufWritePre * :call TrimWhiteSpace() " Trim trailing spaces on save
let g:ale_linters = { 'elixir': ['dialyxir'] }
let g:ale_sign_column_always = 1
"let g:ale_fix_on_save = 1
let g:ale_fixers = { 'elixir': ['mix_format'], 'javascript': ['prettier', 'eslint'], 'ruby': ['rubocop'] }

""""""""""""""""""
"""" Navigation
""""""""""""""""""
" Horizontal
noremap L $
noremap H 0
" Go through changelist. Also remember <C-o> & <C-i> for going through jumplist
nnoremap <C-f> g,
nnoremap <C-b> g;
" Tabs
nnoremap <C-n> gt
nnoremap <C-p> gT
"noremap <C-h> <C-w>h
"noremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"noremap <C-l> <C-w>l

"""""""""""""""""""""""
""" Search and Replace
"""""""""""""""""""""""
" Search and replace word under cursor
nnoremap <Leader>r :%s/<C-r><C-w>//gc<left><left><left>
" Search and replace word in clipboard
nnoremap <Leader><s-r> :%s/<C-r>0//gc<left><left><left>

""""""""""""""""""""
""" Buffers/Windows
""""""""""""""""""""
noremap <C-w>] :bnext<CR>
noremap <C-w>[ :bprev<CR>
noremap <C-w>x :bd<CR>
noremap <leader>x :bd<CR>
noremap ; :Buffers<CR>
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
noremap <leader>e :edit!<CR>
noremap <leader><s-e> :edit!<CR>

""""""""""""""""""""
""" Resizing Windows
""""""""""""""""""""
let g:submode_timeout=0
call submode#enter_with('resize', 'n', '', '<c-w>+', '<c-w>+')
"call submode#enter_with('resize', 'n', '', '<leader>_', '<leader>_')
call submode#map('resize', 'n', '', 'l', ':vertical res +5<CR>')
call submode#map('resize', 'n', '', 'h', ':vertical res -5<CR>')
call submode#map('resize', 'n', '', 'k', ':res +5<CR>')
call submode#map('resize', 'n', '', 'j', ':res -5<CR>')

"""""""""""""""""""""
""" Quick File Edits
"""""""""""""""""""""
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :tabf $MYVIMRC<cr>
nnoremap <leader>ec :tabf $HOME/comprc<cr>
nnoremap <leader>es :UltiSnipsEdit<cr>

""""""""""""""""
""" Tests
""""""""""""""""
" Elixir
au FileType elixir call s:elixir_test_bindings()
function! s:elixir_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && mix test %\\:" . line(".")<CR>
  nnoremap <buffer> <Leader><s-a> :execute "!clear && mix test %"<CR>
endfunction
" Ruby
au FileType ruby call s:ruby_test_bindings()
function! s:ruby_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && bin/rspec %\\:" . line(".")<cr>
  nnoremap <buffer> <Leader><s-a> :!clear && bin/rspec %<cr>
endfunction
" JS
au FileType javascript call s:js_test_bindings()
function! s:js_test_bindings()
  nnoremap <buffer> <Leader>a :execute "!clear && npm run test %\\:" . line(".")<cr>
  nnoremap <buffer> <Leader><s-a> :!clear && npm run test %<cr>,
endfunction

"""""""""""""""""""
""" Transformations
"""""""""""""""""""
" Elixir
au FileType elixir call s:elixir_transformation_bindings()
function! s:elixir_transformation_bindings()
    " Switch string map to atom map
    vnoremap <S-a> :s/"\([a-z_0-9]*\)" =>/\=submatch(1).':'/g<CR>
    " Switch atom map to string map
    vnoremap <S-s> :s/\([a-z_0-9]*\):/\='"'.submatch(1).'" =>'/g<CR>
endfunction

vnoremap crs :CamelToSnakeSel!<CR>
vnoremap crc :SnakeToCamelSel!<CR>

""""""""""""""""
""" Macros
""""""""""""""""
"let @[key]='[macro-hash]'
" Commatize
let @c="Ea,\<Esc>ll"

""""""""""""""""
""" Movements
""""""""""""""""
onoremap p i(
onoremap l i[
onoremap c i{
onoremap ' i'
onoremap " i"
onoremap h it
"onoremap < i<

""""""""""""""""""""
""" Move Text Blocks
""""""""""""""""""""
" Normal mode
"nnoremap <leader>j :m .+1<CR>==
"nnoremap <leader>k :m .-2<CR>==

"" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

"" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"""""""""""""""""""""""
""" Things to Remember
"""""""""""""""""""""""
" run bash command
" :! [bash command]
"
" run bash command with output printed into file
" :.! [bash command] 
"
" takes file back in time
" :earlier 15m 
"
" reverses earlier command
" :later 15m
"
" edit permissioned file
" :w !sudo tee %
"
" reselects last visual selection
" gv
"
" create HTML render of current file
" :%TOhtml
"
" open up html of website
" vim http://stackoverflow.com/
"
" Set bookmark
" m [char]
"
" Go to bookmark
" ' [char]
"
" Multiple Clipboards
" " [char] [operation]
"
"
