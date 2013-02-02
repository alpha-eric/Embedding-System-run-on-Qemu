.PHONY: mkbase
mkbase:	
	@echo
	@echo "Building rootfs base $@...."
	install -d -m 0755 $(ROOTFS_ETC)
	install -d -m 0755 $(ROOTFS_RC)
	install -d -m 0755 $(ROOTFS_RCS)
	install -d -m 0755 $(ROOTFS_RCK)
	install -d -m 0755 $(ROOTFS_INIT)
	install -d -m 0755 $(ROOTFS_DEV)
	install -d -m 0755 $(ROOTFS_DEV)/pts
	install -d -m 0755 $(ROOTFS_LIB)
	install -d -m 0755 $(ROOTFS_MOD)
	install -d -m 0755 $(ROOTFS_BIN)
	install -d -m 0755 $(ROOTFS_SBIN)
	install -d -m 0755 $(ROOTFS_VAR)
	install -d -m 0755 $(ROOTFS_WWW)
	install -d -m 0755 $(ROOTFS_PROC)
	install -d -m 0755 $(ROOTFS_OPT)
	install -d -m 0755 $(ROOTFS_USR)
	install -d -m 0755 $(ROOTFS_USR_BIN)
	install -d -m 0755 $(ROOTFS_USR_SBIN)
	install -d -m 0755 $(ROOTFS_SYS)
	install -d -m 0755 $(ROOTFS_TMP)	
