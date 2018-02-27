filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'mhartington/oceanic-next'
Plugin 'ajmwagar/vim-deus'
" Plugin 'gilgigilgil/anderson.vim'
" Plugin 'rakr/vim-two-firewatch'
" Plugin 'romainl/Apprentice'
" Plugin 'fatih/molokai'
" Plugin 'nightsense/simplifysimplify'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'StanAngeloff/php.vim'
Plugin 'lvht/phpcd.vim'
Plugin 'Shougo/deoplete.nvim'
" Plugin 'joonty/vdebug'
Plugin 'reafle/vdebug' " deprorary fork for vdebug until main repo works
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'evidens/vim-twig'
Plugin 'fatih/vim-go'
Plugin 'jodosha/vim-godebug'
" plugins below the line may really impact load time
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
