#!/bin/bash

clear


# Test invalid mode
echo
echo "Testing invalid mode:"
echo "./build/conv -m oct -l 32 -n 1a2b3c"
./build/conv -m oct -l 32 -n 1a2b3c

# Test invalid length
echo "Testing invalid length:"
echo "./build/conv -m hex -l 16 -n 1a2b3c"
./build/conv -m hex -l 16 -n 1a2b3c
echo "./build/conv -m hex -l 128 -n 1a2b3c"
./build/conv -m hex -l 128 -n 1a2b3c

# Test invalid number
echo
echo "Testing invalid number:"
echo "./build/conv -m hex -l 32 -n hello"
./build/conv -m hex -l 32 -n hello
echo "./build/conv -m bin -l 32 -n 1020"
./build/conv -m bin -l 32 -n 1020

# Test missing arguments
echo
echo "Testing missing arguments:"
echo "./build/conv -m hex -l 32"
./build/conv -m hex -l 32
echo "./build/conv -m hex -n 1a2b3c"
./build/conv -m hex -n 1a2b3c
echo "./build/conv -l 32 -n 1a2b3c"
./build/conv -l 32 -n 1a2b3c
./build/conv

# Test edge cases
echo
echo "Testing edge cases:"
echo "./build/conv -m hex -l 32 -n ffffffff"
./build/conv -m hex -l 32 -n ffffffff
echo "./build/conv -m dec -l 32 -n 4294967295"
./build/conv -m dec -l 32 -n 4294967295
echo "./build/conv -m bin -l 32 -n 11111111111111111111111111111111"
./build/conv -m bin -l 32 -n 11111111111111111111111111111111

# Test valid inputs
echo "Testing valid inputs:"
echo "./build/conv -m hex -l 32 -n 1ab3c # check"
./build/conv -m hex -l 32 -n 1ab3c # check
echo "./build/conv -m dec -l 64 -n 1234567890"
./build/conv -m dec -l 64 -n 1234567890
echo "./build/conv -m bin -l 32 -n 000001"
./build/conv -m bin -l 32 -n 000001