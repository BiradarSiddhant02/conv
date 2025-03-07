import sys
import argparse
from num import Num

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="-m <mode/string> -l <length/int> -n <number/string>")

    parser.add_argument("-m", type=str, help="mode (hex, dec, bin)")
    parser.add_argument("-l", type=int, help="length (32, 64)")
    parser.add_argument("-n", type=str, help="number")

    args = parser.parse_args(sys.argv[1:])

    # Check if any required argument is missing
    if not all(vars(args).values()):
        print("Error: one or more arguments missing")
        exit()

    try:
        mode = args.m
        length = int(args.l)
        number = args.n
    except (ValueError, AttributeError) as e:
        print("Error: one or more arguments are invalid")
        exit()

    # flags for checking valid arguments
    mode_valid = False
    length_valid = False
    number_valid = False

    # check for valid arg : 'mode'
    if mode.lower() in ("hex", "dec", "bin"):
        mode_valid = True

    # check for valid arg : 'len'
    if length in (32, 64):
        length_valid = True

    # check for valid arg : 'number'
    if mode_valid and length_valid:
        if mode.lower() == "hex":
            if number and all(c.isdigit() or c.lower() in 'abcdef' for c in number):
                number_valid = True
        elif mode.lower() == "dec":
            if number and all(c.isdigit() for c in number):
                number_valid = True
        elif mode.lower() == "bin":
            if number and all(c in '01' for c in number):
                number_valid = True

    # create a object of class 'Num' if all args are verified to be valid
    if mode_valid and length_valid and number_valid:
        # print(mode_valid, length_valid, number_valid)
        num = Num(mode, length, number)
    else:
        print("Error: one or more arguments are invalid")
        exit()

    # output the converted values
    print(f"Dec: {num.dec.upper()}")
    print(f"Hex: 0x{num.hex.upper()}")
    print(f"Bin: 0b{num.bin.upper()}")
