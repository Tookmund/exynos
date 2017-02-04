#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-linux-gnueabihf, u-boot-tools, device-tree-compiler, and vboot-kernel-utils

export EXTRAVERSION=tookmund-exynos
export CONF=snow_defconfig

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

sh uboot.sh
sh linux.sh
sh vboot.sh
