set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/YouCompleteMe'
Plugin 'eagletmt/neco-ghc'

call vundle#end()
filetype plugin indent on

"hdevtools configuration (Type signatures for haskell)
au FileType haskell nnoremap <buffer> <F5> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F6> :HdevtoolsClear<CR>

"Nerdtree configuration (File list bar)
map <F7> :NERDTreeToggle<CR>

"Syntastic configuration (In line errors)
let g:syntastic_auto_loc_list=1
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

"neco-ghc : Auto-complete with You Complete Me
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1 

" Tab settings
set tabstop=8
set expandtab "Tabs to spaces
set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4 "An indent is 4 spaces
set shiftround " Round indent to nearest shiftwidth multiple
