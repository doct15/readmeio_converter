#!/bin/bash
#

code="$ distelli list deployments -n BashSimpleApp\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| App Name | Deployment Id | Release Id | Deployed | Description |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| BashSimpleApp | d-338ifi5owr769793a9f1 | a-o3tyk6v71pd096f5e609 | 2015-05-08 20:57:43 UTC (3 months ago) | Test1 |\n| BashSimpleApp | d-y6d5z3wswq9b52c636f4 | a-q6qadg0zta455f189d0d | 2015-05-11 16:53:46 UTC (3 months ago) | Test2 |\n| BashSimpleApp | d-ba1k0e1ahldb648a548d | a-038hp3d0fvf90e86b823 | 2015-05-11 17:03:55 UTC (3 months ago) | Test3 |\n| BashSimpleApp | d-z9gyxktri772d5ba60f6 | a-e6qao45n5me8cfe5ae27 | 2015-05-29 23:07:22 UTC (2 months ago) | Test4 |\n| BashSimpleApp | d-k6qwo6lphmde9f364e5d | a-e6qao45n5me8cfe5ae27 | 2015-08-17 15:58:49 UTC (40 minutes ago) | |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\nbmcgehee@distelli-BM:~/Applications/BashSimpleApp$"

echo "BEFORE $code"
#echo "BEFORE $code" > test.file
#sanitize=$(sed -E 's/\\n/\n/g' <<< $code)

code=$(sed -E 's/\\n/ZZ/g' <<< $code)

echo "AFTER $code"
#echo "AFTER $sanitize" >> test.file

old_IFS=$IFS
IFS='ZZ'
codelines=($code)
IFS=$old_IFS

let codenumber=0
while (("$codenumber" <= "${#codelines[@]}")); do
  echo "$codenumber ${codelines[$codenumber]}"
  let codenumber=$codenumber+1
done



#lines[0]='1. Create the application in your Distelli account. [Creating an Application](doc:creating-an-application-1)'
#lines[1]='2. Push a release version of the application. [Pushing an Application Release](doc:pushing-an-application-release) '
#lines[2]='3. Create an environment for the application. [Creating an Environment](#creating-an-environment-1)'
#lines[3]='None on this line'
#lines[4]='One more with 2 [Test](doc:testblah) blah [test2](doc:happen) all'

#test="/USER/"
#echo "$test"

#for line in "${lines[@]}"; do


#  if [[ $line == *"](doc:"* ]]; then
#    echo "before- $line"
    #line2=$(sed "s/doc/MMM/g" <<< $line)
    #line2=$(sed "s/\[/MMM/g" <<< $line)
    #line2=$(sed "s/\]/MMM/g" <<< $line)
    #line2=$(sed "s/\](/MMM/g" <<< $line)
    #line2=$(sed "s/:/MMM/g" <<< $line)
    #line2=$(sed  -e "s|:|$test|g" <<< $line)
    #echo "$test"
#    line2=$(sed -e "s|\](doc:|\]($test|g" <<< "$line")
#    echo " after- $line2"
#  fi

#done



#test1="1."
#test2="10"
#let linenumber=$((test1))
#let readahead=$((test2))

#for ra in `seq "$linenumber" "${linenumber+$readahead}"`; do
#  echo "RA: $ra"
#done

#echo "${test1:0:1}  $test1"
#
#    if [[ ${test1:0:1} =~ [1-9] ]]; then
#      echo "  Yes!"
#    fi

