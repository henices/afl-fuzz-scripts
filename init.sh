#! /bin/sh

echo core >/proc/sys/kernel/core_pattern
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo 1 >/proc/sys/kernel/sched_child_runs_first
echo 1 >/proc/sys/kernel/sched_autogroup_enabled

cd /sys/devices/system/cpu
echo performance | tee cpu*/cpufreq/scaling_governor


echo 1 > /proc/sys/vm/overcommit_memory
