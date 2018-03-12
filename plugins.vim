
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
" vim hardtime
" Plug 'takac/vim-hardtime'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'mhartington/oceanic-next'
" Plug 'ajmwagar/vim-deus'
Plug 'fenetikm/falcon'
Plug 'itchyny/lightline.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'gilgigilgil/anderson.vim'
" Plug 'rakr/vim-two-firewatch'
" Plug 'romainl/Apprentice'
" Plug 'fatih/molokai'
" Plug 'nightsense/simplifysimplify'
Plug 'VundleVim/Vundle.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" 
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
"
"DB
Plug 'tpope/vim-db'
"
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'tobyS/vmustache'
Plug 'SirVer/ultisnips'
" PHP
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
Plug 'roxma/ncm-phpactor'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
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
Plug 'sheerun/vim-polyglot'

" All of your Plugs must be added before the following line
call plug#end()
