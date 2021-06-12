#!/bin/bash

set -e

{
   cd ~/src/vim
   git reset --hard HEAD
   # git checkout v8.2.2976
   # v8.2.2600 93e1cae73
   # v8.2.2976 8de901e1f

   ./configure \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python3-config-dir=$(python3-config --configdir) \
      --enable-perlinterp=yes \
      --enable-gui=gtk3 \
      --enable-cscope \
      --prefix=$HOME

   make -j3
   make test
   echo make install
}
