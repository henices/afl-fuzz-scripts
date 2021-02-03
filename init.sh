#! /bin/sh

echo 1 >/proc/sys/kernel/sched_child_runs_first
echo 1 >/proc/sys/kernel/sched_autogroup_enabled
echo 1 > /proc/sys/vm/overcommit_memory

echo core >/proc/sys/kernel/core_pattern
echo never > /sys/kernel/mm/transparent_hugepage/enabled
test -e /sys/devices/system/cpu/cpufreq/scaling_governor && echo performance | tee /sys/devices/system/cpu/cpufreq/scaling_governor
test -e /sys/devices/system/cpu/cpufreq/policy0/scaling_governor && echo performance | tee /sys/devices/system/cpu/cpufreq/policy*/scaling_governor
test -e /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor && echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
test -e /sys/devices/system/cpu/cpufreq/boost && echo 1 > /sys/devices/system/cpu/cpufreq/boost
