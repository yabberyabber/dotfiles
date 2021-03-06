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

set background=light
set cursorline
set number
set t_Co=256
set t_ut=""
colorscheme solarized
if &diff
    colorscheme pablo
end

set wildignore=*.o,*.pyc,*~,.swp*

autocmd FileType make,go set noexpandtab shiftwidth=4 softtabstop=0
autocmd FileType c,cpp,h,hpp,java,scala set expandtab shiftwidth=4 tabstop=4
autocmd FileType python set expandtab shiftwidth=3 tabstop=3

autocmd FileType c,cpp,h,hpp,java,scala,js,go let b:comment_leader = '//'
autocmd FileType python           let b:comment_leader = '#'
autocmd FileType tex let b:comment_leader = '%'
autocmd FileType tex let g:tex_flavor='latex'
autocmd FileType tex set spell

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader, '\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader, '\/')<CR>//e<CR>:nohlsearch<CR>

":json runs :%!python -m json.tool
command Json :%!python -m json.tool

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

set hlsearch

noremap <F12> <Esc>:syntax sync fromstart<CR>

"When saving golang files, run gofmt
au BufWritePost *.go !gofmt -w %
