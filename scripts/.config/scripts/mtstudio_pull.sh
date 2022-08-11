#!/usr/bin/env bash

echo "---- PULL MAIN ----"
pushd $HOME/programming/mtstudio/
git pull --recurse-submodules

echo -e "\n---- PULL UTILS ----"
pushd projects/utils
git pull --recurse-submodules
popd

echo -e "\n---- PULL RENDERING ----"
pushd projects/rendering
git pull --recurse-submodules
popd

echo -e "\n---- PULL WAVELET PROJ ----"
pushd projects/wavelet_video_compression
git pull --recurse-submodules
popd

popd
