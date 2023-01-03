syntax on
set clipboard=unnamed
" num setting
set nu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
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
" 42 header setting
let g:user42 = 'wooshin'
let g:mail42 = 'wooshin@student.42seoul.kr'
" esc = noh
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" colorscheme
set termguicolors
set background=dark
colo gruvbox8
let g:lightline = {'colorscheme' : 'gruvbox8'}
let g:airline_theme = 'gruvbox8'
hi Comment cterm=italic
call plug#begin()
" Plug
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
call plug#end()
" Airline setting
let g:airline_powerline_fonts = 1
" Header File
function! s:guard()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o# define " . gatename
  execute "normal! o#endif"
  normal! ko
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>guard()
"COC settings
"gd->정의 찾기
"gr->쓰인곳가기
"gc->바꾸기
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gh :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gh', 'in')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent>gc <Plug>(coc-rename)
"folding
set foldmethod=indent foldlevelstart=0 foldnestmax=1
nmap <silent>g<Left> zm
nmap <silent>g<Right> zr
nnoremap <space> za
