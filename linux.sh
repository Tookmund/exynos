#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

CONF=snow_defconfig

cd linux-$VERSION

# To use these add snow-snow.dts to Makefile
for i in ../snowdts/*
do
	cp $i arm/arch/boot/dts	
done
make distclean -j4
cp ../$CONF arch/arm/configs
make $CONF
make LOADADDR=0x8000 uImage -j4
make dtbs -j4
cd ..
