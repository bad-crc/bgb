#!/bin/sh

if [ "x$*" != "x" ]; then
    if [ ! -r $1 ]; then
        echo -e "\033[1mno file specified or file is not readable, exiting ...\033[0m" >&2
        exit 1
    fi
fi

time_start=`date -u "+%s"`

mysql --default-character-set=utf8 < $1

time_stop=`date -u "+%s"`

awk -v b=$time_start -v e=$time_stop 'BEGIN {printf "%s %.2f %s\n", "time to run:", (b-e)/60*((b-e)<=0?-1:1), "min";}'
