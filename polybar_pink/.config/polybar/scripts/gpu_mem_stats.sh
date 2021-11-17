#!/bin/bash

memory_used=$( nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits )

#memory_total=$( nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits )

#memory_relative=$(( 100 * $memory_used / $memory_total ))
#memory_relative=$( printf "%2.2d" $memory )

memory_clock=$( nvidia-smi --query-gpu=clocks.current.memory --format=csv,noheader,nounits )
memory_clock=$( printf "%4.4d" $memory_clock )

# not available?
#memory_temperature=$( nvidia-smi --query-gpu=temperature.memory --format=csv,noheader,nounits )

echo $memory_used"MB "$memory_clock"MHz"
