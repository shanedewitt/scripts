#!/bin/bash

# Script to copy GT.M database backups to NAS.
#

log=/var/log/$(basename $0 .sh).log

SERVER=playpen
DATE=$(/bin/date "+%Y%m%d")
SOURCE=/home/osehra/G
DESTINATION=/var/nas/rhs/${SERVER}/backup/${DATE}

echo "Begin"                                                >> $log 2>&1

if [ ! -d $DESTINATION ] ; then
  echo "Creating ${DESTINATION}..."                         >> $log 2>&1
  mkdir -p ${DESTINATION}                                   >> $log 2>&1
fi

if [ -d $DESTINATION ] ; then
  date                                                      >> $log 2>&1
  echo "Copy Files to NAS..."                               >> $log 2>&1
  cp -avpf $SOURCE $DESTINATION                             >> $log 2>&1
  date                                                      >> $log 2>&1
fi

if [ -d $DESTINATION ] ; then
  date                                                      >> $log 2>&1
  echo "Compressing database files..."                      >> $log 2>&1
  gzip ${DESTINATION}/*.dat                                 >> $log 2>&1
  date                                                      >> $log 2>&1
fi

echo "Done"                                                 >> $log 2>&1

