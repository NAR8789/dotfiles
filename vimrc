"--- vundle stuff ---
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'markcornick/vim-bats'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align'
call vundle#end()
"--- end vundle stuff ---

"TODO: break this file into multiple files
"   see http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean

" display options
set background=dark
set nowrap

" buffer options
set hidden                      "make vim allow opening new buffers without saving current
"set showtabline=2              "always show tab line

" search options
set ignorecase
set smartcase

" tab options
set expandtab                   "insert spaces instead of tabs
set shiftwidth=2
set softtabstop=-1              "use shiftwidth as softtabstop

" command options
set wildmode=longest:full       "intuitive tab completion

" other options
let g:netrw_liststyle=3
set showmatch                   "show matching delimiter
set foldmethod=syntax           "fold by syntax
set undofile                    "persistent undo

" perl folding
let perl_fold = 1               "TODO: what's this?
let perl_fold_blocks = 1        "TODO: what's this?

" recognize .md files as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"vim-latex
set grepprg=grep\ -nH\ $*\ /dev/null
let g:tex_flavor='latex'

" workaround for yankstack keybindings
let g:yankstack_map_keys = 0
nmap - <Plug>yankstack_substitute_older_paste
nmap = <Plug>yankstack_substitute_newer_paste

" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'

" vim-easy-align
"Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" configurations not in this file:
"     open files in tabs        command line alias

" configurations provided by sensible.vim
"filetype recognition and syntax highlighting
"set tabpagemax=32
"set autoindent
"set smarttab
"set showcmd                    "show current command line (as opposed to leaving it out for slow terminals)
"set wildmenu                   "show tab competion menu
"set laststatus=2               "always show a status line
