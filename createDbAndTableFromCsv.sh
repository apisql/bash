#!/bin/bash
## USAGE
# ./createDbAndTableFromCsv.sh "test.csv" "demo.sqlite" "Statements"
INPUT_PATH=$1
if [ ! -t 0 ]; then
  IFS='' read -d '' -r INPUT_PATH
  [ -z "$3" ] && DB_PATH=$1 && TABLE=$2
else
  DB_PATH=$2
  TABLE=$3
fi
#
[ -z $INPUT_PATH ] && echo "!!! First Param, Csv File" && exit
[ ! -r $INPUT_PATH ] && echo "!!! NOT READABLE: $INPUT_PATH" && exit
#
[ -z $DB_PATH ] && echo "!!! Second Param, Sqlite path" && exit
[ ! -r $DB_PATH ] && echo "!!! NOT READABLE: $DB_PATH" && exit
rm $DB_PATH
#
[ -z $TABLE ] && echo "!!! Third Param, Table name" && exit
#
cat << EOF | sqlite3 $DB_PATH
drop table if exists $TABLE;
.mode csv
.import $INPUT_PATH $TABLE
EOF