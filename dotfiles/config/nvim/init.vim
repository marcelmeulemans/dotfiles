" vim: set fmr={{{,}}}:
" vim: set fdm=marker:

" {{{ Plugins

call plug#begin('~/.cache/nvim/plugged')

" Plugins
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.cache/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Themes
Plug 'nightsense/vimspectr'
Plug 'chase/focuspoint-vim'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

let g:deoplete#enable_at_startup = 1
let g:auto_complete_delay = 500
let g:max_list = 20

" }}}

" {{{ General vim settings

set         nocp
filetype    plugin indent on
syntax      on
set         noerrorbells
set         report=0
set         suffixes=.aux,.bak,.dvi,.gz,.idx,.swp,.tar
set         nowrap
set         tabstop=4
set         shiftwidth=4
set         shiftround
set         expandtab
set         autoindent
set         smartindent
set         backspace=indent,eol,start 
set         showmatch
set         mps+=<:>
set         showcmd showmatch showmode showfulltag
set         foldenable
set         foldmethod=marker
set         listchars=tab:>.,eol:~
set         tags=tags;
set         invlist

" }}}
"
" {{{ Helper functions

" Help delete character if it is 'empty space'
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

" Replace abbreviation if we're not in comment or other unwanted places
function! MapNoContext(key, seq)
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen'
    return a:key
  else
    exe 'return "' .
      \   substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) .  '"'
  endif
endfunction

" Create abbreviation suitable for MapNoContext
function! Iab (ab, full)
  exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".
    \  a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
    \"')<CR>"
endfunction

" Remap movement key in wrap mode so up goes up one line on the screen.
function! ToggleWrap()
    if &wrap 
        set nowrap
        nnoremap <Down> j
        nnoremap <Up> k
        nnoremap <Home> ^
        nnoremap <End> $
        vnoremap <Down> j
        vnoremap <Up> k
        vnoremap <Home> ^
        vnoremap <End> $
        inoremap <Down> <C-o>j
        inoremap <Up> <C-o>k
        inoremap <Home> <C-o>^
        inoremap <End> <C-o>$
    else
        set wrap
        set linebreak
        nnoremap <Down> gj
        nnoremap <Up> gk
        nnoremap <Home> g^
        nnoremap <End> g$
        vnoremap <Down> gj
        vnoremap <Up> gk
        vnoremap <Home> g^
        vnoremap <End> g$
        inoremap <Down> <C-o>gj
        inoremap <Up> <C-o>gk
        inoremap <Home> <C-o>g^
        inoremap <End> <C-o>g$
    endif
endfunction

" As the name says, fold or unfold a fold under the cursor
function! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
endfunction

" Insert comment at start of line
function! CommentLine(pattern, mode)
    let l:y = line('.')
    let l:x = col('.')
    let l:l1 = col('$')
    if a:mode == 0
        exe 'silent' ':s/^/'.a:pattern.'/'
    else
        exe 'silent' ':s/^'.a:pattern.'//'
    endif
    exe 'normal! '.y.'G'
    let l:l2 = col('$')
    let l:x = l:x + (l:l2 - l:l1)
    exe 'normal! '.x.'|'
endfunction

function! GenerateCtags()
    let l:old = getcwd()
    silent exec 'cd "%:p:h"' 
    let l:result = system("ctags --recurse --language-force=c++ --extra=+q --fields=+i *.cpp *.h")
    silent exec 'cd "'.l:old.'"'
endfunction

function! RemoveTrailingSpaces()
    silent exec '%s/\s\+$/' 
endfunction

" }}}

" {{{ Handy key mappings

map         <C-Right>           :bnext<Cr>
map         <C-Left>            :bprevious<Cr>
inoremap    <Tab>               <C-T>
inoremap    <S-Tab>             <C-D>
noremap     <silent> <space>    :call ToggleFold()<Cr>
nnoremap    <F2>                :NERDTreeToggle<CR>
nmap        <F3>                :call ToggleWrap()<Cr>
nmap        <F4>                :set invlist<Cr>
nmap        <F5>                :set invhlsearch<Cr>
map         <leader>c           :call CommentLine(linecomment, 0)<Cr>
map         <leader>u           :call CommentLine(linecomment, 1)<Cr>
map         <C-P>               :Files<Cr>
map         <C-S-P>             :Commands<Cr>
map         <C-F>               :BTags<Cr>


