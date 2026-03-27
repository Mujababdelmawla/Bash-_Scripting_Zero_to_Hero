#!/bin/bash 

# command substitution is taking the output of a command and store it in a variable 


today=$(date)

echo "today is $today"



disk_usage=$(df -h | grep "drivers" | awk '{print $5}')
echo "the disk usage is : $disk_usage"
