set nocompatible              						"We want the latest Vim settings/options.

" Vundle
" install by: git clone https://github.com/VundleVim/Vundle.vim.git " ~/.vim/bundle/Vundle.vim
so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = "\<Space>" 						 "The default is \, but a SPACE is much better.
set number								"Let's activate line numbers.
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase                                                        " ignre case in search
set tags=tags;                                                        " for ctags
set updatetime=100                                                    " update time for that status line

" ------- vim ignore -------------"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                              " MacOSX/Linux


"-------------Visuals--------------"
set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set background=dark " Setting dark mode
set guifont=Inconsolata:h14						"Set the default font family and size.
set guioptions-=e							"We don't want Gui tabs.
set linespace=13   						        "Macvim-specific line-height.

if (has("termguicolors"))
    set termguicolors
endif

if (has("macligatures"))
    set macligatures							"We want pretty symbols, when available.
endif

" apprentice
"colorscheme apprentice 

" two_firewatch
"let g:two_firewatch_italics=1
"colo two-firewatch

" deus
colorscheme deus 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256


set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R


"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg




"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


"-------------Mappings--------------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <leader>ep :tabedit ~/.vim/plugins.vim<cr>
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>
nmap <Leader>gt :!ctags 
"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
" php lint
nmap <Leader>pl :w<cr>:!php -l %<cr>



inoremap ;; <Esc>A;<Esc>
imap jj <Esc>


" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



"-------------Plugins--------------"
"

" Vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" beautify (may slow down vim)
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_working_path_mode = '0'

nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

nmap ¡ :NERDTreeToggle<cr>
nmap ™ :NERDTreeFind<cr>

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"/
"/ Markdown preview
"/ ctl+p  " when in a markdown file 
"/
let vim_markdown_preview_github=1


"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
autocmd! bufwritepost .vimrc source %
" augroup autosourcing
" 	autocmd!
" 	autocmd BufWritePost .vim/vimrc source %
" augroup END


 
"------------- RUN CODE --------------"
nmap <Leader>rj :!node %<cr>
nmap <Leader>rp :!php -f %<cr>

"-------------Functions--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>




"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
"
"   SEARCH 
"   -----
"   Option:1 - search
"   :grep -R "what_to_search_for"
"   :copen
"
"   Option:2 - search fastest
"   :Ag "What_to_search_for"
"
"   SEARCH & REPLACE
"   ----
"   :Gsearch ...
"   replace instance in buffer ( :%s/ORIGINAL/REPLACEMENT/options )
"   :Greplace
"
"   
