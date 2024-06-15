#!/bin/bash

rm -rf build
mkdir build
cd build
cmake ..
make -j4
sudo cp ./conv /bin/