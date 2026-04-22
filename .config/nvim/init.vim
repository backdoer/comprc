filetype off

call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons' " dev icons for vim
Plug 'nvim-lua/plenary.nvim' " Required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' } " Fuzzy finder
Plug 'nvim-telescope/telescope-file-browser.nvim' " File browser
Plug 'itchyny/lightline.vim' " File info at bottom of vim
Plug 'SirVer/ultisnips' " Snippet Engine
Plug 'honza/vim-snippets' " Group of snippets
Plug 'scrooloose/nerdcommenter' " Comment support
Plug 'pangloss/vim-javascript' " Javascript support for vim
Plug 'mxw/vim-jsx' " Jsx support for vim
Plug 'tpope/vim-fugitive' " Vim git integration
Plug 'airblade/vim-gitgutter' " Vim gutter integration
Plug 'rafi/awesome-vim-colorschemes' " Vim color schemes
Plug 'christoomey/vim-tmux-navigator' " used for pane nav with tmux
Plug 'tpope/vim-repeat' " Plugin to add support for repeating surround commands (and other plugins)
Plug 'alvan/vim-closetag' " Auto close html tags
Plug 'backdoer/splitjoin.vim' " fork of splitjoin including elixir functions
Plug 'leafgarland/typescript-vim' " Typescript support
Plug 'peitalin/vim-jsx-typescript' " Typescript support
Plug 'neoclide/coc.nvim', {'commit': '7b9e1ef0a1399907c51d23b6080b94a5aba4a654'}
Plug 'kana/vim-textobj-user' " Define custom text objects
Plug 'andyl/vim-textobj-elixir' " Elixir text objects
Plug 'styled-components/vim-styled-components'
call plug#end()

""""""""""""""""""
"""" Core
""""""""""""""""""
syntax on
colorscheme onedark " theme
let mapleader = "\<Space>"
set clipboard=unnamedplus "Use system clipboard (neovim)
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

" Elixir Template Syntax Support
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" Javascript Template Syntax Support
au BufRead,BufNewFile *.js.mustache set filetype=javascript

""""""""""""""""
"" File Browser (Telescope)
""""""""""""""""
noremap <leader>n :Telescope file_browser path=%:p:h select_buffer=true<CR>
noremap <leader><s-n> :Telescope file_browser<CR>

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

"""""""""""""""""
""" Snippets
"""""""""""""""""
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="tab"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/nvim/UltiSnips']

"""""""""""""""""
""" Telescope
"""""""""""""""""
" File finder (replaces :Files)
noremap <leader>p :Telescope find_files hidden=true<CR>
" File finder with no ignore (replaces :Files!)
noremap <leader><s-p> :Telescope find_files hidden=true no_ignore=true<CR>
" Live grep (replaces :Ag)
noremap <leader>f :Telescope live_grep<CR>
" Grep string under cursor (replaces :Ag!)
noremap <leader><s-f> :Telescope grep_string<CR>


"""""""""""""""""
""" Typescript
"""""""""""""""""
let g:typescript_indent_disable = 1

"""""""""""""""""""""
""" COC
"""""""""""""""""""""

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pyright', 'coc-elixir', '@yaegassy/coc-tailwindcss3']

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> D :call CocAction('doHover')<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

function! ShowDocIfNoDiagnostic(timer_id)
	if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
		silent call CocActionAsync('doHover')
	endif
endfunction

" options for quick fixes
nmap <leader>do <Plug>(coc-codeaction)
" go to definition
nmap <silent>gd <Plug>(coc-definition)
" go to type definition
nmap <silent>gy <Plug>(coc-type-definition)
"nmap <leader>rn <Plug>(coc-rename)
"

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

""""""""""""""""""
"""" Navigation
""""""""""""""""""
" Horizontal
noremap L $
noremap H 0
noremap T ^
" Go through changelist. Also remember <C-o> & <C-i> for going through jumplist
nnoremap <C-f> g,
nnoremap <C-b> g;
" Tabs
nnoremap <C-n> gt
nnoremap <C-p> gT

"""""""""""""""""""""""
""" Search and Replace
"""""""""""""""""""""""
" Search and replace
nnoremap <Leader>r :%s///gc<left><left><left><left>
" Search and replace word in clipboard
nnoremap <Leader><s-r> :%s/<C-r>0//gc<left><left><left>

""""""""""""""""""""
""" Buffers/Windows
""""""""""""""""""""
noremap <C-w>] :bnext<CR>
noremap <C-w>[ :bprev<CR>
noremap <C-w>x :bd<CR>
noremap <leader>x :bd<CR>
noremap ; :Telescope buffers<CR>
noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
noremap <leader>e :edit!<CR>
noremap <leader><s-e> :edit!<CR>

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
  vnoremap <leader>a :s/"\([a-z_0-9]*\)" =>/\=submatch(1).':'/g<CR>
  " Switch atom map to string map
  vnoremap <leader>s :s/\([a-z_0-9]*\):/\='"'.submatch(1).'" =>'/g<CR>
  " Switch atom map to json object
  vnoremap <leader>j :s/\([a-z_0-9]*\):/\='"'.submatch(1).'":'/g \| :'<,'>s/%{/{/g <CR>
  " Switch json object to elixir atom map
  vnoremap <leader>e :s/"\([a-z_0-9]*\)":/\=submatch(1).':'/g \| :'<,'>s/{/%{/g <CR>
endfunction

" General
vnoremap crs :CamelToSnakeSel!<CR>
vnoremap crc :SnakeToCamelSel!<CR>

nnoremap <Leader>sw :Sur / /<left><left>
nnoremap <Leader>sl :SurL / /<left><left>

" Surround each line in a file with a front and a back
command! -nargs=* SurL :call SurroundLines(<f-args>)
function SurroundLines(front, back)
  let command = "normal i" . a:front[1:] . "\<Esc>La" . a:back[1:] . "\<Esc>jH"
  while line('.') < line('$')
    execute command
  endwhile
  execute command
endfunction

" Surround each word in a line with a front and a back
command! -nargs=* Sur :call SurroundWords(<f-args>)
function SurroundWords(front, back)
  let command = "normal i" . a:front[1:] . "\<Esc>Ea" . a:back[1:] . "\<Esc>W"
  while col('.') < strwidth(getline('.'))
    execute command
  endwhile
  execute command
endfunction

nnoremap <S-k> :s/ /\r/g<cr>

"""""""""""""""""""
""" Close tag
"""""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx"

"""""""""""""""""""
""" Mustache templates
"""""""""""""""""""
au BufReadPost *.mustache set syntax=html


"""""""""""""""
""" Macros
""""""""""""""""
let @r="12ddvEebhxjddveeeeebhxkJjH5ddddddkJHj"

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
" Record macro
" q [letter]
"
" Run macro
" @ [letter]

"""""""""""""""""""""
""" Telescope Setup
"""""""""""""""""""""
lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { ".git/" },
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ["<C-t>"] = require('telescope.actions').select_tab,
        ["<C-v>"] = require('telescope.actions').select_vertical,
        ["<C-space>"] = require('telescope.actions').select_horizontal,
      },
    },
  },
}
require('telescope').load_extension('file_browser')
EOF
