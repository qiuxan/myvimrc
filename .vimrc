set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable


set backspace=indent,eol,start
let mapleader = ',' 						    	"The default leader is \, but a comma is much better.
set number
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.

"-------------Plugins--------------"
"/
"/Ctrlp
"/
let g:ctrlp_custom_ignore='node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:r30'

"/
"/NERDTree
"/
let NERDTreeHijackNetrw = 0


"/
"/Greplace
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"-------------Visuals--------------"
colorscheme atom-dark
set t_CO=256
set macligatures							"pretty symbols when available
set guioptions-=e
set linespace=15

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"-------------Search--------------"
set hlsearch
set incsearch

"------------Split Management---------------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

set splitbelow
set splitright

"-------------Mappings--------------"
"Make it easy to edLt the Vimrc file.
nmap <Leader>ev :tabedit ~/.vimrc<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"make NERDTree eaiser to toggle
nmap <Leader>1 :NERDTreeToggle<cr>
nmap <Leader-R> :CtrlPBufTag<cr>
nmap <Leader>e :CtrlPMRUFiles<cr>
"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>


"-------------Laravel-specific--------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader>lfc :CtrlP<cr>app/Http/Controllers

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')?
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>
