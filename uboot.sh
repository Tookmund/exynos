#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

cd u-boot
make clean -j4
make snow_defconfig
make -j4
cd ..

