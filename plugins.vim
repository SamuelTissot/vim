
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
Plug 'fenetikm/falcon'                                              " Theme
Plug 'itchyny/lightline.vim'                                        " status line
" Plug 'sheerun/vim-polyglot'                                       " language pack
Plug 'autozimu/LanguageClient-neovim', {                           
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug '/usr/local/opt/fzf'                                           " serach everything
Plug 'junegunn/fzf.vim'                                             " search everything
Plug 'roxma/nvim-completion-manager'                                " completion
Plug 'janko-m/vim-test'                                             " run tests
Plug 'tpope/vim-db'                                                 " DB interaction
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'

 Plug 'marcweber/vim-addon-mw-utils'                               " for snipmate
 Plug 'tomtom/tlib_vim'                                            " for snipmate
 Plug 'garbas/vim-snipmate'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
" PHP
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'phpactor/phpactor' ,  {'for': 'php', 'do': 'composer install'}
" Plug 'stanangeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} 
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'joonty/vdebug', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }                                          " PHP comments
" HTML, TWIG
Plug 'evidens/vim-twig', {'for': ['html', 'twig']}
" GO
Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }
Plug 'jodosha/vim-godebug', {'for': 'go'}
" MARKDOWN
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
" JAVASCRIPT
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
" Plugs below the line may really impact load time

" All of your Plugs must be added before the following line
call plug#end()
