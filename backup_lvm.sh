#!/bin/bash

# Script to back up LVM partitions via LVM snapshots
# designed to run once a day

server=playpen
vgname=ohdevcert
date=`date "+%Y%m%d"`
lvms=( root home var osehra_r osehra_g )

for lvm in "${lvms[@]}"
do
 lvcreate -L2G -s -n ${lvm}_snapshot /dev/mapper/vg_${vgname}-lv_${lvm}
 mkdir -p /mnt/${server}/${lvm}_snapshot
 mount /dev/mapper/vg_${vgname}-${lvm}_snapshot /mnt/${server}/${lvm}_snapshot
 mkdir -p /var/nas/${server}/backup/${date}
 tar -pczf /var/nas/rhs/${server}/backup/${date}/${lvm}.tar.gz /mnt/${server}/${lvm}_snapshot
 umount /mnt/${server}/${lvm}_snapshot
 echo y | lvremove /dev/mapper/vg_${vgname}-${lvm}_snapshot
done
