set number " show line numbers
syntax on "syntax hilighting

" Sets how many lines of history VIM has to remember
set history=500
"
" " Enable filetype plugins
filetype plugin on
filetype indent on
"
" " Set to auto read when a file is changed from the outside
set autoread
"
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set so=7

"colorscheme gruvbox

nnoremap <F4> :make<cr>
set keywordprg=man\ -s\ 2,3,4,5,1
" -- git command on current file
fun! GitCommand(command)
  silent! !clear
    exec "!git " . a:command . " %"
    endfun
    " -- git diff for current file
    map <leader>d :call GitCommand("diff") <CR>
    " -- git log for current file
    map <leader>l :call GitCommand("log -p") <CR>
    " -- git blame for current file
    map <leader>b :call GitCommand("blame") <CR>
hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=NONE guibg=darkgrey guifg=NONE
set cursorline
nnoremap , :noh<cr>
set incsearch

"set runtimepath^=~/.vim/plugin/vim-ripgrep.vim

call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'prabirshrestha/vim-lsp'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'michal-h21/vimwiki-sync'

"Plug 'mattn/vim-lsp-settings'
"Plug 'piec/vim-lsp-clangd'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'

call plug#end()


" if executable('clangd')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'clangd',
"         \ 'cmd': {server_info->['clangd', '-background-index']},
"         \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"         \ })
" endif

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

noremap <silent> gr :LspReferences<CR>
noremap <silent> gd :LspDefinition<CR>

let mapleader=" "
noremap <Leader>g :GFiles<CR>

setlocal nospell

let g:vimwiki_diary_frequency = 'weekly'
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext':'md'}]
"let g:vimwiki_global_ext=0
"

