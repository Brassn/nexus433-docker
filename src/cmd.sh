#!/bin/bash

function log_info {
        echo -e $(date '+%Y-%m-%d %T')"\e[1;32m $@\e[0m"
}

#function terminate_container {
#  kill ${spid}
#  if [ $pid -ne 0 ]; then
#    kill -SIGTERM "$pid"
#    wait "$pid"
#  fi
#  log_info "shutting down container"
#  exit 0
#}


#trap "terminate_container" SIGTERM

if [ -z "${MQTT_SERVER}" ]; then
  log_info "MQTT_SERVER variable must be set, exiting"
  exit 1
fi

while true
do
        log_info "Starting Nexus433"
        exec nexus433 -a ${MQTT_SERVER} --verbose
        sleep 1s
#        export pid=${!}
#        sleep 1s &
#        export spid=${!}
#        wait $spid
done
