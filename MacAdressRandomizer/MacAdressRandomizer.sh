#!/bin/bash

INTERFACE=en0
OUI="/opt/local/etc/maclist.txt"
OUI_LEN=19004

while [ true ]; do
    STATUS=`ifconfig ${INTERFACE} | grep status: | awk '{print $2}'`
    if [ "$STATUS" = "inactive" ]; then
        R=$(((RANDOM % ${OUI_LEN})+1))
        PREFIX=`head -$R $OUI | tail -1`
        CMD="sudo ifconfig ${INTERFACE} ether ${PREFIX}:"
        for i in `seq 1 6`; do
            R=$(((RANDOM % 15)+1))
            C=`echo "obase=16; $R" | bc`
            CMD="$CMD$C"
            if [ $((i % 2)) = 0 ] && [ $i != 6 ]; then
                CMD="$CMD:"
            fi
        done
        RESULT=`$CMD`
        echo $CMD
    fi
    sleep 30
done