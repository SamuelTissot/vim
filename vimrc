set nocompatible              						"pWe want the latest Vim settings/options.
"
" Splasm screen
so ~/.vim/splash.vim

" Vundle
" install by: git clone https://github.com/VundleVim/Vundle.vim.git " ~/.vim/bundle/Vundle.vim
so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
set number								"Let's activate line numbers.
set relativenumber
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase                                                        " ignre case in search
"set tags=tags;                                                        " for ctags
set updatetime=100                                                    " update time for that status line

" vim ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                              " MacOSX/Linux
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Visuals
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

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

" Search
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.

" Split Management
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.




"-----------------------Theme---------------------------"
"-----------------------Theme---------------------------"
"-----------------------Theme---------------------------"

" apprentice
" colorscheme apprentice 

" two_firewatch
"let g:two_firewatch_italics=1
"colo two-firewatch

" deus
colorscheme deus 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
" airline
let g:airline_theme='deus'




"-----------------------Mappings------------------------"
"-----------------------Mappings------------------------"
"-----------------------Mappings------------------------"

" let mapleader = "\<Space>" 						 "The default is \, but a SPACE is much better.
nmap <Space> <Leader>

"/
"/ VIM Configs 
"/
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <leader>ep :tabedit ~/.vim/plugins.vim<cr>


"/
"/ Split Management
"/
"To map <Esc> to exit terminal-mode: >
tnoremap <Esc> <C-\><C-n>

"To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nmap <C-J> <C-W><C-J>
"nmap <C-K> <C-W><C-K>
"nmap <C-H> <C-W><C-H>
"nmap <C-L> <C-W><C-L>
function! FocusCurrentBuffer()
  :w
  :%bd!
  :e#
endfunction
 
nmap <Leader>bf :call FocusCurrentBuffer()<CR>

"/
"/ NOTES 
"/
nmap <Leader>n :tabedit $NOTES<cr>

"/
"/ SRACTCH 
"/
nmap <Leader>s :tabedit $SCRATCH<cr>

"/
"/ Navigation management
"/
map <Leader>qn :cnext<CR>
map <Leader>qp :cprevious<CR>
nnoremap <leader>qc :cclose<CR>

"/
"/ Movement mappings
"/
inoremap ;; <Esc>A;<Esc>
imap jj <Esc>

"/
"/ Operation Mappings
"/
nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>

"/
"/ Visual mappings
"/
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"/
"/ Ctags
"/
"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>tf :tag<space>
nmap <Leader>tg :!ctags -R

"/
"/ CtrlP
"/
nmap <Leader>fb :CtrlPMRUFiles<cr>
nmap <Leader>ft :CtrlPBufTag<cr>
let g:ctrlp_map = '<Leader>ff'                                  " same as nmap <Leader>vf :CtrlPMRUFiles<cr>
let g:ctrlp_cmd = 'CtrlP'


"/
"/ PHP mappings
"/
" run code
autocmd FileType php map <Leader>r :!php -f %<cr>
" php lint
nmap <Leader>pl :w<cr>:!php -l %<cr>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>pu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>pc <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>pc :call PhpExpandClass()<CR>
"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
"/ vim-php-cs-fixer.vim 
nnoremap <silent><leader>pf :w \| call PhpCsFixerFixFile()<CR>



"/
"/ JS mappings 
"/
" run code
autocmd Filetype js nmap <Leader>r :!node %<cr>

"/
"/ vim-go
"/
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


"/
"/ vim-godebug
"/
autocmd FileType go nmap <leader>dp :call GoToggleBreakpoint()
autocmd FileType go nmap <leader>dr :call GoDebug()

"/
"/ pdv
"/
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>



"-----------------------Plugins------------------------"
"-----------------------Plugins------------------------"
"-----------------------Plugins------------------------"

"/
"/ SYNTASTIC
"/

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ["eslint", "jshint"]
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["go"] }

"/
"/ YAML
"/
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"/ 
"/ NERTW
"/t 
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
let g:netrw_winsize = 25

"/
"/ VIM-GO
"/
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
" beautify (may slow down vim)
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

"/
"/ CtrlP
"/
" igmore file in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(git|hg|svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_working_path_mode = '0'

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.
let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  


"/
"/ phpcd
"/
let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 3
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})  " for deoplete
let g:deoplete#ignore_sources.php = ['omni']                            " for deoplete

"/
"/ deoplete
"/
"set runtimepath+=~/.vim/bundle/deoplete.nvim
let g:deoplete#enable_at_startup = 1

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"



"/
"/ VDEBUG
"/
let g:vdebug_options = {
    \ 'break_on_open': 0,
    \ 'path_maps': {'/var/www/html': '/Users/samuel.tissot/Sites/ocb'},
    \ 'port': '9000',
    \ }


"/
"/ Markdown preview
"/ ctl+p  " when in a markdown file 
"/
let vim_markdown_preview_github=1


"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


 
"-----------Special functionality---------"

"/
"/ CAPLOCK automatic
"/
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0



"/
"/ Antidote
"/
function! CallAntidoteSpellCheck()
  :w
  call system("open -a /Applications/Antidote\\ 9.app ".bufname("%"))
endfunction
 
nmap <Leader>sc :call CallAntidoteSpellCheck()<CR>











"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
"
"   DELETE ALL BUFFER EXEPT CURRENT
"   :w | %db | e#
"   - w write file
"   - %bd close all buffer
"   - edit current last buffer
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
"  NEWTRW
" :e.	:edit .	at current working directory
" :sp.	:split .	in split at current working directory
" :vsplit .	in vertical split at current working directory
" :Explore	at directory of current file
" :Sexplore	in split at directory of current file
" :Vexplore	in vertical split at directory of current file
