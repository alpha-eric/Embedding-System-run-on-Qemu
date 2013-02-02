SOURCE=busybox-1.20.2

ifneq (,$(PJ_TARGET))
CROSS_COMPILE=$(PJ_TARGET)-
endif

.PHONY: all clean distclean openSource install menuconfig
all: openSource
clean:
	make -C $(SOURCE) clean

distclean:
	make -C $(SOURCE) distclean
	rm -f $(SOURCE)/.config

openSource: $(SOURCE)/.config
	make -C $(SOURCE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) 

$(SOURCE)/.config: $(SOURCE)/busy_box.config
	[ "$(PJ_PREFIX)" != "" ]
	cp $(SOURCE)/busy_box.config $(SOURCE)/.config
	make -C $(SOURCE) oldconfig

install: $(SOURCE)/.config
	make -C $(SOURCE) CONFIG_PREFIX=$(PJ_PREFIX) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH)  install

menuconfig:
	make -C $(SOURCE) CONFIG_PREFIX=$(PJ_PREFIX) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) menuconfig

