#!/bin/bash

if [[ ! -e snapshot_tracker.db ]] ; then 
        cat backup_media.db | awk '{print $1 " "0}' >snapshot_tracker.db
        echo "snapshot_tracker.db recreated from backup_media.db"
else  
        echo "snapshot_tracker.db exists. Delete an rerun for recreating db"
fi
