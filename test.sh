#!/bin/bash
#

lines[0]="Enter a [strong <b>password</b>](/user-guides/accounts-faq#how-do-i-make-a-strong-password.html)."
lines[1]="Testing [TE XT](/dir/link1.html) apples [TEXT2](/dir2/link2.html#anchor) and trailing."
lines[2]="[TEXT3 zeple are. <b>great</b>](/dir3/link3.html)."

let linecount=0

while [ "$linecount" -lt 3 ]; do
  line=${lines[$linecount]}
  linkscount="${line//[^\[]}"
  let linkcount="${#linkscount}"
  while [ "$linkcount" -gt 0 ]; do
  echo "LINECOUNT $linecount"
    echo "LINKCOUNT $linkcount"
    echo "LINE $line"
    linktext=$(sed -r "s|.*[\(.*?]\)|\1|" <<< "$line")
    #linktext=$(sed  "s|^[^(]||" <<< "$linktext")
    echo "LINKTEXT $linktext"
    linklink=$(sed "s|.*(\(*\))|\1|" <<< "$linktext")
    #linktext=$(sed "s|\(.*\)(.*$|\1|" <<< "$linktext")
    link="<a href=\"$linklink\" target=\"_blank\">$linktext</a>"
    line=$(sed "s|\(.*\)\[.*)\(.*\)|\1$link\2|" <<< "$line")
    echo "LINKTEXT $linktext"
    echo "LINKLINK $linklink"
    echo "LINK $link"
    echo "LINE $line"
    echo ""
    let linkcount=linkcount-1
  done
  let linecount=linecount+1
done





















#line="Enter a [strong <b>password</b>](/user-guides/accounts-faq#how-do-i-make-a-strong-password.html)."

#echo "BEFORE $line"
#
#    if [[ $line == *"](#"* ]]; then
#      echo "TRUE if"
#      line=$(sed "s|(#|($doc_replace$htmlfile#|g" <<< "$line")
#    elif [[ $line =~ [a-zA-Z]*# ]]; then
#      echo "TRUE elif"
#      line=$(sed "s/.html)/)/g" <<< "$line")
#      line=$(sed -re "s|([a-zA-Z]+)#|\1\.html#|g" <<< "$line")
#    fi
    #if [[ $line != *".html#"* ]]; then
    #  line=$(sed "s/#/.html#/g" <<<$line)
    #fi

#echo "AFTER $line"









#line="Click *Delete* Application in the *Danger Zone*. another *test*"

#echo "BEFORE $line"

#line=$(sed "s/\s\*/ <i>/g" <<< "$line")
#line=$(sed "s/[a-zA-Z]+\*\s/<\/i> /g" <<< "$line") 
#line=$(sed 's/\*$/<\/i>/g' <<< "$line")
#line=$(sed -re "s|([a-zA-Z]+)\*\.|\1</i>.|g" <<< "$line") 
#line=$(sed -re "s|([a-zA-Z]+)\*\s|\1</i> |g" <<< "$line") 
#
#echo "AFTER $line"







#line="   - Github"
#echo " LINE $line"

#echo "Z${line:0:4}Z"

#if [ "${line:0:5}" == "   - " ] || [ "${line:0:4}" == "  - " ] || [ "${line:0:3}" == " - " ] || [ "${line:0:2}" == "- " ] || [ "${line:0:2}" == " -" ]; then
#  echo "TRUE"
#  line=$(sed -e 's/^\s*-/\*/g' <<<$line)
#fi

#echo "AFTER $line"


#code="$ distelli list deployments -n BashSimpleApp\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| App Name | Deployment Id | Release Id | Deployed | Description |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\n| BashSimpleApp | d-338ifi5owr769793a9f1 | a-o3tyk6v71pd096f5e609 | 2015-05-08 20:57:43 UTC (3 months ago) | Test1 |\n| BashSimpleApp | d-y6d5z3wswq9b52c636f4 | a-q6qadg0zta455f189d0d | 2015-05-11 16:53:46 UTC (3 months ago) | Test2 |\n| BashSimpleApp | d-ba1k0e1ahldb648a548d | a-038hp3d0fvf90e86b823 | 2015-05-11 17:03:55 UTC (3 months ago) | Test3 |\n| BashSimpleApp | d-z9gyxktri772d5ba60f6 | a-e6qao45n5me8cfe5ae27 | 2015-05-29 23:07:22 UTC (2 months ago) | Test4 |\n| BashSimpleApp | d-k6qwo6lphmde9f364e5d | a-e6qao45n5me8cfe5ae27 | 2015-08-17 15:58:49 UTC (40 minutes ago) | |\n+---------------+------------------------+------------------------+------------------------------------------+-------------+\nbmcgehee@distelli-BM:~/Applications/BashSimpleApp$"

#echo "BEFORE $code"
#echo "BEFORE $code" > test.file
#sanitize=$(sed -E 's/\\n/\n/g' <<< $code)

code=$(sed -E 's/\\n/Z/g' <<< $code)

#echo "AFTER $code"
#echo "AFTER $sanitize" >> test.file

#old_IFS=$IFS
#IFS='Z'
#codelines=($code)
#IFS=$old_IFS

#let codenumber=0
#while (("$codenumber" <= "${#codelines[@]}")); do
#  echo "$codenumber ${codelines[$codenumber]}"
#  let codenumber=$codenumber+1
#done


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

