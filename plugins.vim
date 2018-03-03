
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/bundle')
" vim hardtime
" Plug 'takac/vim-hardtime'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'mhartington/oceanic-next'
Plug 'ajmwagar/vim-deus'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'gilgigilgil/anderson.vim'
Plug 'rakr/vim-two-firewatch'
" Plug 'romainl/Apprentice'
" Plug 'fatih/molokai'
" Plug 'nightsense/simplifysimplify'
Plug 'VundleVim/Vundle.vim'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'} 
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'joonty/vdebug', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }
" HTML, TWIG
Plug 'evidens/vim-twig', {'for': ['html', 'twig']}
" GO
Plug 'fatih/vim-go', { 'for': 'go', 'do': 'GoInstallBinaries' }
Plug 'jodosha/vim-godebug', {'for': 'go'}
" MARKDOWN
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
" JAVASCRIPT
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
" Plugs below the line may really impact load time
Plug 'Shougo/deoplete.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

" All of your Plugs must be added before the following line
call plug#end()
