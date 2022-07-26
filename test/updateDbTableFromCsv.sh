./updateDbTableFromCsv.sh
./updateDbTableFromCsv.sh "test.csv"
./updateDbTableFromCsv.sh "test.csv" "demo.sqlite" "Statements"
echo "test.csv" | ./updateDbTableFromCsv.sh "demo.sqlite" "Statements"