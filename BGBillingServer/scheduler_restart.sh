#!/bin/sh

cd ${0%${0##*/}}.

. ./setenv.sh

APP_NAME=BGScheduler

JPS=`${JAVA_HOME}/bin/jps -v | grep ${APP_NAME}`

if [ "x${JPS}" != "x" ]; then
    ./scheduler.sh -estop
fi

./scheduler.sh -estart
