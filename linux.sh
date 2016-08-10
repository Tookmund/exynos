#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

cd linux-$VERSION

#make distclean -j4
cp ../$CONF arch/arm/configs
cp ../sd8797_uapsta.bin firmware
make $CONF
make LOADADDR=0x8000 uImage -j4
make dtbs -j4
cd ..
