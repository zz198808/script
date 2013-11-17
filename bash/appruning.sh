#!/bin/sh

# app_running
# Checks if a specified app is running.
# (based on: http://daringfireball.net/2006/10/processing_processes)
# Note that case does matter: safari is different from Safari
#
# Cameron Hayne (macdev@hayne.net)  Oct 2006

appName=$1
echo "Checking to see if $appName is running"

count=`ps -xc -o command | egrep -c "^$appName$"`
if [ $count -gt 0 ]; then
    echo "$appName is running"
else
    echo "$appName is not running"
fi
