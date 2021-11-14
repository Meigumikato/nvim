"===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" " TODO:  <11-11-21, yourname> "
" nerdtree 打开时创建标签页
" clipboard
"set clipboard=unnamedplus
" number
set number
set relativenumber


filetype plugin on
" leader 键位设置为空格
let mapleader=" "

" 快速关闭
noremap <LEADER>q :q<CR>

" 键位映射
" 垂直分屏
noremap <LEADER>d :split<CR>
noremap <LEADER>D :vsplit<CR>

" 标签页快捷键
" 添加标签
noremap <LEADER>t :tabedit<CR>
"noremap <LEADER>T :tabe split<CR>
" 关闭标签
noremap <LEADER>w :bd<CR>
" 标签切换   
noremap <LEADER>} :tabnext<CR>
noremap <LEADER>{ :tabprev<CR>

" 全局查找并且替换（search and replace） 
noremap <C-r> :%s///gc<left><left><left>
" 保存
noremap <LEADER>s :w<CR>

"=======
"==plugin list
"=======
call plug#begin('$HOME/.config/nvim/plugged')
" status bar plugin
Plug 'vim-airline/vim-airline'
" status bar theme
Plug 'vim-airline/vim-airline-themes'
"auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"directory tree"
Plug 'scrooloose/nerdtree'
"directory tree icon"
Plug 'ryanoasis/vim-devicons'
"directory tree syntax highlight
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"directory tree convience
Plug 'jistr/vim-nerdtree-tabs'
" syntax 
Plug 'sheerun/vim-polyglot'
"gruvbox theme
Plug 'morhetz/gruvbox'
" go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"vim surround "
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" nerdcomment
Plug 'preservim/nerdcommenter'

Plug 'tomasr/molokai'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" snippets
Plug 'honza/vim-snippets'
"cmake
Plug 'cdelledonne/vim-cmake'
" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" tmux completion
Plug 'wellle/tmux-complete.vim'
" mutil visual 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" vim ranger
Plug 'kevinhwang91/rnvimr'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" ==
" NERDTree
"
nmap <LEADER>` :NERDTreeFocusToggle<CR>
nmap <LEADER>p :NERDTree<CR>
" ===
" === coc.nvim
" ===
set updatetime=300
set shortmess+=c
set hidden
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-clangd',
	\'coc-clang-format-style-options',
	\'coc-cmake',
	\'coc-go',
	\'coc-sh',
	\'coc-golines',
	\'coc-highlight',
	\'coc-thrift-syntax-support',
	\'coc-snippets',
	\'coc-translator',
	\'coc-vimlsp']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> to completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


nmap tr <Plug>(coc-translator-p)
vmap tr <Plug>(coc-translator-pv)

"==================
"=airline config===
"==================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#close_symbol = 'X'

" buffer index
let g:airline#extensions#tabline#buffer_idx_mode = 1

" buffer switch
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}
noremap db :db<CR>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader><left> <Plug>AirlineSelectPrevTab
nmap <leader><right> <Plug>AirlineSelectNextTab


let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" buffer close
nmap db :db<CR>



"=======
"==theme
"=======
" gruvbox theme 
colorscheme gruvbox
"colorscheme molokai

"=======
"==snippets
"=======
"imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"xmap <leader>x  <Plug>(coc-convert-snippet)


"=======
"==cmake plugin
"=======
"noremap cg :CMakeGenerate<CR>
noremap cg :CMakeGenerate<CR>
noremap cb :CMakeBuild<CR>
noremap ci :CMakeInstall<CR>
noremap cq :CMakeClose<CR>


let g:cmake_default_config="build"






"=======
"==pnerdcomment
"=======
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" ===
" === Terminal Colors
" ===

let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'



"=======
"==rnvimr
"=======
"M -- ALT
nnoremap <silent> <C-p> :RnvimrToggle<CR>
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1
" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70
" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLin
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-d>': 'NvimEdit split',
            \ '<C-x>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }


" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }



"=======
"==vim-go
"=======
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
"let g:go_textobj_enabled = 0
"let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_trailing_whitespace_error = 1
"let g:go_highlight_types = 1
"let g:go_highlight_variable_assignments = 0
"let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

