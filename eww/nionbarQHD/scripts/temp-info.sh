#!/bin/bash

if [[ "$1" == "--cpu" ]]; then
    RAWCPU=$(sensors | grep temp1 | awk 'END{print substr($2,2)}')
    CPUFAN=$(sensors | grep cpu_fan | awk 'END{print $2}')
    echo "${RAWCPU:0:2}°C ${CPUFAN}RPM"
    
    
elif [[ "$1" == "--gpu" ]]; then
    GPUMODE=$(supergfxctl -g)
    if [[ $GPUMODE == "integrated" ]]; then
        echo "Disabled"
    else
        RAWGPU=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
        GPUFAN=$(sensors | grep gpu_fan | awk 'END{print $2}')
        echo "${RAWGPU}°C ${GPUFAN}RPM"
    fi
fi