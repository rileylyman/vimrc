set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

let g:ale_completion_enabled = 1
let g:glsl_default_version = 'glsl330'
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'jansedivy/jai.vim'
Plugin 'JuliaEditorSupport/julia-vim'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'beyondmarc/glsl.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'YorickPeterse/happy_hacking.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'rust-lang/rust.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'w0rp/ale'
Plugin 'rakr/vim-one' 
"Plugin 'valloric/youcompleteme'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'reedes/vim-pencil'
"Plugin 'scrooloose/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required

:let g:latex_to_unicode_auto = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set number

let g:ale_linters = {'rust': ['rls'], 'C': ['gcc'] }
let vim_markdown_preview_github=1

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Syntastic
"""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""
if (has("termguicolors"))
  set termguicolors
endif

syntax on
set background=dark
colorscheme hybrid_material
let g:one_allow_italics=1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italicize_strings = '1'
let g:gruvbox_italicize_comments = '1'

nmap <C-j> :bn!<CR>
nmap <C-k> :bp!<CR>

"Powerline
""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set guifont=Cousine\ Nerd\ Font\ Mono:h11
endif

au FileType markdown,html,tex,txt,text noremap <buffer> j gj
au FileType markdown,html,tex,txt,text noremap <buffer> k gk
"au FileType markdown,html set tw=60


" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-n>"):"\<Tab>")
inoremap <expr><S-Tab> (pumvisible()?"\<C-p>":"\<S-Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

set splitright
set splitbelow

"VIM LATEX
filetype plugin on 
filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_CustomTemplateDirectory='$HOME/.vim/latex-templates'
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""

"VIM PENCIL
augroup Pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init()
    autocmd FileType text call pencil#init()
augroup END
