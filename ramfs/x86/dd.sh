#!/bin/sh

mkimage -n 'kernel' -A arm -O linux -T kernel -C none -a 0x00010000 -e 0x00010000 -d zImage uImage
mkimage -n 'u-boot ramdisk' -A arm -O linux -T ramdisk -C none -a 0x00800000 -e 0x00800000 -d rootfs.img.gz rootfs.uimg
dd if=/dev/zero of=flash.bin bs=1 count=10M
dd if=u-boot.bin of=flash.bin conv=notrunc bs=1
dd if=uImage of=flash.bin conv=notrunc bs=1 seek=2M
dd if=rootfs.uimg of=flash.bin conv=notrunc bs=1 seek=4M
