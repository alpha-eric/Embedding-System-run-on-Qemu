.PHONY: ext2
ext2: 	mkbase \
      	mksystem \
       	mkbusybox \
	mklighttpd \
       	mkhello
	#cd $(ROOTFS) && find . -name *.so* | $(STRIP)
	genext2fs -b 8324 -d $(ROOTFS) $(PJ_PREFIX)/boot/$(ROOTFS_FILE)
	gzip -9 -c $(PJ_PREFIX)/boot/$(ROOTFS_FILE) > $(PJ_PREFIX)/boot/$(ROOTFS_FILE_WITH_GZ)
	#cd $(PJ_PREFIX)/boot && mkimage -n 'uboot ramdisk' -A arm -O linux -T ramdisk -C gzip -d rootfs.cpio.gz u-rootfs.cpio.gz
