./createDbAndTableFromCsv.sh
./createDbAndTableFromCsv.sh "test.csv"
./createDbAndTableFromCsv.sh "test.csv" "demo.sqlite" "Statements"
echo "test.csv" | ./createDbAndTableFromCsv.sh "demo.sqlite" "Statements"