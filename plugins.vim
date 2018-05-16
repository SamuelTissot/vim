
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
"
"
" ----------
" ----------  THEME  ----------
Plug 'itchyny/lightline.vim'                                        " status line
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'Yggdroot/indentLine'                                          " indentation markers
"
"
"  ----------
"  ----------  SYNTAX  ----------
Plug 'sheerun/vim-polyglot'                                         " language pack
Plug 'evidens/vim-twig', {'for': ['html', 'twig']}                  " Twig HTML
"
"
"  ----------
"  ----------  UTILITIES  ----------
Plug 'christoomey/vim-tmux-navigator'                               " tmux  navigator
Plug 'tpope/vim-dispatch'                                           " Kick off builds and test suites using one of several asynchronous adapters
Plug 'radenling/vim-dispatch-neovim'                                " for dispatch and Neovim
Plug 'tpope/vim-surround'                                           " surround everything
Plug 'tpope/vim-fugitive'                                           " Git awesomness
Plug 'tpope/vim-rhubarb'                                            " extension for vim awesoness
Plug 'tpope/vim-vinegar'                                            " enhances netrw
Plug 'tpope/vim-commentary'                                         " Comment stuff out. <gcc>
" Plug 'ervandew/supertab'                                            "  allows you to use <Tab> for all your insert completion
Plug 'SirVer/ultisnips'                                             " alias / snippets
Plug 'janko-m/vim-test'                                             " run tests
"
"
"  ----------
"  ----------  LINTING  ----------
Plug 'w0rp/ale'                                                     " Ale linting
"
"
"  ----------
"  ----------  SEARCH  ----------
Plug '/usr/local/opt/fzf'                                           " serach everything
Plug 'junegunn/fzf.vim'                                             " search everything
Plug 'mileszs/ack.vim'                                              " search tool from Vim
Plug 'skwp/greplace.vim'                                            " search and replace across many files
"
"
"  ----------
"  ----------  DEBUGING  ----------
Plug 'joonty/vdebug'                                                " Xdebug
"
"
"  ----------
"  ----------  DATABASE  ----------
Plug 'tpope/vim-dadbod'                                             " DB interaction
"
"
"  ----------
"  ----------  PHP  ----------
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }                " PHP inserting use statements
Plug 'tobyS/pdv', { 'for': 'php' }                                  " PHP Documentor for VIM
"
"
"  ----------
"  ----------  GOLANG  ----------
Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }     " Golang awesomness
"
"
"  ----------
"  ----------  JAVASCRIPT  ----------
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }               " JS Documentor
"
"
"  ----------
"  ----------  HELM  ----------
Plug 'towolf/vim-helm', { 'for' : 'helm' }                          " for helm charts
"
"
"  ----------
"  ----------  MARKDOWN  ----------
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }    " markdown preview
"
"
"  ----------
"  ----------  KUBERNETES  ----------
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'

" All of your Plugs must be added before the following line
call plug#end()
