set modeline
syntax on
set smartindent
filetype indent on

set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=3

set incsearch
set wildmenu
set mouse=a

set background=dark
set cursorline
set number
colorscheme evening
if &diff
    colorscheme pablo
end

set wildignore=*.o,*.pyc,*~,.swp*

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType c,cpp,h,hpp,java,scala set expandtab shiftwidth=4 tabstop=4 

autocmd FileType c,cpp,h,hpp,java,scala,js let b:comment_leader = '//'
autocmd FileType python           let b:comment_leader = '#'

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader, '\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader, '\/')<CR>//e<CR>:nohlsearch<CR>

":json runs :%!python -m json.tool
command Json :%!python -m json.tool
