#!/bin/bash - 
#===============================================================================
#
#          FILE:  cut_nginx_access_log.sh
# 
#         USAGE:  please put next line  into the crontab, just modify the path when  you  needed
#             */30 * * * *  /bin/sh /the/path/to/cut_nginx_access_log.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: YUEZHAO DONG (DOLFLY), yuezhao@staff.sina.com.cn
#       COMPANY: SINA
#       CREATED: 08/07/2012 12:43:17 PM CST
#      REVISION:  0.0.0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#set the path to nginx log files
log_base_path="/data1/sinawap/logs/" # modify this 
#set nginx log files you want to cut ,it always is the nginx's default access_log file
log_file_name="3g.i139.cn_access.log"

#set the path where you to restore the log ,it will join after the ${log_base_path}
half_hour_dir="ISDN_LOG_HALF_HOUR/" # modify this 

#Set how long you want to save
save_days=90

#set the path to nginx.
CMD_NGINX="/usr/local/sina_mobile/nginx/sbin/nginx"

############################################
#Please do not modify the following script #
############################################
log_dir=${log_base_path}${half_hour_dir}

if [ ! -d $log_dir ] ; then
	mkdir -p $log_dir
fi

#cut nginx log files
e=$(expr $(date +%M ) / 30 )

if [ "x${e}" == "x0" ] ; then
cur_log_dir=${log_dir}$(date -d"last hour" +"%Y/%m/%d/")
file_name=$(date -d"last hour" +"%Y%m%d%H01").log
else
cur_log_dir=${log_dir}$(date +"%Y/%m/%d/")
file_name=$(date +"%Y%m%d%H00").log
fi

cur_log_dir_file=${cur_log_dir}${file_name}

#if exists file,bakup the old file 
if [ -e "${cur_log_dir_file}" ] ; then
	mv ${cur_log_dir_file}{,.$$}
fi
#create the new cut file
mv ${log_base_path}${log_file_name} ${cur_log_dir_file}

#delete ${save_days} days ago nginx log files
find $log_dir -mtime +$save_days -exec rm -rf {} \; 
#reload nginx 
$CMD_NGINX -s reload