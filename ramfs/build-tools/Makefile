.PHONY: all clean distclean install
all: install
clean:
	[ "$(PJ_NAME)" != "" ]
	rm -f .config

distclean:
	[ "$(PJ_NAME)" != "" ]
	rm -rf $(PJ_TOOLCHAIN_PATH)
	rm -f .config

install: 
	[ "$(PJ_NAME)" != "" ]
	[ ! -f .config ] && tar jxf arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 && touch .config || echo -n ""
	cp -r $(PJ_TOOLCHAIN_PATH)/arm-none-linux-gnueabi/libc/lib/* $(PJ_PREFIX)/lib
	cp -r $(PJ_TOOLCHAIN_PATH)/arm-none-linux-gnueabi/include/c++/4.6.3/* $(PJ_PREFIX)/include
