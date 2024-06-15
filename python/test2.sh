#!/bin/bash

clear
# Test valid inputs
echo "Testing valid inputs:"
python3 main.py -m hex -l 32 -n 1a2b3c
python3 main.py -m dec -l 64 -n 1234567890
python3 main.py -m bin -l 32 -n 1010101010

# Test invalid mode
echo
echo "Testing invalid mode:"
python3 main.py -m oct -l 32 -n 1a2b3c

# Test invalid length
echo "Testing invalid length:"
python3 main.py -m hex -l 16 -n 1a2b3c
python3 main.py -m hex -l 128 -n 1a2b3c

# Test invalid number
echo
echo "Testing invalid number:"
python3 main.py -m hex -l 32 -n hello
python3 main.py -m bin -l 32 -n 1020

# Test missing arguments
echo
echo "Testing missing arguments:"
python3 main.py -m hex -l 32
python3 main.py -m hex -n 1a2b3c
python3 main.py -l 32 -n 1a2b3c
python3 main.py

# Test edge cases
echo
echo "Testing edge cases:"
python3 main.py -m hex -l 32 -n ffffffff
python3 main.py -m dec -l 32 -n 4294967295
python3 main.py -m bin -l 32 -n 11111111111111111111111111111111