" {{{ Jumping home key
inoremap <Home> <c-o>:call <SID>home_toggle()<cr>
nnoremap <Home> :call <SID>home_toggle()<cr>
function! s:home_toggle()
  let ll = strpart(getline('.'), -1, col('.'))
  if ll =~ '^\s\+$' | normal! 0
  else              | normal! ^
  endif
endfunction
" }}}

" }}}

" {{{ Automatic spelling correction

iab alos also
iab aslo also
iab charcter character
iab charcters characters
iab exmaple example
iab shoudl should
iab seperate separate
iab teh the
iab enviroment environment

" }}}

" {{{ Per filetype settings

" {{{ Associate extentions with filetypes
au BufRead,BufNewFile *.fcg set filetype=slang
au BufRead,BufNewFile *.vcg set filetype=slang
au BufRead,BufNewFile *.cs  set filetype=cpp
au BufRead,BufNewFile *.pch*  set filetype=cpp
" }}}

" {{{ C
autocmd FileWritePre,BufWritePre c call RemoveTrailingSpaces()
autocmd FileType c let linecomment = '\/\/'
autocmd FileType c set fdm=syntax
autocmd FileType c call Iab('Fori', 'for (int i = 0; i < x; ++i)<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('Foru', 'for (unsigned int i = 0U; i < x; ++i)<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('Forf', 'for (float t = 0.0f; t < x; ++t)<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('If', 'if ( x )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('Eif', 'else if ( x )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('Else', 'else<Cr>{<Cr>x<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType c call Iab('//=', '// =============================================================================<CR><C-O>^<Del><Del>')
" }}}

" {{{ C++
autocmd FileWritePre,BufWritePre cpp call RemoveTrailingSpaces()
autocmd FileType cpp let linecomment = '\/\/'
autocmd FileType cpp set fdm=syntax
autocmd FileType cpp inoremap <buffer> S: std::
autocmd FileType cpp inoremap <buffer> B: boost::
autocmd FileType cpp inoremap <buffer> #i # include <><LEFT>
autocmd FileType cpp inoremap <buffer> #I # include ""<LEFT>
autocmd FileType cpp inoremap <buffer> #d # define 
autocmd FileType cpp call Iab('Pub', 'public:<CR>')
autocmd FileType cpp call Iab('Pro', 'protected:<CR>')
autocmd FileType cpp call Iab('Pri', 'private:<CR>')
autocmd FileType cpp call Iab('Ctmpl', 'template < typename T ><Cr>class x<Cr>{<Cr>};<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Stmpl', 'template < typename T ><Cr>struct x<Cr>{<Cr>};<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Class', 'class x<Cr>{<Cr>public:<Cr>protected:<Cr>private:<Cr>};<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Struct', 'struct x<Cr>{<Cr><Cr>};<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Fori', 'for ( int i = 0; i < x; ++i )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Foru', 'for ( unsigned int i = 0U; i < x; ++i )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Forf', 'for ( float t = 0.0f; t < x; ++t )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('If', 'if ( x )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Eif', 'else if ( x )<Cr>{<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Else', 'else<Cr>{<Cr>x<Cr>}<Cr><C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Cout', 'std::cout << x << std::endl;<C-O>?x<Cr><Del>')
autocmd FileType cpp call Iab('Main', 'int main (int argc, char **argv)<Cr>{<Cr>x;<Cr>return 0;<Cr>}<Cr><C-O>?x;<Cr><Del><Del>')
autocmd FileType cpp call Iab('//=', '// =============================================================================<CR><C-O>^<Del><Del>')
" }}}

" {{{ Java++
autocmd FileWritePre,BufWritePre java call RemoveTrailingSpaces()
autocmd FileType java let linecomment = '\/\/'
autocmd FileType java set fdm=syntax
autocmd FileType java call Iab('PL', 'System.out.println("x");<C-O>?x<Cr><Del>')
" }}}

" {{{ Tex
autocmd FileType tex let linecomment = '%'
autocmd FileType tex iab ... \ldots
" }}}

" {{{ Vim
autocmd FileType vim let linecomment = '"'
" }}}

" {{{ Make
autocmd FileWritePre,BufWritePre make call RemoveTrailingSpaces()
autocmd FileType make let linecomment = '#'
autocmd FileType make set foldmethod=marker
autocmd FileType make set foldmarker=#\ <<,#\ >>
" }}}

" }}}

set termguicolors
colorscheme mmeulemans
