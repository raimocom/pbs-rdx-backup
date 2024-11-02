#!/bin/bash

if [[ ! -e fixed_disks.list ]] ; then 
        ls /dev/disk/by-id/ >fixed_disks.list
        echo "fixed_disks-list created"
else  
        echo "fixed_disk.list exists. Delete an rerun for recreating"
fi
