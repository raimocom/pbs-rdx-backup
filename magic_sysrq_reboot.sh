#!/bin/bash
qm stop 100
qm stop 150
pct stop 120
sync
sync
sync
echo 128 > /proc/sys/kernel/sysrq
echo b > /proc/sysrq-trigger
