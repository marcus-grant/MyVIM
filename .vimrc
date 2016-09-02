set nocompatible		" required
filetype off			" required

" Set runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle shuold install plugins
" call vundle#begin('~/.vim/bundle') <- replace with other path

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'



" ------------------ Plugins go below --------------------

Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" ------------------ Plugin list ends --------------------



" All of your plugins must be added before these lines
call vundle#end()		" required
filetype plugin indent on	" required




" ------------------- IDE Configs  -----------------------
" Enable Folding - remapped to spacebar in keymap section
set foldmethod=indent
set foldlevel=99

" Set to display docstring for folded code
let g:SimpylFold_docstring_preview=1

" Flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" ^ doesn't work, reports it doesn't recognize it

" UTF8
set encoding=utf-8


" NERDTree
let NERDTreeShowHidden=1


" Syntax-Highlighting
let python_highlight_all=1

syntax on

" Auto-complete
" 1st line: make autocomplete window go away when done
" 2nd line: shortcut for bringing you to definition of something with space-g
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" Python-specific
au BufNewFile,BufRead *.py
    \ set tabstop=4 		|
    \ set softtabstop=4 	|
    \ set shiftwidth=4 		|
    \ set textwidth=79 		|
    \ set expandtab		|
    \ set autoindent		|
    \ set fileformat=unix	

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" Full-stack specific
au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2		|
	\ set softabstop=2	|
	\ set shiftwidth=2	

" ----------------------- KeyMaps ------------------------

" Set Ctrl-j, k, l, h move to lower, upper, right, left split respectively
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap folds to be the spacebar in normal mode
nnoremap <space> za
