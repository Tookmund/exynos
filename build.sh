#!/bin/sh
# Build exynos kernel image
# Requires gcc-arm-gnueabihf, u-boot-tools, dtc, and vboot-kernel-tools

export VERSION=4.6.5
export INSTALL_MOD_PATH=/mnt
export EXTRAVERSION=tookmund-exynos

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

cd u-boot
make clean -j4
make snow_defconfig
make -j4
cd ..

cd linux-$VERSION
make distclean -j4
make exynos_defconfig
make LOADADDR=0x8000 uImage -j4
make modules -j4
make dtbs -j4
make modules_install -j4

cd arch/arm/boot
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
        --pack chromeos-$VERSION-$EXTRAVERSION.kpart
cp chromeos-$VERSION-$EXTRAVERSION.kpart ../../../..

