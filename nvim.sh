#!/bin/bash

set -e

{
   cd ~/src/neovim
   git switch master
   git reset --hard HEAD
   git pull
   git checkout v0.11.0
   make distclean
   make deps
   make CMAKE_BUILD_TYPE=Release
   # make functionaltest
   make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX="$HOME/local/nvim" install

   # can unsinstall with:
   # cmake --build build/ --target uninstall
   if [[ ! -L ~/bin/nvim ]]; then
      ln -s ~/local/nvim/bin/nvim ~/bin/nvim
   fi
   if [[ ! -d ~/.config/nvim ]]; then
      mkdir -p ~/.config/nvim
   fi
   if [[ ! -f ~/.config/nvim/init.vim ]]; then
      ln -s ~/src/neil/nvim/neovim.config/init.vim ~/.config/nvim/init.vim
   fi
   ~/bin/nvim --version
   ~/bin/nvim -c 'PlugUpgrade' -c 'PlugInstall' -c 'PlugUpdate' -c 'TSUpdate' -c 'qa!'
}
