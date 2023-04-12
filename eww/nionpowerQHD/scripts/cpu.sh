#!/bin/bash

if [[ "$1" == "--temp" ]]; then
    RAWTEMP=$(sensors | grep temp1 | awk 'END{print substr($2,2)}')
    echo "${RAWTEMP:0:2}"
elif [[ "$1" == "--usage" ]]; then
    RAWCPU=$(top -bn1 | grep " us, " | awk 'END{print 100-$8}')
    if [[ $RAWCPU != *"."* ]]; then
        CPU="${RAWCPU}.0"
    else
        CPU=$RAWCPU
    fi

    echo "${RAWCPU}"
elif [[ "$1" == "--clock" ]]; then
    CPUCLOCK=$(cat /proc/cpuinfo | grep "cpu MHz" | awk '{sum += $4} END{print substr(sum / 16000,1,4)}')
    echo "${CPUCLOCK}"
elif [[ "$1" == "--fan" ]]; then
    CPUFAN=$(sensors | grep cpu_fan | awk 'END{print $2}')
    echo "${CPUFAN}"
fi