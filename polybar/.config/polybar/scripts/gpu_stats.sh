#!/bin/bash

utilization=$( nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits )
utilization=$( printf "%2.2d" $utilization )

memory_used=$( nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits )
memory_total=$( nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits )
memory=$(( 100 * $memory_used / $memory_total ))
memory=$( printf "%2.2d" $memory )

echo $utilization% $memory%
