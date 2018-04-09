set nocompatible              						"pWe want the latest Vim settings/options.

so ~/.vim/splash.vim

" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
set number								"Let's activate line numbers.
set relativenumber 
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase                                                        " ignre case in search
set tags=tags;                                                        " for ctags
set updatetime=100                                                    " update time for that status line
set mouse=a
set hidden                                                              " Required for operations modifying multiple buffers like rename.
" vim ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                              " MacOSX/Linux
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

set undofile                                                          " maintain undo history between session 
set undodir=~/.vim/undodir


if (has("termguicolors"))
    set termguicolors
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

" spelling
setlocal spell spelllang=en_us
set dictionary+=/usr/share/dict/words

autocmd BufNewFile,BufRead *.zsh setlocal filetype=zsh

" completion
" set completeopt=longest,menuone
set complete=.,w,b,u 							"Set our desired autocompletion matching.

"-----------------------term----------------------------"
"-----------------------term----------------------------"
"-----------------------term----------------------------"
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

"-----------------------Theme---------------------------"
"-----------------------Theme---------------------------"
"-----------------------Theme---------------------------"

colorscheme falcon
let g:falcon_lightline = 1
let g:lightline = {
      \ 'colorscheme': 'falcon',
      \ }

"-----------------------Mappings------------------------"
"-----------------------Mappings------------------------"
"-----------------------Mappings------------------------"
"
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
if has('nvim')
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
endif

inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
 

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
"/ FZF
"/
"Files [PATH]	    Files (similar to :FZF)
" GFiles [OPTS]     Git files (git ls-files)
" GFiles?	    Git files (git status)
" Buffers	    Open buffers
" Colors	    Color schemes
" Ag [PATTERN]      ag search result (ALT-A to select all, ALT-D to deselect all)
" Lines [QUERY]     Lines in loaded buffers
" BLines [QUERY]    Lines in the current buffer
" Tags [QUERY]      Tags in the project (ctags -R)
" BTags [QUERY]     Tags in the current buffer
" Marks	            Marks
" Windows           Windows
" Locate PATTERN    locate command output
" History           v:oldfiles and open buffers
" History:          Command history
" History/          Search history
" Snippets          Snippets (UltiSnips)
" Commits           Git commits (requires fugitive.vim)
" BCommits          Git commits for the current buffer
" Commands          Commands
" Maps              Normal mode mappings
" Helptags          Help tags 1
" Filetypes         File types
nmap <Leader>fb :Buffers<cr>
nmap <Leader>fh :History<cr> 
nmap <Leader>ff :GFiles<cr> 
nmap <Leader>fF :Files<cr> 
nmap <Leader>ft :BTags<cr>
nmap <Leader>fT :Tags<cr> 
nmap <Leader>fl :BLines<cr>
nmap <Leader>fL :Lines<cr>
nmap <Leader>f' :Marks<cr>
nmap <Leader>fa :Ag<Space>
nmap <Leader>hh :Helptags!<cr>
nmap <Leader>fC :Commands<cr>
nmap <Leader>f: :History:<CR>
nmap <Leader>f/ :History/<CR>
nmap <Leader>fM :Maps<CR>
nmap <Leader>fs :Filetypes<CR>


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
 autocmd FileType php noremap <Leader>pu :call PhpInsertUse()<CR>

 function! IPhpExpandClass()
     call PhpExpandClass()
     call feedkeys('a', 'n')
 endfunction
 autocmd FileType php noremap <Leader>pc :call PhpExpandClass()<CR>

" Sort PHP use statements http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" vim-php-cs-fixer.vim 
 nnoremap <silent><leader>F :w \| call PhpCsFixerFixFile()<CR>



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



"/
"/ jsdoc
"/
autocmd FileType javascript nmap <Leader>jd :JsDoc<cr>

autocmd Filetype json nmap <leader>F :%!python -m json.tool<cr>


"-----------------------Plugins------------------------"
"-----------------------Plugins------------------------"
"-----------------------Plugins------------------------"


"/
"/ nvim-completion-manager
"/
 " let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" " optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" let g:cm_completekeys = "\<Plug>(cm_omnifunc)"

"/
"/ vim-test
"/
nmap <Leader>tm :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "neovim"


"/
"/ YAML
"/
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"/ 
"/ NERTW
"/t 
let g:netrw_banner = 1
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
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.
let g:grep_cmd_opts = '--line-numbers --noheading'


"/
"/ Ack.vim
"/
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

"/
""/ Ultisnips
""/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"/
"/ VDEBUG
"/
let g:vdebug_options = {
    \ 'break_on_open': 1,
    \ 'path_maps': {'/var/www/html': '/Users/samuel.tissot/hub/src/github.com/lightspeedretail/hq'},
    \ 'port': '9000',
    \ }


"/
"/ octodown (markdown)
"/
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'

"/
"/ JSDOC
"/

let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1


"/
"/ vim-helm
"/
autocmd BufNewFile,BufRead *.tpl   set filetype=yaml
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl set filetype=helm

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
" if has("autocmd")
"   autocmd bufwritepost vimrc source $MYVIMRC
" endif


 
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
