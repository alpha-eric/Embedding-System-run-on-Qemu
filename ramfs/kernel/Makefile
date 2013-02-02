SOURCE=$(PJ_KERNEL)

DEFCONFIG=$(PJ_KERNEL)/configs/$(PJ_NAME)_config

export ARCH=$(PJ_ARCH)
ifneq (,$(PJ_TARGET))
export CROSS_COMPILE=$(PJ_TARGET)-
endif

.PHONY: all clean distclean install prepare_modules menuconfig defconfig copy
all: prepare_modules
install: prepare_modules
menuconfig:
	make -C $(SOURCE) ARCH=$(PJ_ARCH) CROSS_COMPILE=$(PJ_TARGET) menuconfig
defconfig:
	make -C $(SOURCE) ARCH=$(PJ_ARCH) CROSS_COMPILE=$(PJ_TARGET) defconfig
copy:
	cp $(SOURCE)/.config $(DEFCONFIG)
clean:
	-make -C $(SOURCE) clean

distclean:
	-make -C $(SOURCE) distclean
	rm -f $(SOURCE)/.configured

prepare_modules: $(SOURCE)/.configured
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	make -C $(SOURCE) all
	#make -C $(SOURCE) uImage
	make -C $(SOURCE) modules_install INSTALL_MOD_PATH=$(PJ_PREFIX)
	[ ! -d $(PJ_PREFIX)/boot ] && mkdir $(PJ_PREFIX)/boot || echo -n ""
	cp $(SOURCE)/arch/$(PJ_ARCH)/boot/*Image $(PJ_PREFIX)/boot

.PHONY: $(SOURCE)/.configured
$(SOURCE)/.configured:
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	[ -f $(DEFCONFIG) ]
	if [ "$$(md5sum $(SOURCE)/.configured | cut -b1-32)" != \
		"$$(md5sum $(DEFCONFIG) | cut -b1-32)" ]; then \
		cp $(DEFCONFIG) $(SOURCE)/.config && \
		make -C $(SOURCE) clean && \
		make -C $(SOURCE) dep && \
		cp $(DEFCONFIG) $(SOURCE)/.configured; \
	fi

.PHONY: headers_install
headers_install: $(SOURCE)/.configured
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	make -C $(SOURCE) INSTALL_HDR_PATH=$(PJ_PREFIX) headers_install


