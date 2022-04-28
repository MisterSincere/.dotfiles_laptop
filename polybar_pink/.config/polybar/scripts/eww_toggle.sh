#!/bin/bash


res=$(ps -ef)
res=$(echo "${res}" | grep "eww open $1")
echo ${res}
