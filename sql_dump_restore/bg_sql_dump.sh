#!/bin/sh

time_start=`date -u "+%s"`

dump_date=`date +%Y-%m-%d`

if [ "x$*" = "x" ]; then
    dump_name="bgbilling_$dump_date".sql
else
    tmp=`echo $* | sed -r 's/\s+/_/g'`
    dump_name="bgbilling_$tmp".sql
fi

echo -e "file name: \033[1m$dump_name\033[0m" >&2

echo -e "DROP DATABASE IF EXISTS bgbilling;\nCREATE DATABASE bgbilling DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;\nUSE bgbilling;\n" > $dump_name

mysqldump --quick --single-transaction --events --routines --triggers --default-character-set=utf8 bgbilling >> $dump_name

time_stop=`date -u "+%s"`

awk -v b=$time_start -v e=$time_stop 'BEGIN {printf "%s %.2f %s\n", "time to run:", (b-e)/60*((b-e)<=0?-1:1), "min";}'
