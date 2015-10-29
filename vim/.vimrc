set nocompatible
syntax on
filetype off
set omnifunc=syntaxcomplete#Complete

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let $PATH = $PATH . ':' . expand("~/.cabal/bin")

"Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'eagletmt/neco-ghc'
Plugin 'rust-lang/rust.vim'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'kien/ctrlp.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on
filetype on

"hdevtools configuration (Type signatures for haskell)
au FileType haskell nnoremap <buffer> <F5> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F6> :HdevtoolsClear<CR>

"Nerdtree configuration (File list bar)
map <F7> :NERDTreeToggle<CR>

"Syntastic configuration (In line errors)
let g:syntastic_auto_loc_list=1
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:neocomplete#enable_at_startup = 1
let g:necoghc_enable_detailed_browse = 1 

au FileType haskell set omnifunc=necoghc#omnifunc

" Tab settings
set tabstop=8
set expandtab "Tabs to spaces
set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4 "An indent is 4 spaces
set shiftround " Round indent to nearest shiftwidth multiple
