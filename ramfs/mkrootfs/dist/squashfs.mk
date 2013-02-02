.PHONY: squashfs
squashfs: mkbase \
      	mksystem \
       	mkbusybox \
       	mkhello
	#cd $(ROOTFS) && find . -name *.so* | $(STRIP)
	mksquashfs $(ROOTFS) $(PJ_PREFIX)/boot/$(ROOTFS_FILE)
	gzip -9 -c $(PJ_PREFIX)/boot/$(ROOTFS_FILE) > $(PJ_PREFIX)/boot/$(ROOTFS_FILE_WITH_GZ)
