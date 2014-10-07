let mapleader=","
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-perl/vim-perl'
Plugin 'Townk/vim-autoclose'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'c9s/perlomni.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'

" Snipmate and dependencies
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display toolbar or scrollbar
set go-=T
set go-=r
set go-=L

syntax enable
set t_Co=16
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

""""" NERDTREE
map <C-n> :NERDTreeToggle<CR>
"Close vim if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""""

""""" PERL
" Turn off syntax highlighting in pod comments
let perl_include_pod = 0
nnoremap <silent> <F3> :%!perltidy -q<Enter>
"""""

" Proper indenting
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent

" Hide buffer instead of close, allows to switch files without needing to save
" or undo
set hidden

" Allows to delete word after or around cursor in insert mode
imap <C-d> <C-o>diw

" Inset lines above or below in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Use F2 to save in insert mode
inoremap <F2> <C-o>:w<CR>

" Cursor moves to next wrapped line instead of next line
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>

" Sudo a file after it's opened
cmap w!! w !sudo tee % >/dev/null

" Switch vim to cwd for each buffer
autocmd BufEnter * silent! lcd %:p:h

" Map editing .vimrc and automatic sourcing when saved and close
map <leader>vimrc :e ~/.vimrc<cr>
autocmd bufwritepost .vimrc source $MYVIMRC | AirlineRefresh
"map <leader>sv source %MYVIMRC
