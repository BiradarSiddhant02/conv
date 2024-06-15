#!/bin/bash

clear
# Test valid inputs
echo "Testing valid inputs:"
conv -m hex -l 32 -n 1a2b3c
conv -m dec -l 64 -n 1234567890
conv -m bin -l 32 -n 1010101010

# Test invalid mode
echo
echo "Testing invalid mode:"
conv -m oct -l 32 -n 1a2b3c

# Test invalid length
echo "Testing invalid length:"
conv -m hex -l 16 -n 1a2b3c
conv -m hex -l 128 -n 1a2b3c

# Test invalid number
echo
echo "Testing invalid number:"
conv -m hex -l 32 -n hello
conv -m bin -l 32 -n 1020

# Test missing arguments
echo
echo "Testing missing arguments:"
conv -m hex -l 32
conv -m hex -n 1a2b3c
conv -l 32 -n 1a2b3c
conv

# Test edge cases
echo
echo "Testing edge cases:"
conv -m hex -l 32 -n ffffffff
conv -m dec -l 32 -n 4294967295
conv -m bin -l 32 -n 11111111111111111111111111111111
