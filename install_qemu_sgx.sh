sudo apt-get install libusb-dev libusbredirparser-dev -y
sudo pip3 install meson ninja
tag="sgx-v5.1.0-rc3-3"
git clone https://github.com/intel/qemu-sgx
cd qemu-sgx || exit
git checkout "$tag"
scripts/git-submodule.sh update ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
./configure --disable-git-update --enable-kvm --enable-vnc --enable-curses --enable-spice --enable-gtk --enable-usb-redir --target-list=x86_64-softmmu --disable-werror
make "-j$(nproc)" 2>error_make.txt
sudo make install
