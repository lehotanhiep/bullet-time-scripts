#!/bin/bash

self=`basename $0 .sh`
log=transfer.log

function logger
{
	d=`date +%m.%d-%H:%M:%S.%N`
	echo -e "${d}\t${self}\t$@" >> $log
}

case "$ACTION" in
	init)
		logger "INIT"
	;;
	start)
		logger "START"
	;;
	download)
		name=`jhead -nf"%m%d-%H%M%S-${self}" ${ARGUMENT} | grep -ioE "([0-9a-z_-]*)\.jpg$"`
		logger "DOWLOADED: ${name} (${ARGUMENT})"
	;;
	stop)
		logger "STOP"
	;;
	*)
		logger "UNKNOWN ACTION: $ACTION"
	;;
esac
exit 0
