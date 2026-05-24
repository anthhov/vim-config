set number
set mouse=a
set laststatus=2
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set ignorecase
set smartcase
set wildmenu
set foldmethod=indent
set foldlevel=99

autocmd BufWritePre * :%s/\s\+$//e

function! ToggleMouse()
    if &mouse == 'a'
    	set mouse=
	else
		set mouse=a
	endif
endfunction

nnoremap <leader>m :call ToggleMouse()<CR>
nmap <leader>k :NERDTreeToggle<CR>

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'wellle/context.vim'
Plug 'itchyny/lightline.vim'
Plug 'maxboisvert/vim-simple-complete'
Plug 'Raimondi/delimitMate'
Plug 'phanviet/vim-monokai-pro'
call plug#end()

colorscheme monokai_pro
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=LightGray gui=bold guibg=NONE guifg=LightGray
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=None gui=NONE guifg=DarkGrey guibg=NONE
set cursorline
set cursorlineopt=number

let NERDTreeShowHidden=1

" Lightline configuration
let g:lightline = {
\ 'active' : { 'Left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'modified' ] ] },
\ 'component_function': { 'filename': 'LightlineFilename' } }

function! LightlineFilename()
    if expand('%:p') != ''
    	return expand ('%:p')
	else
		return '[No Name]'
	endif
endfunction

