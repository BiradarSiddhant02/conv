#!/bin/bash

pip install pyinstaller
rm -rf build dist
pyinstaller main.py --onefile --noconsole --name conv
sudo cp ./dist/conv /bin/

