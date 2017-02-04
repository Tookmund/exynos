#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

cd linux-stable/arch/arm/boot
cp ../../../../kernel.its kernel.its
mkimage -f kernel.its uImage
vbutil_kernel \
        --keyblock /usr/share/vboot/devkeys/kernel.keyblock \
        --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \
        --arch arm \
        --version 1 \
        --config ../../../../cmdline \
        --vmlinuz uImage \
	--bootloader ../../../../u-boot/u-boot-dtb.bin \
        --pack chromeos-$EXTRAVERSION.kpart
cp chromeos-$EXTRAVERSION.kpart ../../../..

