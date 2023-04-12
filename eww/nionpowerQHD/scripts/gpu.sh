#!/bin/bash

if [[ "$1" == "--temp" ]]; then
    RAWTEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
    echo "${RAWTEMP}"
elif [[ "$1" == "--usage" ]]; then
    RAWGPU=$(nvidia-smi --query-gpu=utilization.gpu --format csv| awk 'END{print $1}')
    echo "${RAWGPU}"
elif [[ "$1" == "--clock" ]]; then
    GPUCLOCK=$(nvidia-smi --query-gpu=clocks.gr --format csv| awk 'END{print $1}')
    echo "${GPUCLOCK}"

elif [[ "$1" == "--mem" ]]; then
    GPUMEM=$(nvidia-smi --query-gpu=clocks.mem --format csv| awk 'END{print $1}')
    echo "${GPUMEM}"

elif [[ "$1" == "--watt" ]]; then
    GPUWATT=$(nvidia-smi --query-gpu=power.draw --format csv| awk 'END{print $1}')
    echo "${GPUWATT}"
elif [[ "$1" == "--fan" ]]; then
    GPUFAN=$(sensors | grep gpu_fan | awk 'END{print $2}')
    echo "${GPUFAN}"
fi