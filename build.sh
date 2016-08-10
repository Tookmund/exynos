#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

export VERSION=4.7
export EXTRAVERSION=tookmund-exynos
export CONF=snow_defconfig

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

#sh uboot.sh
sh linux.sh
sh vboot.sh
