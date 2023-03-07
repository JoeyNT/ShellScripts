#!/bin/bash

#Author:JoeyNT
#Date:04/07/2019

#Shell script to create files, selecting size, number of files, in a 
selected time.

NAME="^[a-zA-Z0-9]+$"
SIZE="^[0-9]+$"
AMOUNT="^[0-9]+$"

case $1 in
	-f )
	if ! [[ $2 =~ $NAME ]]; then
		dd if=/dev/null of=junk1 bs=1 count=1 &> /dev/null
	else
		dd if=/dev/null of=$2 bs=1 count=1 &> /dev/null
	fi
	;;
	-n )
	if ! [[ $2 =~ $AMOUNT ]]; then
		dd if=/dev/null of=junk1 bs=1 count=1 &> /dev/null
	else
		x=1
		while [ $x -le $2 ]; do
			dd if=/dev/zero of=junk$x bs=$4 count=1 &> /dev/null
                        x=$(( $x + 1 ))
		done
	fi
	;;
	-s )
	if ! [[ $2 =~ $SIZE ]]; then
		dd if=/dev/null of=junk1 bs=1 count=1 &> /dev/null
	else
		dd if=/dev/zero of=junk1 bs=$2 count=1 &> /dev/null
	fi
	;;
	-d )
	rm junk*
	;;
esac

exit

