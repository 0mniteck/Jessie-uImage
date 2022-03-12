#!/bin/bash
cd /linux-4.9-4.9.210
fakeroot make -j $(nproc) -f debian/rules.gen setup_armhf_none_armmp_real
make -j $(nproc) -C debian/build/build_armhf_none_armmp nconfig
fakeroot debian/rules source
fakeroot make -j $(nproc) -f debian/rules.gen build-arch_armhf_none_armmp_real && mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008000 -n "Linux-4.9.21" -d debian/build/build_armhf_none_armmp/arch/arm/boot/Image uImage && exit
# fakeroot make -j $(nproc) -f debian/rules.gen binary-arch_armhf_none_armmp_real
# fakeroot make -j $(nproc) -f debian/rules.gen binary-libc-dev_armhf
