.PHONY: mksystem
mksystem:
	cat dist/packages/toolchain.list | (cd $(PJ_PREFIX)/lib && cpio -pv $(ROOTFS)/lib)
	cat dist/packages/system.list | (cd $(PJ_PREFIX) && cpio -pv $(ROOTFS))
	ln -sf ../rc.sysinit $(ROOTFS_RCS)/S01sysinit
	ln -sf ../rc.sysinit $(ROOTFS_RCK)/K99sysinit
	ln -sf ../rc.local $(ROOTFS_RCS)/S99local
	ln -sf ../rc.local $(ROOTFS_RCK)/K01local	
