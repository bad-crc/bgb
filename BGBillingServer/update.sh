#!/bin/sh

cd ${0%${0##*/}}.

TIME=`date +%Y-%m-%d_%H:%M:%S`

echo "# Stopping Scheduler"
./scheduler_stop.sh

echo "# Stopping Server"
./server_stop.sh

echo "# Start Updating"
./bg_installer.sh update | tee ./log_update_${TIME}

echo "# Starting Server"
./server_start.sh

echo "# Starting Scheduler"
./scheduler_start.sh

if [ -e .bgclient_keystore_user -o -e .bgclient_keystore ]; then
    ./bgclient_javawebstart.sh
fi
