#!/bin/sh

daemon=lighttpd
PATH=$PATH:/sbin

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

start() {
	! pids=$(pidof $daemon) || die "$daemon($pids) is already running."
	echo -n "$daemon start... "
	[ -x $binary ] || die "$binary is not a valid app."
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$prefix/lib
	$binary -f $prefix/etc/$daemon/$daemon.conf -m $prefix/lib
	echo "ok."
}

stop() {
	pids=$(pidof $daemon) || echo "$daemon is not running."	&& return 1
	echo -n "$daemon stop... "
	killall $daemon
}

status() {
	echo -n "$daemon"
	pids=$(pidof $daemon) && echo "($pids) is running." || echo "is stop."
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid dir."

conf=$prefix/etc/$daemon/$daemon.conf
binary=$prefix/sbin/$daemon

case $action in
	start)
		start
	;;
	stop)
		stop
	;;
	restart)
		stop
		start
	;;
	status)
		status
	;;
	*)
		showUsage
	;;
esac
