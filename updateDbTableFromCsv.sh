#!/bin/bash
## USAGE
# ./updateDbTableFromCsv.sh "test.csv" "Statements"
# ./updateDbTableFromCsv.sh "test.csv" "Statements" "demo.sqlite"
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
[ -z $DB_PATH ] && echo "!!! Second Param, Sqlite path" && exit
[ ! -r $DB_PATH ] && echo "!!! NOT READABLE: $DB_PATH" && exit
#
[ -z $TABLE ] && echo "!!! Third Param, Table name" && exit
# Remove first line - header
sed '1d' $INPUT_PATH > tmpfile.csv;
cat << EOF | sqlite3 $DB_PATH
.mode csv
.import tmpfile.csv $TABLE
EOF
rm tmpfile.csv