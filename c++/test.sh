#!/bin/bash

clear


# Test invalid mode
echo
echo "Testing invalid mode:"
echo "conv -m oct -l 32 -n 1a2b3c"
conv -m oct -l 32 -n 1a2b3c

# Test invalid length
echo "Testing invalid length:"
echo "conv -m hex -l 16 -n 1a2b3c"
conv -m hex -l 16 -n 1a2b3c
echo "conv -m hex -l 128 -n 1a2b3c"
conv -m hex -l 128 -n 1a2b3c

# Test invalid number
echo
echo "Testing invalid number:"
echo "conv -m hex -l 32 -n hello"
conv -m hex -l 32 -n hello
echo "conv -m bin -l 32 -n 1020"
conv -m bin -l 32 -n 1020

# Test missing arguments
echo
echo "Testing missing arguments:"
echo "conv -m hex -l 32"
conv -m hex -l 32
echo "conv -m hex -n 1a2b3c"
conv -m hex -n 1a2b3c
echo "conv -l 32 -n 1a2b3c"
conv -l 32 -n 1a2b3c
conv

# Test edge cases
echo
echo "Testing edge cases:"
echo "conv -m hex -l 32 -n ffffffff"
conv -m hex -l 32 -n ffffffff
echo "conv -m dec -l 32 -n 4294967295"
conv -m dec -l 32 -n 4294967295
echo "conv -m bin -l 32 -n 11111111111111111111111111111111"
conv -m bin -l 32 -n 11111111111111111111111111111111

# Test valid inputs
echo "Testing valid inputs:"
echo "conv -m hex -l 32 -n 1ab3c # check"
conv -m hex -l 32 -n 1ab3c # check
echo "conv -m dec -l 64 -n 1234567890"
conv -m dec -l 64 -n 1234567890
echo "conv -m bin -l 32 -n 000001"
conv -m bin -l 32 -n 000001