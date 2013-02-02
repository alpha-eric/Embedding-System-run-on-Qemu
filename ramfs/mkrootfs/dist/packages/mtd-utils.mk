.PHONY: mkmtdutils
mkmtdutils:
	$(OBJCOPY) $(PREFIX_SBIN)/blockdev $(ROOTFS_SBIN)/blockdev
