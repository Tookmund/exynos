#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

cd linux-$VERSION
make distclean -j4
cp ../snow_defconfig arch/arm/configs
make snow_defconfig
make LOADADDR=0x8000 uImage -j4
make dtbs -j4
#make modules modules_install -j4
cd ..
