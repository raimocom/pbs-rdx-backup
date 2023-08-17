#!/bin/bash

#detect new disks
for i in $(diff fixed_disks.list <(ls /dev/disk/by-id) | tail -n +2 | awk '{if ( $NF !~ /part[0-9]+$/ ) {print $NF} }')
do
	disk_id=$i

	#get disk serial number + device model
	disk_serialNumber=$(smartctl -i /dev/disk/by-id/$i | awk '/Serial Number:/ {print $NF}')
	disk_deviceModel=$(smartctl -i /dev/disk/by-id/$i | awk '/Device Model:/ {print $3 $4 $5}')
	disk_userCapacity=$(smartctl -i /dev/disk/by-id/$i | awk '/User Capacity:/ {print $3}')


done

echo "$disk_id $disk_deviceModel $disk_serialNumber $disk_userCapacity"
