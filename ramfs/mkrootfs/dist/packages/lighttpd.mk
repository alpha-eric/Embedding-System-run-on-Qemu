.PHONY: mklighttpd
mklighttpd:
	$(OBJCOPY) $(PREFIX_SBIN)/$(PJ_TARGET)-lighttpd $(ROOTFS_SBIN)/lighttpd
	install -d -m 755 $(ROOTFS_ETC)/lighttpd
	install -m 644 $(PREFIX_ETC)/lighttpd/lighttpd.conf $(ROOTFS_ETC)/lighttpd
	install -m 755 $(PREFIX_INIT)/lighttpd.sh $(ROOTFS_INIT)
	install -d -m 755 $(ROOTFS_LIB)
	$(OBJCOPY) $(PREFIX_LIB)/mod_indexfile.so $(ROOTFS_LIB)/mod_indexfile.so
	$(OBJCOPY) $(PREFIX_LIB)/mod_dirlisting.so $(ROOTFS_LIB)/mod_dirlisting.so
	$(OBJCOPY) $(PREFIX_LIB)/mod_staticfile.so $(ROOTFS_LIB)/mod_staticfile.so
	ln -sf ../init.d/lighttpd.sh $(ROOTFS_RCS)/S02lighttpd.sh
	ln -sf ../init.d/lighttpd.sh $(ROOTFS_RCK)/K98lighttpd.sh
