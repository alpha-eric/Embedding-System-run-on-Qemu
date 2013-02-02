SOURCE=e2fsprogs-1.42.6

ifneq (,$(PJ_TARGET))
CROSS_COMPILE=$(PJ_TARGET)-
endif

.PHONY: all clean distclean openSource install menuconfig
all: $(SOURCE)/.configured
	make -C $(SOURCE)
clean:
	make -C $(SOURCE) clean

distclean:
	make -C $(SOURCE) distclean
	rm -f $(SOURCE)/.configured

$(SOURCE)/.configured:
	[ "$(PJ_PREFIX)" != "" ]
	cd $(SOURCE) && \
	./configure \
        --target=$(PJ_TARGET) \
	--host=$(PJ_TARGET) \
	--build=$(PJ_HOST) \
        --prefix=$(PJ_PREFIX)
	touch $(SOURCE)/.configured

install: $(SOURCE)/.configured
	make -C $(SOURCE) install
	[ ! -d $(PJ_PREFIX)/include/uuid ] && mkdir $(PJ_PREFIX)/include/uuid || echo ""
	cp $(SOURCE)/lib/uuid/uuid.h $(PJ_PREFIX)/include/uuid
	cp $(SOURCE)/lib/libuuid.a $(PJ_PREFIX)/lib

