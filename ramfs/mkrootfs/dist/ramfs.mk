.PHONY: ramfs
ramfs: 	mkbase \
      	mksystem \
       	mkbusybox \
	mklighttpd \
       	mkhello
	#cd $(ROOTFS) && find . -name *.so* | $(STRIP)
	cd $(ROOTFS) && find .  | cpio -o --format=newc | gzip -9 > $(PJ_PREFIX)/boot/$(ROOTFS_FILE_WITH_GZ)
	#cd $(PJ_PREFIX)/boot && mkimage -n 'uboot ramdisk' -A arm -O linux -T ramdisk -C gzip -d rootfs.cpio.gz u-rootfs.cpio.gz
