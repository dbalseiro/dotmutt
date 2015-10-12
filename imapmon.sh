#!/bin/bash

function monitor() {
    local pid=$1 i=0

    while ps $pid &>/dev/null; do
        if (( i++ > 5 )); then
            echo "Max checks reached. Sending SIGKILL tio ${pid}..." >&2
            kill -9 $pid; return 1
        fi

        sleep 10
    done

    return 0
}

function main() {
    read -r pid < /Users/diego/.offlineimap/pid
    
    if ps $pid &>/dev/null; then
        echo "Process $pid already running. Exiting..." >&2
        exit 1
    fi

    /usr/local/bin/offlineimap -o -u quiet & monitor $!
}

################################################################################
main                                                                           # 
################################################################################

