SOURCE=attr-2.4.46

ifneq (,$(PJ_TARGET))
CROSS_COMPILE=$(PJ_TARGET)-
endif

.PHONY: all clean distclean openSource install menuconfig
all: $(SOURCE)/.configured
	make -C $(SOURCE)
clean:
	make -C $(SOURCE) clean

distclean:
	make -C $(SOURCE) clean
	rm -f $(SOURCE)/.configured

$(SOURCE)/.configured:
	[ "$(PJ_PREFIX)" != "" ]
	cd $(SOURCE) && \
	./configure \
	--host=$(PJ_TARGET) \
	--build=$(PJ_HOST) \
        --prefix=$(PJ_PREFIX) \
	--libdir=$(PJ_PREFIX)/lib \
	--libexecdir=$(PJ_PREFIX) /lib
	touch $(SOURCE)/.configured

install: $(SOURCE)/.configured
	make -C $(SOURCE) install install-dev install-lib
