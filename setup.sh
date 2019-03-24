#!/bin/bash

mkdir ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp ./.vimrc ~

cd ~/.vim/bundle
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/flazz/vim-colorschemes
git clone https://github.com/tpope/vim-endwise
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/szw/vim-tags
