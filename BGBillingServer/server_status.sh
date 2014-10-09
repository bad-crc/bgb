#!/bin/sh

cd ${0%${0##*/}}.

. ./setenv.sh

APP_NAME=BGBillingServer

JPS=`${JAVA_HOME}/bin/jps -v | grep ${APP_NAME}`

if [ "x${JPS}" != "x" ]; then
    ./server.sh status
fi
