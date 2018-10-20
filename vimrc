"
"
"
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
  " BASE SETTINGS
" -----------------------------------------------------------------------
"
" VIM special character notation
"
" <BS>           Backspace
" <Tab>          Tab
" <CR>           Enter
" <Enter>        Enter
" <Return>       Enter
" <Esc>          Escape
" <Space>        Space
" <Up>           Up arrow
" <Down>         Down arrow
" <Left>         Left arrow
" <Right>        Right arrow
" <F1> - <F12>   Function keys 1 to 12
" #1, #2..#9,#0  Function keys F1 to F9, F10
" <Insert>       Insert
" <Del>          Delete
" <Home>         Home
" <End>          End
" <PageUp>       Page-Up
" <PageDown>     Page-Down
" <bar>          the '|' character, which otherwise needs to be escaped '\|'
"
"
"
"
"
" per project vimrc
set exrc
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
set autowrite
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
" ... but not it begins with upper case
set smartcase
" Do not highlight column (speeds up highlighting)
set nocursorcolumn
" Do not highlight cursor (speeds up highlighting)
set nocursorline
" Indicate fast terminal conn for faster redraw
set ttyfast
" Indicate terminal type for mouse codes
if (has('ttymouse'))
    set ttymouse=xterm2
endif

" Speedup scrolling
if (has('ttyscroll'))
    set ttyscroll=3
endif
" Show status line always
set laststatus=2
" maintain undo history between session 
" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
    set undofile                                                          
    set undodir=~/.vim/undodir//
endif

set backup
set backupdir=~/.vim/backup//

set dir=~/.vim/swp//

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
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

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
" Show popup menu, even if there is one entry
set completeopt=menu,menuone
" Completion window max size
set pumheight=10
"
""The default is \, but a SPACE is much better.
" let mapleader = "\<Space>" 						 
nmap <Space> <Leader>

"
" window resize
nmap <Leader><Left> :vertical resize +16<cr> 
nmap <Leader><Right> :vertical resize -16<cr> 

" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h


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
nmap <Leader>es :tabedit $MYVIMRC/snippets/
nmap <leader>ep :tabedit $MYVIMRC/plugins.vim<cr>
nmap <leader>et :tabedit $TODO_DIR/todo.txt<cr>

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

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let git = fugitive#head()
  if git != ''
    return ''.fugitive#head()
  else
    return ''
endfunction

" Dictionary: take mode() input -> longer notation of current mode
" mode() is defined by Vim
let g:currentmode={ 'n' : 'Normal ', 'no' : 'N·Operator Pending ', 'v' : 'Visual ', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select ', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert ', 'R' : 'Replace ', 'Rv' : 'V·Replace ', 'c' : 'Command ', 'cv' : 'Vim Ex ', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ 
set statusline+=%{StatuslineGit()}
set statusline+=\ 
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=\ %#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ %#PmenuSel#
set statusline+=\ %{ModeCurrent()}
set statusline+=\ 


"
" itchyny/lightline.vim
" 
" let g:lightline = {
"       \ 'colorscheme': 'base16',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'gitbranch', 'modified', 'filename' ] ],
"       \   'right': [ [ 'lineinfo' ],
"       \              [ 'percent' ],
"       \              [ 'fileformat', 'fileencoding', 'filetype'] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'fugitive#head',
"       \ },
"       \ }

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
let g:ale_completion_enabled = 0
let g:ale_linters = {
\   'php': ['php'],
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

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
nmap <Leader>fT :BTags<cr>
nmap <Leader>ft :Tags<cr> 
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
nmap <Leader>fV :Commits<CR>
nmap <Leader>fv :BCommits<CR>


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
"  ----------  UNDO  ----------
"
nnoremap U :UndotreeToggle<cr>


"
"
"  ----------
"  ----------  COMPLETION  ----------
let g:deoplete#enable_at_startup = 1

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"
"
"  ----------
"  ----------  DEBUGING  ----------
"
" set configs in directory .nvimrc

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

"
" alvan/vim-php-manual
" 
let g:php_manual_online_search_shortcut = '<Leader>ph'

" 
" format code
"
autocmd FileType php noremap <Leader>b :!php-cs-fixer fix %<CR>

"
"
"  ----------
"  ----------  GOLANG  ----------
"
" fatih/vim-go'
" 
run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" syntax hightlight
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

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


set secure
