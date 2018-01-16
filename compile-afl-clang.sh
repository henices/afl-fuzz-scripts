#! /bin/sh

wget http://lcamtuf.coredump.cx/afl.tgz
tar xfz afl.tgz
rm afl.tgz
echo "Installing:"
echo `find . -type d -iname "afl-*"|sort|tail -1`
cd `find . -type d -iname "afl-*"|sort|tail -1`

export CC=clang
export CXX=clang++

echo '[+] Building afl-fuzz, afl-gcc etc.'
make

echo '[+] Building llvm_mode'
make -C llvm_mode

echo '[+] Building libdislocator'
make -C libdislocator

echo '[+] Building libtokencap'
make -C libtokencap

echo "Provide sudo password for sudo make install"
sudo make install

unset CC
unset CXX
