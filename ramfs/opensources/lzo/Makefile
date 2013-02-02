SOURCE=lzo-2.06

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

