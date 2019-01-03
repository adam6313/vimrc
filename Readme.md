## Vimrc

This is my vim configuration. for basic use and go,  js develop.

# bundle

the bundles I installed as below:

* [vim-pathogen](https://github.com/tpope/vim-pathogen): plugin manager that i choose

* [nerdtree](https://github.com/scrooloose/nerdtree): filesystem explorer

* [tagbar](http://majutsushi.github.io/tagbar/)

* [tagbar-phpctags](https://github.com/vim-php/tagbar-phpctags.vim)

    run ``make`` at **bundle/tagbar-phpctags.vim** to install phpctags (already write into install.sh)

* align

    ``\t=`` Align assignments.  
    ``\t,`` Align on commas.  
    ``\tsp`` Align on whitespace.  
    ``\acom`` Align comments.  
    ``\Htd`` Align HTML tables.  

* nerdcommmenter

    ``\cc``  Add general comment.  
    ``\cm``  Add block comment.  
    ``\cu``  Remove comment.  

* [supertab](https://github.com/ervandew/supertab): use <tab> for all insert completion

* phpfolding

* indenthtml

* SearchComplete

* [ctrlp](https://github.com/kien/ctrlp.vim): nice file finder

* vim-surround

* [autoclose](https://github.com/Townk/vim-autoclose)

* [matchit](https://github.com/vim-scripts/matchit.zip)

* [vim-airline](https://github.com/bling/vim-airline)

    _use PowerlineSymbols_

    if you want to use powerline symbols, just add `let g:airline_powerline_fonts = 1` to vimrc.

    install font with [powerline font installation](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation).

* [vim-fugitive](https://github.com/tpope/vim-fugitive): a beautiful and colorful status bar

* [syntastic](https://github.com/scrooloose/syntastic): syntax checker
