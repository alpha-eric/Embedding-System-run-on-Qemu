SOURCE=lighttpd-1.4.32

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
	autoconf && \
	./configure \
        --target=$(PJ_TARGET) \
	--host=$(PJ_TARGET) \
	--build=$(PJ_HOST) \
        --prefix=$(PJ_PREFIX) \
	--disable-lfs \
	--without-mysql \
	--without-ldap \
	--without-attr \
	--without-valgrind \
	--without-kerberos5 \
	--without-pcre \
	--without-bzip2 \
	--without-zlib \
	--without-webdav-props \
	--without-webdav-locks \
	--without-gdbm \
	--without-memcache \
	--without-lua
	touch $(SOURCE)/.configured

install: $(SOURCE)/.configured
	make -C $(SOURCE) install
	cp conf/lighttpd.conf $(PJ_PREFIX)/etc/lighttpd
	cp conf/lighttpd.sh $(PJ_PREFIX)/etc/rc.d/init.d

