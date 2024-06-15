#include <iostream>
#include <string>
#include <stdexcept>
#include <cctype>
#include "Num.h"

bool isValidHex(const std::string &number) {
    for (char c : number) {
        if (!std::isdigit(c) && (std::tolower(c) < 'a' || std::tolower(c) > 'f')) {
            return false;
        }
    }
    return true;
}

bool isValidDec(const std::string &number) {
    for (char c : number) {
        if (!std::isdigit(c)) {
            return false;
        }
    }
    return true;
}

bool isValidBin(const std::string &number) {
    for (char c : number) {
        if (c != '0' && c != '1') {
            return false;
        }
    }
    return true;
}

int main(int argc, char *argv[]) {
    if (argc != 7) {
        std::cerr << "Error: Missing arguments.\nUsage: -m <mode> -l <length> -n <number>" << std::endl;
        return 1;
    }

    std::string mode;
    int length;
    std::string number;

    for (int i = 1; i < argc; i += 2) {
        std::string arg = argv[i];
        if (arg == "-m") {
            mode = argv[i + 1];
        } else if (arg == "-l") {
            length = std::stoi(argv[i + 1]);
        } else if (arg == "-n") {
            number = argv[i + 1];
        } else {
            std::cerr << "Error: Unknown argument " << arg << std::endl;
            return 1;
        }
    }

    bool mode_valid = false;
    bool length_valid = false;
    bool number_valid = false;

    if (mode == "hex" || mode == "dec" || mode == "bin") {
        mode_valid = true;
    }

    if (length == 32 || length == 64) {
        length_valid = true;
    }

    if (mode_valid && length_valid) {
        if (mode == "hex") {
            if (isValidHex(number)) {
                number_valid = true;
            }
        } else if (mode == "dec") {
            if (isValidDec(number)) {
                number_valid = true;
            }
        } else if (mode == "bin") {
            if (isValidBin(number)) {
                number_valid = true;
            }
        }
    }

    if (mode_valid && length_valid && number_valid) {
        try {
            Num num(mode, length, number);
            std::cout << "Dec: " << num.dec << std::endl;
            std::cout << "Hex: 0x" << num.hex << std::endl;
            std::cout << "Bin: 0b" << num.bin << std::endl;
        } catch (const std::invalid_argument &e) {
            std::cerr << "Error: " << e.what() << std::endl;
            return 1;
        }
    } else {
        std::cerr << "Error: One or more arguments are invalid." << std::endl;
        return 1;
    }

    return 0;
}
