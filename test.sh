#!/bin/bash
#
test1="1."
test2="10"
let linenumber=$((test1))
let readahead=$((test2))

for ra in `seq "$linenumber" "${linenumber+$readahead}"`; do
  echo "RA: $ra"
done

#echo "${test1:0:1}  $test1"
#
#    if [[ ${test1:0:1} =~ [1-9] ]]; then
#      echo "  Yes!"
#    fi

