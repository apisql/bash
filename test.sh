#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 25.07.2022

echo ""
if [ -z "$1" ]; then
    ls -1 test/
    exit
fi

testFile() {
    echo $1
    echo "# TEST"
    echo "FILE: $1"
    cat test/$1
    echo ""
    echo "OUTPUT:"
    sh test/$1
    echo ""
}
## Test One
if [ -r "test/$1" ]; then
  testFile $1
  exit
fi
## Test ALL
TEST_FILE_LIST=$(ls test)
for FILE in $TEST_FILE_LIST
do
  testFile $FILE
done
