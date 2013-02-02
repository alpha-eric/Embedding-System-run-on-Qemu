SUBDIRS := hello

.PHONY: all clean distclean apps install
#all: apps transpeer
all: apps
clean:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir clean; \
	done
	#make -C transpeer clean $(QUIET)

distclean:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir distclean || exit 1; \
	done
	#make -C transpeer distclean $(QUIET)

apps:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir || exit 1; \
	done
	#make -C transpeer $(QUIET)

install:
	[ "$(PJ_NAME)" != "" ]
	for subdir in $(SUBDIRS); do \
		make -C $$subdir install || exit 1; \
	done
	#make -C transpeer install $(QUIET)
