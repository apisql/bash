#!/bin/bash
## USAGE
# ./createDbAndTableFromCsv.sh "test.csv" "Statements"
# ./createDbAndTableFromCsv.sh "test.csv" "Statements" "demo.sqlite"
#
DB_PATH_DEFAULT=apisql.db
INPUT_PATH=$1
if [ ! -t 0 ]; then
  IFS='' read -d '' -r INPUT_PATH
  TABLE=$1
  DB_PATH=$2
  [ -z "$2" ] && DB_PATH=$DB_PATH_DEFAULT
else
  TABLE=$2
  DB_PATH=$3
  [ -z "$3" ] && DB_PATH=$DB_PATH_DEFAULT
fi
#
[ -z $INPUT_PATH ] && echo "!!! First Param, Csv File" && exit
[ ! -r $INPUT_PATH ] && echo "!!! NOT READABLE: $INPUT_PATH" && exit
#
[ -z $DB_PATH ] && echo "!!! Third Param, Sqlite path" && exit
[ -r $DB_PATH ] && rm $DB_PATH
#
[ -z $TABLE ] && echo "!!! Second Param, Table name" && exit
#
cat << EOF | sqlite3 $DB_PATH
drop table if exists $TABLE;
.mode csv
.import $INPUT_PATH $TABLE
EOF