#!/bin/bash

newname=cpu-$(date "+%Y-%m-%d_%H-%M-%S")
prefix="$HOME/llm/llamacpp-builds/$newname"
mkdir -p "$prefix"

# setup llamacpp build dir
rm -rf ~/llm/llamacpp/build
mkdir ~/llm/llamacpp/build
cd ~/llm/llamacpp/build

# build llamacpp cpu
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DGGML_NATIVE=ON \
  -DBUILD_SHARED_LIBS=OFF \
  -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
  -DCMAKE_INSTALL_PREFIX="$prefix" \
  -DCMAKE_INSTALL_RPATH='$ORIGIN/../lib'

cmake --build . --config Release -j$(nproc)
cmake --install . --strip
