#!/bin/sh

# Reference: https://gist.github.com/pythoninthegrass/d2cc2ef4ba6d5291f3f6d0c51fc3e099

. /etc/os-release

PRETTY_NAME=`awk -F= '$1=="PRETTY_NAME" { print $2 ;}' /etc/os-release | tr -d '"'`
VERSION_ID=`awk -F= '$1=="VERSION_ID" { print $2 ;}' /etc/os-release`
UPTIME_DAYS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 / 86400)
UPTIME_HOURS=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 / 3600)
UPTIME_MINUTES=$(expr `cat /proc/uptime | cut -d '.' -f1` % 31556926 % 86400 % 3600 / 60)
cat > /etc/motd << EOF

███╗   ██╗███████╗████████╗████████╗ ██████╗  ██████╗ ██╗     ███████╗
████╗  ██║██╔════╝╚══██╔══╝╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
██╔██╗ ██║█████╗     ██║      ██║   ██║   ██║██║   ██║██║     ███████╗
██║╚██╗██║██╔══╝     ██║      ██║   ██║   ██║██║   ██║██║     ╚════██║
██║ ╚████║███████╗   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗███████║
╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝

Welcome to NetTools container! (Reference: github.com/aeciopires/nettools)

+++++++++++++++++++++++++++++++ CONTAINER/NODE INFO ++++++++++++++++++++++++++

        Hostname: `hostname`
        Kernel: `uname -r`
        Distro: $PRETTY_NAME
        Version $VERSION_ID

        CPU: `cat /proc/cpuinfo | grep 'model name' | head  -1 | cut -d':' -f2`
        CPU Load: `cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}'`
        Total Memory: `free -m | head -n 2 | tail -n 1 | awk {'print  $2'}`M
        Free Memory: `free -m | head -n 2 | tail -n 1 | awk {'print $4'}`M
        Free Swap: `free -m | tail -n 1 | awk {'print $4'}`M
        Free Disk: `df -h / | awk '{ a =  $2 } END { print a }'`

        Network Addresses: `ip a | awk -F '[ /]+' '/inet / && !/loopback/ {print $3}'| grep -v '127.0.0.1'`

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
