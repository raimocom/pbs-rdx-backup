#!/bin/bash

## if disk is new to the backup pool
#wipe partitions on disk
wipefs -a /dev/disk/by-id/$(cat backup_media.db | awk '{print $1}')

#create zpool
zpool create -o ashift=12 nbp-zfs-usb-backup /dev/disk/by-id/$(cat backup_media.db | awk '{print $1}')

#check if pool exists
fdisk -l /dev/disk/by-id/$(cat backup_media.db | awk '{print $1}') | grep "Apple ZFS" >/dev/null
if ($? == 0) then echo ZFS Partition found ; fi

