"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " BASE SETTINGS
" -----------------------------------------------------------------------
" We want the latest Vim settings/options.
set nocompatible              						
syntax enable
" Make backspace behave like every other editor.
set backspace=indent,eol,start                                          
"Let's activate line numbers.
set number								
"No damn bells!
set noerrorbells visualbell t_vb=               			
"Automatically write the file when switching buffers.
set autowriteall                                                        
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
" ignre case in search
set ignorecase                                                        
" for ctags
set tags=tags;                                                        
" update time for that status line
set updatetime=100                                                    
set mouse=a
" Required for operations modifying multiple buffers like rename.
set hidden                                                              
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                              
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp
" buffer the refresh rate
set lazyredraw                                                      
set cul!
" maintain undo history between session 
set undofile                                                          
set undodir=~/.vim/undodir
" theme
" better colors
if (has("termguicolors"))
    set termguicolors
endif
"Disable Gui scrollbars.
set guioptions-=l                                                       
set guioptions-=L
set guioptions-=r
set guioptions-=R
"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

" Search
"Highlight all matched terms.
set hlsearch								
"Incrementally highlight, as we type.
set incsearch								
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

" Split Management
"Make splits default to below...
set splitbelow 								
"And to the right. This feels more natural.
set splitright								

" spelling
setlocal spell spelllang=en_us
set dictionary+=/usr/share/dict/words

" completion
"Set our desired autocompletion matching.
set complete=.,w,b,u 							
" onmicompletion out of the box for vim.
set omnifunc=syntaxcomplete#Complete                                    
"set completeopt=longest,menuone
"
""The default is \, but a SPACE is much better.
" let mapleader = "\<Space>" 						 
nmap <Space> <Leader>

"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " FILETYPE
" -----------------------------------------------------------------------
autocmd BufNewFile,BufRead *.zsh setlocal filetype=zsh
autocmd BufNewFile,BufRead *.conf setlocal filetype=nginx

"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " PERSONAL CUSTOMIZATION
" -----------------------------------------------------------------------
so ~/.vim/splash.vim
" insert new line without entering insert mode
" shift+enter
" enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc> 

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/
nmap <leader>ep :tabedit ~/.vim/plugins.vim<cr>

"To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" NOTES 
nmap <Leader>n :tabedit $NOTES<cr>

"/ SRACTCH 
nmap <Leader>s :tabedit $SCRATCH<cr>

"/ Navigation management
map <Leader>qn :cnext<CR>
map <Leader>qp :cprevious<CR>
nnoremap <leader>qc :cclose<CR>

"/ Movement mappings
inoremap ;; <Esc>A;<Esc>
imap jj <Esc>

"/ rename word under cursor
nnoremap <Leader>rn :%s/\<<C-r><C-w>\>//g<Left><Left>

"/ Ctags
"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>tf :tag<space>
nmap <Leader>tg :!ctags -R

"/ NERTW
let g:netrw_banner = 1
"let g:netrw_browse_split = 4
let g:netrw_winsize = 25

"/ CAPLOCK automatic
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " NEOVIM TERMINAL COLORS
" -----------------------------------------------------------------------
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

"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " PLUGINS 
" -----------------------------------------------------------------------
" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
so ~/.vim/plugins.vim

"
"
" ----------
" ----------  THEME  ----------
"
" chriskempson/base16-vim
"
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"
" itchyny/lightline.vim
" 
let g:lightline = {
      \ 'colorscheme': 'base16'
      \ }

"
"
"  ----------
"  ----------  SYNTAX  ----------
"
" sheerun/vim-polyglot
"                                         
let g:vim_markdown_conceal = 0

"
"
"  ----------
"  ----------  UTILITIES  ----------
" Kick off builds and test suites using one of several asynchronous adapters
"
" SirVer/ultisnips
"                                             
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" run tests
"
" janko-m/vim-test
"                                             
nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>
" make test commands execute using dispatch.vim
let test#strategy = "neovim"

"
"
"  ----------
"  ----------  LINTING  ----------
"
" w0rp/ale
"                                                     

"
"
"  ----------
"  ----------  SEARCH  ----------
"
" junegunn/fzf.vim
"                                             
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

"
" mileszs/ack.vim
"                                              
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"
" skwp/greplace.vim
"                                            
"We want to use Ag for the search.
set grepprg=ag								
let g:grep_cmd_opts = '--line-numbers --noheading'

"
"
"  ----------
"  ----------  DEBUGING  ----------
"
" joonty/vdebug
"
let g:vdebug_options = {
    \ 'break_on_open': 0,
    \ 'port': '9071'
    \ }
    " \ 'path_maps': {'/var/www/html': '/Users/samuel.tissot/hub/src/github.com/lightspeedretail/mkt-backend-test'},

"
"
"  ----------
"  ----------  YAML  ----------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"
"
"  ----------
"  ----------  PHP  ----------
" run code
autocmd FileType php map <Leader>r :!php -f %<cr>
" php lint
autocmd FileType php map <Leader>l :w<cr>:!php -l %<cr>

"
" arnaud-lb/vim-php-namespace'
"
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

"
" tobyS/pdv'
" 
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
 
"/ PHPactor
" autocmd FileType php setlocal omnifunc=phpactor#Complete
" nmap <Leader>pu :call phpactor#UseAdd()<CR>                       " Include use statement
" nmap <Leader>pm :call phpactor#ContextMenu()<CR>                 " Invoke the context menu
" nmap <Leader>po :call phpactor#GotoDefinition()<CR>               " Goto definition of class or class member under the cursor
" nmap <Leader>pt :call phpactor#Transform()<CR>                   " Transform the classes in the current file
" nmap <Leader>pc :call phpactor#ClassNew()<CR>                    " Generate a new class (replacing the current file)
" vmap <silent><Leader>pe :<C-U>call phpactor#ExtractMethod()<CR>  " Extract method from selection

"/ nvim-completion-manager
"
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" " optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" let g:cm_completekeys = "\<Plug>(cm_omnifunc)"

"
"
"  ----------
"  ----------  GOLANG  ----------
"
" fatih/vim-go'
" 
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
" debug
autocmd FileType go nmap <leader>dp :call GoToggleBreakpoint()
autocmd FileType go nmap <leader>dr :call GoDebug()

"
"
"  ----------
"  ----------  JAVASCRIPT  ----------
" run code
autocmd Filetype js nmap <Leader>r :!node %<cr>

"
" heavenshell/vim-jsdoc'
"
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1
autocmd FileType javascript nmap <Leader>jd :JsDoc<cr>
autocmd Filetype json nmap <leader>F :%!python -m json.tool<cr>


"
"
"  ----------
"  ----------  HELM  ----------
"
" towolf/vim-helm'
"
autocmd BufNewFile,BufRead *.tpl   set filetype=yaml
autocmd BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl set filetype=helm

"
"
"  ----------
"  ----------  MARKDOWN  ----------
"
" JamshedVesuna/vim-markdown-preview'
"
let vim_markdown_preview_github=1

"
"
"  ----------
"  ----------  SPELLING  ----------
" Antidote
function! CallAntidoteSpellCheck()
  :w
  call system("open -a /Applications/Antidote\\ 9.app ".bufname("%"))
endfunction
nmap <Leader>sc :call CallAntidoteSpellCheck()<CR>























 






