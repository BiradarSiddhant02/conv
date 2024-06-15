#include "Num.h"
#include <bitset>
#include <sstream>
#include <iomanip>
#include <algorithm>
#include <stdexcept>

Num::Num(const std::string& base, int length, const std::string& number)
    : base(base), length(length), number(number) {
    if (length <= 0) {
        throw std::invalid_argument("Length must be a positive integer");
    }

    if (base == "hex") {
        hex = padString(number, (length) / 4, "0");  // Hex length is length / 4 (rounded up)
        dec = hexDec();
        bin = hexBin();
    } else if (base == "bin") {
        bin = padString(number, length, "0");
        hex = binHex();
        dec = binDec();
    } else if (base == "dec") {
        dec = padString(number, length, "0");
        hex = decHex();
        bin = decBin();
    } else {
        throw std::invalid_argument("Base must be 'hex', 'bin', or 'dec'");
    }
}

std::string Num::padString(const std::string& str, int finalLen, const std::string& padChar) const {
    if (str.length() >= static_cast<size_t>(finalLen)) {
        return str;
    }
    return std::string(finalLen - str.length(), padChar[0]) + str;
}

std::string Num::hexBin() const {
    std::string binary;
    for (char c : hex) {
        int value = std::stoi(std::string(1, c), nullptr, 16);
        binary.append(std::bitset<4>(value).to_string());
    }
    return padString(binary, length, "0");
}

std::string Num::hexDec() const {
    unsigned long long decimalValue = std::stoull(hex, nullptr, 16);
    return std::to_string(decimalValue);
}

std::string Num::decHex() const {
    unsigned long long decimalValue = std::stoull(dec);
    std::stringstream ss;
    ss << std::hex << decimalValue;
    std::string hexStr = ss.str();
    std::transform(hexStr.begin(), hexStr.end(), hexStr.begin(), ::toupper);
    return padString(hexStr, length / 4, "0");
}

std::string Num::decBin() const {
    unsigned long long decimalValue = std::stoull(dec);
    std::bitset<64> bits(decimalValue); // Assuming 64 bits is enough for the length
    std::string binary = bits.to_string();
    // Remove leading zeroes
    binary.erase(0, binary.find_first_not_of('0'));
    return padString(binary, length, "0");
}

std::string Num::binHex() const {
    std::stringstream res;
    for (size_t i = 0; i < bin.size(); i += 4) {
        std::string chunk = bin.substr(i, 4);
        int value = std::stoi(chunk, nullptr, 2);
        res << std::hex << value;
    }
    std::string hexStr = res.str();
    std::transform(hexStr.begin(), hexStr.end(), hexStr.begin(), ::toupper);
    return padString(hexStr, length / 4, "0");
}

std::string Num::binDec() const {
    unsigned long long decimalValue = std::stoull(bin, nullptr, 2);
    return std::to_string(decimalValue);
}
