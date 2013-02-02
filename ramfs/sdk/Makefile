.PHONY: all clean distclean install
all: install
clean:
	[ "$(PJ_NAME)" != "" ]

distclean:
	[ "$(PJ_NAME)" != "" ]
	rm -rf $(PJ_TOOLCHAIN_PATH)

install:
	[ "$(PJ_NAME)" != "" ]
	cp -r prefix $(PJ_PREFIX)
