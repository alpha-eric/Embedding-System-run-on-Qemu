.PHONY: jffs2
jffs2: 	mkbase \
      	mksystem \
       	mkbusybox \
       	mkhello
	#cd $(ROOTFS) && find . -name *.so* | $(STRIP)
	mkfs.jffs2 -d $(ROOTFS) -o $(PJ_PREFIX)/boot/$(ROOTFS_FILE)
	gzip -9 -c $(PJ_PREFIX)/boot/$(ROOTFS_FILE) > $(PJ_PREFIX)/boot/$(ROOTFS_FILE_WITH_GZ)
