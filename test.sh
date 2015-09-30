#!/bin/bash
#
test1="1. this is a test"
test2="2. This is a test"

echo "${test1:0:1}  $test1"

    if [[ ${test1:0:1} =~ [1-9] ]]; then
      echo "  Yes!"
    fi

