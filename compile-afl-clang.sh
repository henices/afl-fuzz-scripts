#! /bin/sh

GREEN='\033[0;32m'
NC='\033[0m'

wget http://lcamtuf.coredump.cx/afl.tgz
tar xfz afl.tgz
rm afl.tgz
echo "Installing:"
echo `find . -type d -iname "afl-*"|sort|tail -1`
cd `find . -type d -iname "afl-*"|sort|tail -1`

export CC=clang
export CXX=clang++

printf "${GREEN}[+] Building afl-fuzz, afl-gcc etc.${NC}\n"
make

printf "${GREEN}[+] Building llvm_mode.${NC}\n"
make -C llvm_mode

printf "${GREEN}[+] Building libdislocator.${NC}\n"
make -C libdislocator

printf "${GREEN}[+] Building libtokencap.${NC}\n"
make -C libtokencap

printf "${GREEN}Provide sudo password for sudo make install.${NC}\n"
sudo make install

unset CC
unset CXX
