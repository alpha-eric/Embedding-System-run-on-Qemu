.PHONY: mkbusybox
mkbusybox:
	cat dist/packages/busybox.list | (cd $(PJ_PREFIX) && cpio -pv $(ROOTFS))
	#ln -sf bin/busybox $(ROOTFS)/init
