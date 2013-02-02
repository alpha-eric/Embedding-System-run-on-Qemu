ROOTFS_FILE := rootfs.img
ROOTFS_FILE_WITH_GZ := rootfs.img.gz
ROOTFS := $(PJ_ROOT)/mkrootfs/rootfs

ifneq (,$(PJ_TARGET))
export CROSS_COMPILE=$(PJ_TARGET)-
endif
OBJCOPY := $(CROSS_COMPILE)objcopy -S
STRIP := $(CROSS_COMPILE)strip -g --strip-unneeded

.PHONY: all clean distclean install cleanall mkrootfs
all: install
install: cleanall mkrootfs
mkrootfs:
	mkdir $(ROOTFS)
	make $(PJ_NAME)
	
clean: cleanall
distclean: cleanall
cleanall:
	rm -rf $(ROOTFS)

include env.mk
include dist/packages/*.mk
include dist/$(PJ_NAME).mk
