#!/bin/sh
export QT_QUICK_BACKEND=software
export QT_QPA_FONTDIR=/usr/share/fonts
export DBUS_SESSION_BUS_ADDRESS=unix:path=/var/run/dbus/system_bus_socket
export LANG=en_US.UTF-8
export TERM=xterm
export LS_OPTIONS='--color=auto'
# Useful aliases
alias ls='ls $LS_OPTIONS -h'
alias ll='ls $LS_OPTIONS -lhF'
alias l='ls $LS_OPTIONS -lAhF'
export PS1='\[\e[1;31m\]\u\[\e[m\]@\[\e[1;34m\]\h:\[\e[m\]\w\$ '
export TZ='CST-8'
export QT_QPA_PLATFORM=wayland
export HISTFILESIZE=1000
export HISTSIZE=1000
check_rwfs_function() {
        grep -q "ubi0:rootfs / ubifs rw" /proc/mounts
        if [ $? -eq 0 ]; then
                export PROMPT_COMMAND="history -a"
        fi
}
check_rwfs_function

