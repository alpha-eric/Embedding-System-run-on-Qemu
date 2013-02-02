.PHONY: mkhello
mkhello:
	$(OBJCOPY) $(PREFIX_BIN)/hello $(ROOTFS_BIN)/hello
