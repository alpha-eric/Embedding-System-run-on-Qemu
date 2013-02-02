#!/bin/sh
TARGET=versatilepb
CONSOLE=ttyAMA0
UBOOT=$PJ_PREFIX/boot/u-boot.bin
QEMU=qemu-system-arm
sudo $QEMU -M $TARGET -nographic \
    -net nic -net tap,ifname=tap0,script=./qemu-ifup.sh \
    -append "console=$CONSOLE" \
    -kernel $UBOOT
