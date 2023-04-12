#!/bin/bash

if [[ "$1" == "--cpu" ]]; then
    RAWCPU=$(top -bn1 | grep " us, " | awk 'END{print 100-$8}')
    CPUCLOCK=$(cat /proc/cpuinfo | grep "cpu MHz" | awk '{sum += $4} END{print substr(sum / 16000,1,4)}')
    if [[ $RAWCPU != *"."* ]]; then
        CPU="${RAWCPU}.0"
    else
        CPU=$RAWCPU
    fi
    if [[ ${#CPU} < 4 ]]; then
        echo "0${CPU}% ${CPUCLOCK}GHz"
    else
        echo "${CPU}% ${CPUCLOCK}GHz"
    fi
    
elif [[ "$1" == "--ram" ]]; then
    RAWRAM=$(top -E g -bn1 | grep "Mem" | awk 'NR==1{print $8}')
    echo "${RAWRAM}GiB"
elif [[ "$1" == "--gpu" ]]; then
    GPUMODE=$(supergfxctl -g)
    if [[ $GPUMODE == "integrated" ]]; then
        echo "Disabled"
    else
        GPUUSAGE=$(nvidia-smi --query-gpu=utilization.gpu --format csv| awk 'END{print $1}')
        GPUWATT=$(nvidia-smi --query-gpu=power.draw --format csv| awk 'END{print $1}')
        GPUGRCLOCK=$(nvidia-smi --query-gpu=clocks.gr --format csv| awk 'END{print $1}')
        GPUMEMCLOCK=$(nvidia-smi --query-gpu=clocks.mem --format csv| awk 'END{print $1}')
        echo "${GPUUSAGE}% ${GPUWATT}W ${GPUGRCLOCK}MHz ${GPUMEMCLOCK}MHz"
    fi
fi
