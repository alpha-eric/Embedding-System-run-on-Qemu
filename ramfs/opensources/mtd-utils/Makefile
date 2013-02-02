SOURCE=mtd-utils-1.5.0

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
	touch $(SOURCE)/.configured

install: $(SOURCE)/.configured
	make -C $(SOURCE) \
	WITHOUT_XATTR=1 \
	DESTDIR=$(PJ_PREFIX) \
	CROSS=$(CROSS_COMPILE) \
	ZLIBCPPFLAGS=-I$(PJ_PREFIX)/include \
	LZOCPPFLAGS=-I$(PJ_PREFIX)/include/lzo \
	ZLIBLDFLAGS=-L$(PJ_PREFIX)/lib \
	LZOLDFLAGS=-L$(PJ_PREFIX)/lib \
	install

