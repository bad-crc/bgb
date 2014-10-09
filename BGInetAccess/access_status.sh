#!/bin/sh

cd ${0%${0##*/}}.

. ./setenv.sh

APP_NAME=BGInetAccess

JPS=`${JAVA_HOME}/bin/jps -v | grep ${APP_NAME}`

if [ "x${JPS}" != "x" ]; then
    ./access.sh status
fi
