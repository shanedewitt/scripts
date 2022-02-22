#!/bin/sh
THRESHOULD="92"

touch /tmp/disk_mail.out

for path in `/bin/df -h | grep -vE 'Filesystem|sda3' | grep -vE 'Filesystem|tmpfs' |awk '{print $4}' |sed 's/%//g'`
do
        if [ $path -ge $THRESHOULD ]; then
        df -h | grep $path% >> /tmp/disk_mail.out
        fi
done

VALUE=`cat /tmp/disk_mail.out | wc -l`
        if [ $VALUE -ge 1 ] ; then
SUBJECT="Critical Disk Utilization on Oroville Production Servername $(hostname) at $(date)"
MESSAGE="/tmp/disk_mail.out"
TO="emailaddress@emailserver.com"

  mail -s "$SUBJECT" "$TO" < $MESSAGE
        fi

rm /tmp/disk_mail.out

