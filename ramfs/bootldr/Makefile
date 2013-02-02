SOURCE=u-boot-2010.03

ifneq (,$(PJ_TARGET))
CROSS_COMPILE=$(PJ_TARGET)-
endif

.PHONY: all clean distclean install
all: $(SOURCE)/.done
	make -C $(SOURCE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) all
	[ ! -d $(PJ_PREFIX)/boot ] && mkdir $(PJ_PREFIX)/boot || echo -n ""
	cp $(SOURCE)/u-boot.bin $(PJ_PREFIX)/boot
clean:
	make -C $(SOURCE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) clean

distclean:
	make -C $(SOURCE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) distclean
	rm -f $(SOURCE)/.done

$(SOURCE)/.done:
	make $(PJ_BOARD)_config -C $(SOURCE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(PJ_ARCH) 
	touch $(SOURCE)/.done

install: all
