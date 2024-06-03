# conv
Terminal tool to convert a number to hexadecimal, binary and decimal

## Setup
### Basic Requirments
- Python 3.9 or above
- sudo previledges
- pip

### Installation
- Clone the repo
```
git clone https://github.com/BiradarSiddhant02/conv.git 
```
- Run tests
```
chmod +x test1.sh test2.sh
./test1.sh
./test2.sh 
```
- Compile and install the executable
```
chmod +x build.sh
sudo ./build.sh
```
note: the "build.sh" script will install 'pyinstaller' 

## Usage
```
conv -m <mode> -l <length> -n <number>
```
mode: specifies the base of the number (hex, bin, dec)

length: specifies the length of the output (32, 64)

number: the number to be converted