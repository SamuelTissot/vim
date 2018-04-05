
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
Plug 'fenetikm/falcon'                                              " Theme
Plug 'itchyny/lightline.vim'                                        " status line
Plug 'w0rp/ale'                                                     " Ale linting
Plug 'sheerun/vim-polyglot'                                         " language pack
Plug 'roxma/nvim-completion-manager'                                " completion
Plug '/usr/local/opt/fzf'                                           " serach everything
Plug 'junegunn/fzf.vim'                                             " search everything
Plug 'janko-m/vim-test'                                             " run tests
Plug 'tpope/vim-dadbod'                                             " DB interaction
Plug 'tpope/vim-dispatch'                                           " Kick off builds and test suites using one of several asynchronous adapters
Plug 'radenling/vim-dispatch-neovim'                                " for dispatch and Neovim
Plug 'mileszs/ack.vim'                                              " search tool from Vim
Plug 'skwp/greplace.vim'                                            " search and replace across many files
Plug 'tpope/vim-surround'                                           " surround everything
Plug 'tpope/vim-fugitive'                                           " Git awesomness
Plug 'tpope/vim-vinegar'                                            " enhances netrw
Plug 'tpope/vim-commentary'                                         " Comment stuff out. <gcc>
" Plug 'ervandew/supertab'                                            "  allows you to use <Tab> for all your insert completion
Plug 'SirVer/ultisnips'                                             " alias / snippets
Plug 'roxma/LanguageServer-php-neovim',  {
    \ 'for': 'php',
    \ 'do': 'composer install && composer run-script parse-stubs'
    \ }                                                             " PHP Language Server
Plug 'phpactor/phpactor' ,  {
    \ 'for': 'php', 
    \'do': 'composer install'
    \ }                                                             " PHP refactoring and introspection tools
Plug 'roxma/ncm-phpactor', { 'for': 'php' }                         " PHP phpactor integration for nvim-completion-manager
Plug 'stanangeloff/php.vim', { 'for': 'php' }                       " PHP An up-to-date Vim syntax for PHP
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
" Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} 
" Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }                " PHP inserting use statements
" Plug 'tobyS/pdv', { 'for': 'php' }                                  " PHP Documentor for VIM
Plug 'joonty/vdebug', { 'for': 'php' }                              " Xdebug
Plug 'evidens/vim-twig', {'for': ['html', 'twig']}                  " Twig HTML
Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries' }                  " Golang awesomness
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}                   " JS intellisense
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }               " JS Documentor
Plug 'towolf/vim-helm'                                              " for helm charts
Plug 'Yggdroot/indentLine'                                          " indentation markers

" All of your Plugs must be added before the following line
call plug#end()
