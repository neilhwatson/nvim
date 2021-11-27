#!/bin/bash

set -e

{
   export TEST_MAY_FAIL=Test_geometry
   cd ~/src/vim
   git reset --hard HEAD
   git switch master
   git reset --hard HEAD
   git pull
   git checkout v8.2.3682

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
