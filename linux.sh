#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

cd linux-stable

#make distclean -j4
cp ../$CONF arch/arm/configs
mkdir -p firmware/mrvl
cp ../sd8797_uapsta.bin firmware/mrvl
make $CONF
make LOADADDR=0x8000 uImage -j4
make dtbs -j4
cd ..
