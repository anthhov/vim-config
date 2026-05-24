" Show line numbers in the gutter.
set number
" Enable mouse in all modes (normal, visual, insert, command-line).
set mouse=a
" Always show the status line (lightline replaces the default one).
set laststatus=2
" Display tabs as 4 columns wide.
set tabstop=4
" Use spaces instead of tab characters when pressing Tab.
set expandtab
" Indent with 4 spaces (>> and <<, autoindent).
set shiftwidth=4
" Copy indent from the previous line when starting a new line.
set autoindent
" Case-insensitive search unless the pattern contains uppercase.
set ignorecase
" Override ignorecase when the search pattern has uppercase letters.
set smartcase
" Show tab-completion candidates in a menu below the command line.
set wildmenu
" Create folds based on indent depth.
set foldmethod=indent
" Start with all folds open (99 = effectively no folding on open).
set foldlevel=99

" Strip trailing whitespace from the whole buffer before each save.
autocmd BufWritePre * :%s/\s\+$//e

" Toggle mouse support on/off (used by <leader>m).
function! ToggleMouse()
    if &mouse == 'a'
    	set mouse=
	else
		set mouse=a
	endif
endfunction

" <leader>m: toggle mouse (default leader is backslash).
nnoremap <leader>m :call ToggleMouse()<CR>
" <leader>k: open/close the NERDTree file explorer.
nmap <leader>k :NERDTreeToggle<CR>

" Plugin manager: declare plugins between plug#begin and plug#end.
call plug#begin()
Plug 'preservim/nerdtree'              " File tree sidebar.
Plug 'ryanoasis/vim-devicons'          " File type icons in NERDTree.
Plug 'wellle/context.vim'              " Sticky context lines above/below the viewport.
Plug 'itchyny/lightline.vim'           " Custom status/tab line.
Plug 'maxboisvert/vim-simple-complete' " Tab-triggered word completion.
Plug 'Raimondi/delimitMate'            " Auto-close brackets and quotes.
Plug 'phanviet/vim-monokai-pro'        " Monokai Pro colorscheme.
call plug#end()

colorscheme monokai_pro
" Bold, gray current line number; no background on the number column.
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=LightGray gui=bold guibg=NONE guifg=LightGray
" Muted line numbers for non-current lines.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=None gui=NONE guifg=DarkGrey guibg=NONE
" Highlight the line where the cursor sits.
set cursorline
" Only highlight the line number, not the full text line.
set cursorlineopt=number

" Show dotfiles and other hidden entries in NERDTree.
let NERDTreeShowHidden=1

" Lightline: status bar layout and custom filename component.
let g:lightline = {
\ 'active' : { 'Left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified' ] ] },
\ 'component_function': { 'filename': 'LightlineFilename' } }

" Show full path in the status bar, or [No Name] for an unsaved buffer.
function! LightlineFilename()
    if expand('%:p') != ''
    	return expand ('%:p')
	else
		return '[No Name]'
	endif
endfunction
