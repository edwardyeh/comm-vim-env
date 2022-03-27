"========================================
"=== Editor Environment =================
"========================================
set nocompatible
set nu
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set showmode
set autoindent
set ruler
set nowrap
set hlsearch
set incsearch
"set ignorecase
set mouse=a
set guifont=DejaVu\ Sans\ Mono
set cursorline
set sessionoptions-=curdir
set sessionoptions+=sesdir
set fdm=marker
set backspace=2
set t_Co=256
"set noro
set laststatus=2
"set diffexpr=
"set list
set ttymouse=xterm2

set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=ansi,japan,korea,chinese,taiwan,utf-8
"set termencoding=utf-8

"========================================
"=== Add Syntax =========================
"========================================
autocmd BufNewFile,BufRead *.vim,*.vimrc setf vim
autocmd BufNewFile,BufRead *.ini setf bash
autocmd BufNewFile,BufRead *.f,*.vh setf verilog
autocmd BufEnter * set fo-=o

let g:python_recommended_style = 0

"========================================
"=== Personal Setting ===================
"========================================
"inoremap <A-h> <Left>
"inoremap <A-j> <Down>
"inoremap <A-k> <Up>
"inoremap <A-l> <Right>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

command! FS     set fdm=syntax
command! FM     set fdm=marker
command! SC     set syntax=c
command! SV     set syntax=verilog
command! SCS    set syntax=tcsh
command! SBS    set syntax=bash
command! ST     set syntax=tcl
command! DON    set diff scrollbind fdm=diff
command! DOF    set nodiff noscrollbind fdm=marker
command! B2H    %!xxd
command! H2B    %!xxd -r
command! SCC    set cursorcolumn
command! NCC    set nocursorcolumn

" Comment
command! -range -nargs=+ C   <line1>,<line2>s!^\( *.\)!<args>\1!g | noh
command! -range -nargs=+ CY  <line1>,<line2>s!^\( *\)\(.\)!\1<args>\2!g | noh
command! -range -nargs=+ CD  <line1>,<line2>s!^\( *\)<args>!\1!g | noh

" Delete redundant space
command! -range -nargs=+ DSS   <line1>,<line2>s/ *\( <args>\)/\1/g | noh
command! -range -nargs=+ DSD   <line1>,<line2>s/ *\(<args> \) */\1/g | noh
command! -range -nargs=+ DSF   <line1>,<line2>s/\(<args> \) */\1/g | noh
command! -range          DST   <line1>,<line2>s/ *$//g | noh
command! -range          DSA   <line1>,<line2>s/\(\S\)  *\(\S\)/\1 \2/g | noh
command! -range          VA    exec <line1>.",".<line2>."DSA" | <line1>,<line2>Tabularize/ /l0 | noh
command! -range -nargs=+ VADSF exec <line1>.",".<line2>."VA" | exec <line1>.",".<line2>."DSF<args>" | noh

" Add Tab
command! -range -nargs=+ TBS <line1>,<line2>s/<args>/<TAB><args>/g | retab | noh
command! -range -nargs=+ TBF <line1>,<line2>s/<args>/<args><TAB>/g | retab | noh

