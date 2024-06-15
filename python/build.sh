#!/bin/bash

pip install pyinstaller
rm -rf dist build
pyinstaller main.py --onefile --noconsole --name conv
cp ./dist/conv /bin/
echo "Copied to /bin"