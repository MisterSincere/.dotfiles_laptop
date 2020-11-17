#!/bin/bash

utilization=$( nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits )
utilization=$( printf "%2.2d" $utilization )

memory_used=$( nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits )
memory_total=$( nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits )
memory=$(( 100 * $memory_used / $memory_total ))
memory=$( printf "%2.2d" $memory )

temperature=$( nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits )

echo $utilization% $memory% $temperature°C
