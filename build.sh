#!/bin/bash
# Paul.Lin <paul415236@gmail.com>

export BASEDIR=`pwd`

help()
{
	echo "usage: ./build.sh <platform>"
	echo "1. raspberry pi2"
}

if [ $# -ne 1 ]; then
	help
	exit 1
fi

case $1 in
	1)
		PLATFORM=RPI2
		;;
	*)
		;;
esac

if [ -z ${PLATFORM} ]; then
	echo "Unsupport value. "
	exit 1
else
	echo "Target platform: ${PLATFORM}"
fi

if [ -f ${BASEDIR}/config/${PLATFORM}/config ]; then
	cp -f ${BASEDIR}/config/${PLATFORM}/config buildroot/.config > /dev/null
	#touch build.sh/.config > /dev/null
fi

cd ${BASEDIR}/buildroot
make all



