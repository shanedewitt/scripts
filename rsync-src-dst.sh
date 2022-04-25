#! /bin/bash

# script will rsync files from SRC to DST directory. SRC can be a symbolic link
# to a local folder, while DST can be a remotely mounted filesystem.
#
# add script to cron to run every x minutes. Before running it will check if
# it is already running, and exit if it is still running.

PGM=`basename $0 .sh`
LOG=~/log/${PGM}.log
PID=/tmp/${PGM}.pid

SRC=/var/src
DST=/var/dst

# check to see if old instance still running
if [ -r ${PID} ] ; then
    myID=`cat ${PID}`
    $(kill -0 $myID)
    if [ $? == 0 ] ; then
        echo "${PGM}: `date` `cat ${PID}` still running"  >> ${LOG}
        exit
    fi
    $(rm ${PID})
fi

# create PID file
echo $$ > ${PID}

echo "==================================================" >> ${LOG}
echo "${PGM} `date` starting $$"    >> ${LOG}

src=$(mount -l -t cifs | grep -c $SRC)
dst=$(mount -l -t cifs | grep -c $DST)

if [ $src -eq 1  ] && [ $dst -eq 1 ]
then
  rsync -arv $SRC $DST >> ${LOG}
fi

echo "${PGM} `date` complete"   >> ${LOG}

# remove PID file
rm -fv ${PID}   >> ${LOG}
echo "--------------------------------------------------" >> ${LOG}
exit

