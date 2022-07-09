syntax on
set nu
set autoindent
set smartindent
set ts=4
set sts=4
set shiftwidth=4
set smarttab
set ruler
set showtabline=2
set mouse=a
set showcmd
set cursorline
set cursorcolumn
set hlsearch
set incsearch
set ignorecase
set smartcase
set list listchars=eol:↲,trail:␣,tab:\|.
set path+=**
set	wildmenu
set wildmode=list:full
match ErrorMsg '\%>80v.\+'
let g:user42 = 'wooshin'
let g:mail42 = 'wooshin@student.42seoul.kr'
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
colo gruvbox
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
" Header File
function! s:guard()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename
  execute "normal! o#endif"
  normal! ko
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>guard()
