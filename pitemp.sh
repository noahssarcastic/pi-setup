#!/bin/bash
cpu=$(</sys/class/thermal/thermal_zone0/temp)
gpu=$(/usr/bin/vcgencmd measure_temp)
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "GPU => ${gpu#*=}"
echo "CPU => $((cpu/1000))'C"
