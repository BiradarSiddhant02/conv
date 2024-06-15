#ifndef NUM_H
#define NUM_H

#include <string>

class Num {
private:
    int length;
    std::string base;
    std::string number;

    std::string padString(const std::string &str, int finalLen, const std::string &padChar) const;

    std::string hexBin() const;
    std::string hexDec() const;
    std::string decHex() const;
    std::string decBin() const;
    std::string binHex() const;
    std::string binDec() const;

public:
    std::string hex;
    std::string dec;
    std::string bin;

    Num(const std::string& base, int length, const std::string& number);
};

#endif // NUM_H
