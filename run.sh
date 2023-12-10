#!/bin/sh
which clang
cd /usr/app
git clone https://github.com/liz3/ledit.git
cd ledit
if [ $# -eq 1 ]; then
  git checkout -t origin/$1
fi
git submodule update --init
mkdir build_x11
mkdir build_wayland
cd build_x11
CC=clang CXX=clang++ cmake -DPNG_SHARED=OFF -DCMAKE_BUILD_TYPE=Release .. && make -j2
cd ../build_wayland
CC=clang CXX=clang++ cmake -DPNG_SHARED=OFF -DGLFW_USE_WAYLAND=ON -DCMAKE_BUILD_TYPE=Release .. && make -j2
cd ..
cp build_x11/ledit /dist/ledit_linux_$(uname -m)_x11
cp build_wayland/ledit /dist/ledit_linux_$(uname -m)_wayland