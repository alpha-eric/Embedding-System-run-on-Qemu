BUILD_TOOLS := build-tools
BOOTLDR := bootldr
KERNEL := kernel
KERNEL_HEADER := kernel_header
DRIVER := driver
OPENSOURCES := opensources
APPS := apps
MKROOTFS := mkrootfs
WEBS := webs
SDK := sdk

QUIET :=
JOBS :=
CLEAN_PREFIX := clean_prefix

.PHONY: all clean distclean project tags
all: project
clean:
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	make -C $(MKROOTFS) clean
	make -C $(KERNEL) clean
	make -C $(BOOTLDR) clean
	make -C $(APPS) clean
	make -C $(OPENSOURCES) clean
	make -C $(BUILD_TOOLS) clean
	make -C $(SDK) clean
	rm -rf $(PJ_PREFIX)/
	rm -rf images/
	rm -f .done

distclean:
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	make -C $(MKROOTFS) distclean
	make -C $(KERNEL) distclean
	make -C $(BOOTLDR) distclean
	make -C $(APPS) clean
	make -C $(OPENSOURCES) distclean
	make -C $(BUILD_TOOLS) distclean
	make -C $(SDK) distclean
	rm -rf $(PJ_PREFIX)/
	rm -rf images/
	rm -f .done

.PHONY: clean_prefix
clean_prefix:
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	rm -rf $(PJ_PREFIX)

.PHONY: sdk
sdk:
	[ "$(PJ_NAME)" != "" ]
	[ "$(PJ_PREFIX)" != "" ]
	make -C $(SDK) install
tags:
	ctags -R $(APPS) $(DRIVER_HEADERS) kernel/$(PJ_KERNEL)/include/linux/ $(PJ_PREFIX)/include

project: $(CLEAN_PREFIX) $(SDK) $(BUILD_TOOLS) $(KERNEL_HEADER) $(OPENSOURCES) $(APPS) $(BOOTLDR) $(MKROOTFS) $(KERNEL)
#$(DRIVER) $(WEBS)

.PHONY: $(KERNEL_HEADER)
$(KERNEL_HEADER):
	make -C $(KERNEL)/ headers_install $(QUIET)

.PHONY: $(BUILD_TOOLS)
$(BUILD_TOOLS):
	make -C $(BUILD_TOOLS) install $(QUIET)

.PHONY: $(BOOTLDR)
$(BOOTLDR):
	make -C $(BOOTLDR)/ install $(QUIET)

.PHONY: $(DRIVER)
$(DRIVER):
	make -C $(DRIVER)/ $(JOBS) install $(QUIET)

.PHONY: $(KERNEL)
$(KERNEL):
	make -C $(KERNEL)/ install $(QUIET)

.PHONY: $(OPENSOURCES)
$(OPENSOURCES):
	make -C $(OPENSOURCES)/ $(JOBS) install $(QUIET)

.PHONY: $(APPS)
$(APPS):
	make -C $(APPS)/ install

.PHONY: $(WEBS)
$(WEBS):
	make -C $(WEBS)/ install

.PHONY: $(MKROOTFS)
$(MKROOTFS):
	make -C $(MKROOTFS)/ install $(QUIET)
