" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'cjrh/vim-conda'
Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'

let g:airline_powerline_fonts = 1
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Syntax Highlighting
if has("syntax")
	syntax on
endif

set clipboard=unnamedplus
set autoindent
set cindent
set nu
set ts=4 " Tab너비
set shiftwidth=4 "자동 인덴트할 때 너비
set hlsearch
set scrolloff=2
set sw=1
set showmatch
set smartcase
set smartindent
set softtabstop=4
set incsearch
set tabstop=4

"마지막으로 수정된 곳에 커서
au BufReadPost *
			\if line("'\"") > 0 && line("'\"") <= line("$") |
			\exe "norm g`\"" |
			\endif

set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set autowrite
set ruler

" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"<F4>로 실행
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

colorscheme dracula 

set termguicolors

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" Key Setting - resize windows
nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +8"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -8"<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>_ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>} :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>{ :exe "vertical resize " . (winheight(0) * 2/3)<CR>
map <Leader>nt <ESC>:NERDTree<CR>
