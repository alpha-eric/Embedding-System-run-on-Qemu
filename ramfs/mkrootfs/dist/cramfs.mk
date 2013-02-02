.PHONY: cramfs
cramfs: mkbase \
      	mksystem \
       	mkbusybox \
       	mkhello
	#cd $(ROOTFS) && find . -name *.so* | $(STRIP)
	mkcramfs $(ROOTFS) $(PJ_PREFIX)/boot/$(ROOTFS_FILE)
	gzip -9 -c $(PJ_PREFIX)/boot/$(ROOTFS_FILE) > $(PJ_PREFIX)/boot/$(ROOTFS_FILE_WITH_GZ)
	#cd $(PJ_PREFIX)/boot && mkimage -n 'uboot ramdisk' -A arm -O linux -T ramdisk -C none -a 0x3000000 -d rootfs.cramfs.bin.gz u-rootfs.cramfs.bin.gz
