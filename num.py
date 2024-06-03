class Num:
    def __init__(self, base: str, length: int, number: str):
        self.base = base
        self.length = length
        self.number = number

        if base == "hex":
            self.hex = number.zfill((self.length + 3) // 4)
            self.dec = self.hex_to_dec()
            self.bin = self.hex_to_bin()
        elif base == "dec":
            self.dec = number
            self.hex = self.dec_to_hex()
            self.bin = self.dec_to_bin()
        elif base == "bin":
            self.bin = number.zfill(self.length)
            self.hex = self.bin_to_hex()
            self.dec = self.bin_to_dec()

    def hex_to_dec(self) -> str:
        return str(int(self.number, 16))

    def hex_to_bin(self) -> str:
        bin_str = bin(int(self.number, 16))[2:]
        return bin_str.zfill(self.length)

    def dec_to_hex(self) -> str:
        return hex(int(self.number))[2:]

    def dec_to_bin(self) -> str:
        bin_str = bin(int(self.number))[2:]
        return bin_str.zfill(self.length)

    def bin_to_hex(self) -> str:
        hex_str = hex(int(self.number, 2))[2:]
        return hex_str.zfill((self.length + 3) // 4)

    def bin_to_dec(self) -> str:
        return str(int(self.number, 2))
