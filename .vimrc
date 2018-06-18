"set hidden " added from desktop
"set shiftround
"set pastetoggle=<F2>
"set showcmd
"set relativenumber

"set to auto read when a file is changed from the outside
set autoread

"show line number
set number
" enable syntax processing
syntax enable set smartindent

"standard tab
set tabstop=4 

"set softtabstop=4	"tab in edit mode
set shiftwidth=4
set expandtab

"load filetype-specific indent files
filetype indent on

" visual autocomplete for command menu
set wildmenu

"highlight matching brackets
set showmatch 		

" search as characters are entered
set incsearch

" highlight matches
set hlsearch            
syntax on

"filetype indent on
filetype indent plugin on

"wrap
set nowrap
set ruler

"instead of escape, type jk
inoremap jk <esc>

"semicolon works as colon illiminating shift press
nmap ; :

"Search for visually selected text: http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>

"set colorscheme
colorscheme slate

"English spell check
"":setlocal spell spelllang=en_us

"vim-plug - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'iamcco/markdown-preview.vim' "https://github.com/iamcco/markdown-preview.vim
Plug 'rust-lang/rust.vim' "https://github.com/rust-lang/rust.vim
call plug#end()

nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
"for normal mode
"for insert mode
"for normal mode
"for insert mode

let g:rustfmt_autosave=1    "rust
