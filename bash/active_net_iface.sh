#!/bin/sh

# active_net_iface
# This script echos the name of the current active network interface
# (e.g. "en0" or "en1")
# It is useful in other scripts or aliases that need this interface
# as a parameter to some other command (e.g. 'tcpdump').

for iface in  `ifconfig -lu` ; do
    case $iface in
    lo*)     continue ;;
    esac
    ifconfig $iface | grep -q 'inet ' && echo $iface
done

