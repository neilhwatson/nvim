#!/bin/sh

set -e

{
   # Use dwm float mode or geometry tests will fail
   # export TEST_MAY_FAIL=Test_geometry
   cd ~/src/vim
   git reset --hard HEAD
   git switch master
   git reset --hard HEAD
   git pull
   git checkout v9.0.1103

   ./configure \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python3-config-dir=$(python3-config --configdir) \
      --enable-perlinterp=yes \
      --enable-gui=gtk3 \
      --enable-cscope \
      --prefix=$HOME

   make -j4
   make test
   make install
}
