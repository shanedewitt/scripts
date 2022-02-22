#!/bin/bash
cpuidle=$(top -b | head -n 3 | tail -n 1 | awk '{print $5}' | tr -d '%' | tr -d 'i' | tr -d 'd' | tr -d ',' | awk '{print int($1)}' )
cpuuse=$((100-$cpuidle))

if [ "$cpuidle" -lt 10 ]; then

SUBJECT="Critical CPU Utilization on Oroville Production Servername $(hostname) at $(date)"

MESSAGE="/tmp/cpu_mail.out"

TO="emailaddress@emailserver.com"

  echo "CPU Current Usage is: $cpuuse%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "Top CPU Process Using top command" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "$(top -bn1 | head -20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "Top CPU Process Using ps command" >> $MESSAGE
  echo "+------------------------------------------------------------------+" >> $MESSAGE
  echo "$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/cpu_mail.out
  fi

