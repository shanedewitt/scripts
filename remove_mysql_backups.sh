#!/bin/bash

DIR=/var/repo/ohfdb1/backup
LOGDIR=$DIR/log
KEEP=5
COUNT=0
DATE=`date +"%Y%m%d%H%M"`

if [ ! -d $DIR ]
then
  echo Directory: $DIR does not exist
  exit 1
fi

if [ ! -d ${LOGDIR} ] ; then
  mkdir -p ${LOGDIR}
fi

LOG=${LOGDIR}/`basename $0 .sh`.$DATE.log
echo BEGIN $DATE                                        >> ${LOG} 2>&1

for i in `find $DIR/[0-9]* -type d | sort -r`
do
  let COUNT=COUNT+1
  if [ $COUNT -gt $KEEP ]
  then
    echo Deleting backup $i
    rm -rf $i
  else
    echo Skipping backup $i
  fi
done

DATE=`date +"%Y%m%d%H%M"`
echo END $DATE
