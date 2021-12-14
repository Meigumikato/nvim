" _ __ ___  _   ___   _(_)_ __ ___  
"| '_ ` _ \| | | \ \ / / | '_ ` _ \ 
"| | | | | | |_| |\ V /| | | | | | |
"|_| |_| |_|\__, | \_/ |_|_| |_| |_|
"           |___/                   
"
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" " TODO:  <11-11-21, yourname> "
" clipboard
"set clipboard=unnamedplus
" number
set number
set relativenumber
set background=dark
" tab
set tabstop=4
set shiftwidth=4
set nobackup
set nowritebackup
set expandtab
set autoindent
" fold 
set foldlevel=99
set foldenable
set foldmethod=manual

" scrol
filetype on
filetype plugin on
syntax enable
filetype plugin indent on


xnoremap +y "+y 
noremap <space>no :nohlsearch<CR>
noremap <space>q :q<CR>
noremap <space>d :split<CR>
noremap <space>D :vsplit<CR>
"noremap <space>dk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
"noremap <space>dj :set splitbelow<CR>:split<CR>
"noremap <space>Dh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
"noremap <space>Dl :set splitright<CR>:vsplit<CR>

exec "nohlsearch"
xnoremap +y "+y 
noremap <space>no :nohlsearch<CR>
noremap <space>q :q<CR>
noremap <space>d :split<CR>
noremap <space>D :vsplit<CR>
"noremap <space>dk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
"noremap <space>dj :set splitbelow<CR>:split<CR>
"noremap <space>Dh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
"noremap <space>Dl :set splitright<CR>:vsplit<CR>

nmap <space>t :tabnew<CR>
noremap <space>wj  <C-w>j
noremap <space>wk  <C-w>k
noremap <space>wh  <C-w>h
noremap <space>wl  <C-w>l
noremap <space>wq  <C-w>o
noremap <space>ww  <C-w>w
noremap <space><left> :tabnext<CR>
noremap <space><right> :tabprev<CR>

"noremap <space><up> :res +5<CR>
"noremap <space><down> :res -5<CR>
"noremap <space><left> :vertical resize-5<CR>
"noremap <space><right> :vertical resize+5<CR>

noremap <space>s :w<CR>
" open file restore cursor location
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

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
"directory tree icon"
Plug 'ryanoasis/vim-devicons'
" syntax 
Plug 'sheerun/vim-polyglot'
" go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"vim surround "
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" nerdcomment
Plug 'preservim/nerdcommenter'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" snippets
Plug 'honza/vim-snippets'
"cmake
Plug 'cdelledonne/vim-cmake'
" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" mutil visual 
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" vim ranger
" rainbow bracket
Plug 'luochen1990/rainbow'
"c++ additional highlight
Plug 'octol/vim-cpp-enhanced-highlight'
" deus theme
Plug 'ajmwagar/vim-deus'
"vim term
Plug 'voldikss/vim-floaterm'
" undo tree
Plug 'mbbill/undotree'
"easy motion
Plug 'easymotion/vim-easymotion'
"start menu
Plug 'mhinz/vim-startify'
"tag list
Plug 'majutsushi/tagbar'
" sensiable
Plug 'tpope/vim-sensible'
Plug 'mg979/vim-xtabline'
Plug 'brooth/far.vim'
Plug 'Yggdroot/indentLine'
" rust
Plug 'rust-lang/rust.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()


"=======
"==far
"=======

noremap <LEADER>f :F  **/*<left><left><left><left><left>



"=======
"==rainbow
"=======
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ===
" === coc.nvim
" ===
set updatetime=300
set shortmess+=c
set hidden
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-clang-format-style-options',
	\'coc-cmake',
	\'coc-sh',
	\'coc-highlight',
    \'coc-go',
	\'coc-thrift-syntax-support',
	\'coc-snippets',
    \'coc-explorer',
    \'coc-translator',
    \'coc-rust-analyzer',
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
inoremap <silent><expr> <c-space> coc#refresh()

" <CR> to completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use H to show documentation in preview window.
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
" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" translator
nmap <space>tr <Plug>(coc-translator-p)
vmap <space>tr <Plug>(coc-translator-pv)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


nmap <space>e <Cmd>CocCommand explorer
    \ --toggle
    \ --sources=buffer+,file+<CR>

function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

function! s:init_explorer()
  set winblend=10
" CocList
    nmap <buffer> <Leader>fg <Cmd>call <SID>exec_cur_dir('CocList -I grep')<CR>
    nmap <buffer> <Leader>fG <Cmd>call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
    nmap <buffer> <C-p> <Cmd>call <SID>exec_cur_dir('CocList files')<CR>
" vim-floaterm
    nmap <buffer> <Leader>ft <Cmd>call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
endfunction

function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

augroup CocExplorerCustom
  autocmd!
  autocmd BufEnter * call <SID>enter_explorer()
  autocmd FileType coc-explorer call <SID>init_explorer()
augroup END


nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


"==================
"=airline config===
"==================
"let g:airline#extensions#tabline#enabled = 1

"==theme
"=======
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
"colorscheme gruvbox

"=======
"==snippets
"=======
"imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"xmap <space>x  <Plug>(coc-convert-snippet)


"=======
"==cmake plugin
"=======
noremap <space>cg :CMakeGenerate<CR>
noremap <space>cb :CMakeBuild<CR>
noremap <space>ci :CMakeInstall<CR>
noremap <space>cq :CMakeClose<CR>



"=======
"==nerdcomment
"=======
"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

"=======
"==startify
"=======
 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 MIRAC1E'), "\n"))

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            }]


"=======
"==vim-go
"=======
let g:go_fmt_autosave = 0
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_space_tab_error = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_trailing_whitespace_error = 1
"let g:go_highlight_types = 1
"let g:go_highlight_variable_assignments = 0
"let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0



"=======
"==float term
"=======
"
let g:floaterm_title = 'floaterm($1|$2)'
"Type String. 'float'(nvim's floating or vim's popup) by default. Set it to 'split' or 'vsplit' if you don't want to use floating or popup window. 
let g:floaterm_wintype = "float"
"let g:floaterm_position = 'botright'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.6
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <space><CR>   :FloatermToggle<CR>
tnoremap   <silent>   <space><CR>   <C-\><C-n>:FloatermToggle<CR>

"=======
"==easymotion
"=======
"
" super search 
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

"these mappings just provide different highlight method and have some other features
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

"map <space>l <Plug>(easymotion-lineforward)
"map <space>j <Plug>(easymotion-j)
"map <space>k <Plug>(easymotion-k)
"map <space>h <Plug>(easymotion-linebackward)

let g:EhsyMotion_startofline = 0 " keep cursor column when JK motion

"=======
"==taglist
"=======
nmap <space>tt :TagbarToggle<CR>
nmap <space>tf :TagbarOpen fj<CR>

let g:tagbar_position="leftabove vertical"
let g:tagbar_show_tag_count=1
let g:tagbar_autofocus=1


"=======
"==indent
"=======
let g:indentLine_defaultGroup = 'Patched font'
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#c99479'
let g:indentLine_color_tty_light = 3




"=======
"==telescope
"=======
"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c" ,"rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "socks5://localhost:7891" },
}
EOF

