#!/bin/sh
DEVICE=$1
ROOTFS=${DEVICE}2
parted $DEVICE mklabel gpt #FYI - This will prompt
cgpt create -z $DEVICE
cgpt create $DEVICE
export OFFSET=$(expr 8 \* 1024)
export SIZE=$(expr 64 \* 1024)
cgpt add -i 1 -t kernel -b $OFFSET -s $SIZE -l kernel -S 1 -T 5 -P 10 $DEVICE
export OFFSET=$(expr $OFFSET + $SIZE)
export SIZE=$(expr $(cgpt show $DEVICE | grep "Sec GPT table" | tr -s " " | cut -f2 -d' ') - $OFFSET)
cgpt add -i 2 -t data -b $OFFSET -s $SIZE -l root $DEVICE

partprobe $DEVICE
mkfs.ext4 $ROOTFS