" Brackets alignment
command! -range ANU <line1>,<line2>s/( *)/(xx )/g
command! -range DNU <line1>,<line2>s/(xx/(  /g

command! -range LB  exec <line1>.",".<line2>."TAS (" | <line1>,<line2>s/ (/<TAB>(/g | retab
command! -range RB  exec <line1>.",".<line2>."TAS )" | <line1>,<line2>s/ )/<TAB>)/g | retab
command! -range LRB silent! exec <line1>.",".<line2>."ANU" | exec <line1>.",".<line2>."LB" | exec <line1>.",".<line2>."RB" | silent! exec <line1>.",".<line2>."DNU" 

" Verilog - dot add
command! -range DOT <line1>,<line2>s/^\(  *\)\([0-9a-zA-Z]\)/\1.\2/g | retab | noh
" Verilog - comment add
command! -range CA  <line1>,<line2>s+;+; //+g | exec <line1>.",".<line2>."TCT" | noh
" Verilog - input/output tag add
command! -range ITA <line1>,<line2>s+,+, // (I)+g | noh
command! -range OTA <line1>,<line2>s+,+, // (O)+g | noh
" Verilog - port bracket add
command! -range BA <line1>,<line2>s+,+ (),+g | exec <line1>.','.<line2>.'LRB' | exec <line1>.','.<line2>.'TCT' | <line1>,<line2>s+^ *\/\/ *+    \/\/+g | noh
" Verilog - port declare
command! -range PD <line1>,<line2>s+;.*+,+g | noh

"========================================
"=== Highlight Setting ==================
"========================================
"colorscheme torte
colorscheme default
syntax on

"" Editor
highlight LineNr            ctermfg=28 
highlight CursorLineNr      cterm=bold ctermfg=11
highlight StatusLine        cterm=NONE ctermfg=15 ctermbg=21
highlight StatusLineNC      cterm=reverse
highlight VertSplit         cterm=reverse
highlight Title             ctermfg=13 
highlight Visual            ctermfg=238 ctermbg=250 
highlight VisualNOS         cterm=underline 
highlight Directory         ctermfg=32
highlight WildMenu          ctermfg=0 ctermbg=11
"highlight Pmenu             ctermfg=252 ctermbg=13 guibg=Magenta
highlight Pmenu             ctermfg=252 ctermbg=89 guibg=Magenta
highlight PmenuSel          ctermbg=15 
highlight PmenuSbar         ctermbg=15 
highlight PmenuThumb        cterm=reverse                            
"" Cursor 
highlight CursorLine        cterm=NONE ctermbg=234
highlight CursorColumn      cterm=NONE ctermbg=234
"highlight CursorColumn      cterm=NONE ctermbg=234 ctermfg=14 
"highlight Cursor            ctermfg=bg ctermbg=fg
"highlight lCursor           ctermfg=bg ctermbg=fg
"" Message
highlight ErrorMsg          ctermfg=15 ctermbg=9
"highlight WarningMsg        ctermfg=darkred 
highlight WarningMsg        ctermfg=124 
highlight MoreMsg           ctermfg=10 
highlight Question          ctermfg=10 
"" Special
highlight IncSearch         cterm=reverse
highlight Search            cterm=NONE ctermfg=11 ctermbg=none 
highlight MatchParen        cterm=reverse ctermbg=14 ctermfg=28
highlight DiffAdd           ctermbg=17 
highlight DiffChange        ctermbg=53 
highlight DiffDelete        cterm=NONE ctermfg=243 ctermbg=234
highlight DiffText          cterm=NONE ctermbg=52 ctermfg=9 
"highlight Folded            ctermfg=179 ctermbg=0 
"highlight FoldColumn        ctermfg=10 ctermbg=0
highlight Folded            ctermfg=179 ctermbg=none 
highlight FoldColumn        ctermfg=10 ctermbg=none
highlight SpecialKey        ctermfg=21
highlight NonText           ctermfg=21
"highlight SignColumn        ctermfg=10 ctermbg=0 
highlight SignColumn        ctermfg=10 ctermbg=none 
highlight SpellBad          cterm=reverse ctermbg=9 
highlight SpellCap          cterm=reverse ctermbg=21 
highlight SpellRare         cterm=reverse ctermbg=13 
highlight SpellLocal        ctermbg=14
highlight TabLine           ctermfg=0 ctermbg=15 
highlight TabLineFill       cterm=reverse 
highlight Underlined        ctermfg=13 
"" Other
highlight Ignore            ctermfg=15 ctermfg=0
"highlight Error             ctermfg=15 ctermbg=9
highlight Error             ctermfg=15 ctermbg=124
highlight Todo              ctermfg=0 ctermbg=11 
"" YouCompleteMe
highlight YcmErrorSection   ctermbg=52
"" General Style
highlight Normal            ctermfg=252
highlight Comment           ctermfg=34
highlight Constant          ctermfg=208
highlight Special           ctermfg=252
highlight Identifier        cterm=none ctermfg=51 
highlight Statement         ctermfg=32
highlight PreProc           ctermfg=164
highlight Type              ctermfg=32
highlight String            ctermfg=1
highlight Define            cterm=none ctermfg=13
"" C/C++ Style
highlight cStatement        ctermfg=220
highlight cLabel            ctermfg=220
highlight cConditional      ctermfg=220
highlight cRepeat           ctermfg=220
highlight cType             ctermfg=32
highlight cStructure        ctermfg=32
highlight cStorageClass     ctermfg=32
highlight cshVariables      ctermfg=13
