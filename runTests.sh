#!/bin/bash

rm -f compile.out tests.out 2>&1 >/dev/null
make clean 2>&1 >/dev/null
make 2>&1 >compile.out
rc=$?
if [[ $rc == 0 ]]; then
  input="./tests.in"
  while IFS= read -r line
  do
    echo "./prog1 $line"
    ./prog1 $line | tee -a tests.out
  done < "$input"
  diff -iBw tests.reference tests.out
  rc=$?
  if [[ $rc == 0 ]]; then
    echo -e "\nAll tests passed"
  else
    echo -e "\nOne or more tests failed"
  fi
else
    echo -e "\nCompilation failed"
fi
exit $rc
