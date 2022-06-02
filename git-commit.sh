#!/bin/bash

logfile=$(basename $0 .sh)
log=~/log/$logfile
echo log is $log       >> $log
today=$(date "+%Y%m%d")
echo today is $today   >> $log
cd ~/r
echo adding .m files   >> $log
git add *.m            >> $log
echo commiting changes >> $log
git commit -m $today   >> $log

