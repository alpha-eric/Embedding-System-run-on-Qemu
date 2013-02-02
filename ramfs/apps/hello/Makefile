TARGETS = hello
SRCS = hello.cpp

PREFIX = $(PJ_PREFIX)
CROSS_COMPILE = $(PJ_TARGET)-

CFLAGS    = $(PLATFORM_CFLAGS) -Wall -W -static
CXXFLAGS  = $(CFLAGS)
CPPFLAGS  = $(PLATFORM_CPPFLAGS) -D_REENTRANT -D_LINUX -I$(PREFIX)/include
LDFLAGS   = $(PLATFORM_LDFLAGS) -s -Wl,-rpath-link=$(PJ_RPATH)
LOADLIBES = $(PLATFORM_LOADLIBES) -L$(PREFIX)/lib
LDLIBS    = $(PLATFORM_LDLIBS) -lpthread

CC        = $(CROSS_COMPILE)gcc
CPP       = $(CROSS_COMPILE)gcc -E
CXX       = $(CROSS_COMPILE)gcc
AS        = $(CROSS_COMPILE)as
AR        = $(CROSS_COMPILE)ar
LD        = $(CROSS_COMPILE)ld
NM        = $(CROSS_COMPILE)nm
OBJCOPY   = $(CROSS_COMPILE)objcopy
OBJDUMP   = $(CROSS_COMPILE)objdump
RANLIB    = $(CROSS_COMPILE)ranlib 
READELF   = $(CROSS_COMPILE)readelf 
SIZE      = $(CROSS_COMPILE)size
STRINGS   = $(CROSS_COMPILE)strings
STRIP     = $(CROSS_COMPILE)strip


.PHONY: all clean
all: $(TARGETS)
clean:
	rm -f *.o *.d *~
	rm -f $(TARGETS)

PREFIX_BINDIR := $(PREFIX)/bin
install: $(TARGETS)
	# test PREFIX
	[ "$(PREFIX)" != "" ]
	install -d -m 755 $(PREFIX_BINDIR)/
	install -m 755 $(TARGETS) $(PREFIX_BINDIR)/

%.d: %.c
	$(CC) -MM $(CPPFLAGS) $< | sed -re 's,^.*:,$*.o $*.d:,g' > $@
%.d: %.cpp
	$(CC) -MM $(CPPFLAGS) $< | sed -re 's,^.*:,$*.o $*.d:,g' > $@
DEPENDS := $(SRCS:%.c=%.d)
DEPENDS := $(DEPENDS:%.cpp=%.d)
ifneq ($(MAKECMDGOALS),clean)
-include $(DEPENDS)
endif
