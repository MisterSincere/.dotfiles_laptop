#!/bin/bash

gpu_utilization=$( nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits )
gpu_utilization=$( printf "%2.2d" $gpu_utilization )

gpu_temperature=$( nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits )

echo $gpu_utilization%" "$gpu_temperature"°C"

