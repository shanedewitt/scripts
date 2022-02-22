#!/bin/sh
ramusage=$(free | awk '/Mem/{printf("RAM Usage: %.2f\n"), $3/$2*100}'| awk '{print int($3)}')

if [ "$ramusage" -gt 90 ]; then
#SUBJECT="ATTENTION: Memory Utilization is High on $(hostname) at $(date)"
SUBJECT="Critical Memory Utilization on Oroville Production Servername $(hostname) at $(date)"
MESSAGE="/tmp/memory_mail.out"
TO="emailaddress@emailserver.com"

  echo "Memory Current Usage is: $ramusage%" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Process Using top command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
#  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE
  echo "$(top -b | head -n 20)" >> $MESSAGE
  echo "" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "Top Memory Consuming Process Using ps command" >> $MESSAGE
  echo "------------------------------------------------------------------" >> $MESSAGE
  echo "$(ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head)" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/memory_mail.out
  fi

