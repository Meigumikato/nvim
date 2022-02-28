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

exec "nohlsearch"
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

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

" nerdcommenter config

source ~/.config/nvim/plugconfig/nerdcommenter.vim

source ~/.config/nvim/plugconfig/ccls.vim


""=======
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

source ~/.config/nvim/plugconfig/cocnvim.vim

"==================
"=airline config===
"==================

"==theme
"=======
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus
"colorscheme gruvbox

"=======
"==snippets
"=======


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

source ~/.config/nvim/plugconfig/vimgo.vim

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
    curl = { "--proxy", "socks5://192.168.1.101:1090" },
}
EOF

