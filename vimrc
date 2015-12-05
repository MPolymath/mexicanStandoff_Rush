silent !mkdir -p ~/.emacs.d
set noautoindent
set nocindent
set nosmartindent
set ruler
set number
" ================================================================
" 					FILE TYPE CONFIGURATIONS
" ================================================================
autocmd FileType c set tabstop=2|set shiftwidth=2|syntax on|set autoindent|set nocindent|set smartindent
autocmd BufWritePre *~ silent! sav! ~/.emacs.d/% | silent! :edit! ~/.emacs.d/%
" ================================================================
" 						AUTOMATIONS
" ================================================================
inoremap {    {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()


" ================================================================
" 					 HIGHLIGHT WHITE SPACES	
" ================================================================
:highlight DblWhitespace ctermbg=red guibg=red 
:match DblWhitespace /  \| $/

" ================================================================
" 					 	HEADER GENERATION
" ================================================================
