SUBDIRS := zlib lzo e2fsprogs mtd-utils busybox lighttpd
.PHONY: all clean distclean install $(SUBDIRS)
all: $(SUBDIRS)
install: $(SUBDIRS)
clean:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir clean; \
	done

distclean:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir distclean; \
	done

$(SUBDIRS):
	make -C $@ install
