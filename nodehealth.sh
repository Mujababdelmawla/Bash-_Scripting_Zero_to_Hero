#!/bin/bash


###############################
# Author: Mujab
#
#
# Date: 25-03
#
#
# this script outputs node health
#
#
################################
#
#


set -x #debug mode
set -e # exits the scripts when there is an error
set -o pipefail

df -h

free -g

ps -ef | grep "snop" | awk -F" " '{print $2}'
