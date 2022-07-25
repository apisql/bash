./csvToSqliteTable.sh
./csvToSqliteTable.sh "test.csv"
./csvToSqliteTable.sh "test.csv" "demo.sqlite" "Statements"
echo "test.csv" | ./csvToSqliteTable.sh "demo.sqlite" "Statements"