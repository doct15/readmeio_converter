#!/bin/bash
#
function read_line {
  line=${lines[$linenumber]}
  let linenumber=linenumber+1
  replace_bold
  replace_italic
  replace_singletick
  app_written=0
}

function replace_bold {
  line=$(sed "s/\s\*\*/ <b>/g" <<< "$line")
  line=$(sed 's/\*\*\s/<\/b> /g' <<< "$line") 
  line=$(sed 's/\*\*$/<\/b>/g' <<< "$line")
  line=$(sed "s/\*\*\./<\/b>./g" <<< "$line") 
}

function replace_italic {
  line=$(sed "s/\s\*/ <i>/g" <<< "$line")
  line=$(sed "/[a-zA-Z]+\*/s/\*\s/<\/i> /g" <<< "$line") 
  line=$(sed 's/\*$/<\/i>/g' <<< "$line")
  line=$(sed "s/[a-zA-Z]+\*\./<\/i>./g" <<< "$line") 
}

function replace_singletick {
  line=$(sed 's/`/```/g' <<< "$line")
}

function app_write {
  let app_written=$app_written+1
  if [ $debug ]; then
    echo $1
  else
    echo $1 >> "$newfile"
  fi
}

function app_insert {
  if [ $debug ]; then
    echo $1
  else
    echo $1 >> "$newfile"
  fi
}

leftnav="leftnav-user-guide.html"
ext=".md"
headerdate=$(date +"%Y-%m-%dT%k:%M:%S-07:00")
let app_written=0
let ol_counter=0
let ol_current=0
let ol_top=0
let ol_done=0
#let debug=1
doc_replace="/user-guides/"
image_prefix="/assets/images/"
let ol_readahead=22

for filename in *.orig ; do
  htmlfile=$(sed 's/\.orig/\.html/g' <<< "$filename")
  #newfile="$filename$ext"
  newfile=$(sed 's/\.orig/\.md/g' <<< "$filename")
  old_IFS=$IFS
  IFS=$'\n'
  lines=($(cat "$filename"))
  IFS=$old_IFS
  title=${lines[1]:7}
  if [ $debug ]; then
    echo "$filename $newfile $htmlfile"
    echo "+++" > "$newfile"
    echo "date = \"$headerdate\"" >> "$newfile"
    echo "draft = true" >> "$newfile"
    echo "title = $title" >> "$newfile"
    echo "leftnav = \"$leftnav\"" >> "$newfile"
    echo "+++" >> "$newfile"
    echo "<br>" >> "$newfile"
  else
    echo "$filename $newfile $htmlfile"
    echo "+++" > "$newfile"
    echo "date = \"$headerdate\"" >> "$newfile"
    echo "draft = true" >> "$newfile"
    echo "title = $title" >> "$newfile"
    echo "leftnav = \"$leftnav\"" >> "$newfile"
    echo "+++" >> "$newfile"
    echo "<br>" >> "$newfile"
  fi
  linenumber=4
  while (("$linenumber" <= "${#lines[@]}")); do
    read_line
    
    # Check for [TITLE](doc:LINK)
    if [[ $line == *"](doc:"* ]]; then
      line=$(sed -e "s|\](doc:|\]($doc_replace|g" <<< "$line")
      line=$(sed "s/)/.html)/g" <<< "$line")
    fi
    
    # Check for [TITLE](#ANCHOR)
    if [[ $line == *"](#"* ]]; then
      line=$(sed "s|(#|($doc_replace$htmlfile#|g" <<< "$line")
    elif [[ $line =~ [a-zA-Z]# ]]; then
      line=$(sed "s/.html//g" <<< "$line")
    fi
    #if [[ $line != *".html#"* ]]; then
    #  line=$(sed "s/#/.html#/g" <<<$line)
    #fi

    # Check for "1" first in ordered list
    if [ "${line:0:3}" = "1. " ]; then
      app_insert "<ol>"
      ol_counter=1
      ol_current=0
      ol_top=0
      ol_done=0
      let top=linenumber+"$ol_readahead"
      for ra in `seq "$linenumber" "$top"`; do
        ol_line=${lines[$ra]}
        if [ ${#ol_line} -gt 2 ]; then
          ol_current=$(sed "s/\.//g" <<< ${ol_line:0:2})
          if [[ $ol_current =~ [1-9] ]]; then
            if [ $ol_current -gt $ol_counter ]; then
              let ol_counter=ol_current
            elif [ $ol_current -lt $ol_counter ]; then
              let ol_done=ol_counter            
            fi
          fi
        fi
      done
      if [ $ol_done -gt 0 ]; then
        let ol_top=ol_done
      else
        let ol_top=ol_counter
      fi
      ol_counter=1
    fi
    
    # Check for ">1" in ordered list
    if [[ ${line:0:1} =~ [1-9] ]]; then
      app_write "  <li>${line:3}</li>"
      let ol_counter=ol_counter+1
      if [ $ol_counter -gt $ol_top ]; then
        app_insert "</ol>"
        ol_counter=0
      fi
    fi

    # Check for bullets
    if [ "${line:0:2}" = "* " ]; then
      app_insert "<ul>"
      while [ "${line:0:2}" = "* " ]; do
        app_write "  <li>${line:2}</li>"
        read_line
        if [ "${line:0:3}" = " - " ]; then
          app_insert "  <ul>"
          while [ "${line:0:3}" = " - " ]; do
            app_write "    <li>${line:3}</li>"
            read_line
          done
          app_insert "  </ul>"
        fi
      done
      app_insert "</ul>"
    fi
    
    # Check for H1-5 headers
    if [ "${line:0:5}" = "#####" ]; then
      line="<h5>${line:6}</h5>"
      app_write "$line"
      app_write ""
    fi
    if [ "${line:0:4}" = "####" ]; then
      line="<h4>${line:5}</h4>"
      app_write "$line"
      app_write ""
    fi
    if [ "${line:0:3}" = "###" ]; then
      line="<h3>${line:4}</h3>"
      app_write "$line"
      app_write ""
    fi
    if [ "${line:0:2}" = "##" ]; then
      line="<h2>${line:3}</h2>"
      app_write "$line"
      app_write ""
    fi
    if [ "${line:0:1}" = "#" ]; then
      line="<h1>${line:2}</h1>"
      app_write "$line"
      app_write ""
    fi
    
    # Check for readme.io header
    if [ "${line:0:18}" = "[block:api-header]" ]; then
      line=$(sed 's/\"//g' <<< "${lines[linenumber+2]}")
      anchor=$(sed -e 's/\(.*\)/\L\1/' <<< "${line:9}")
      
      anchor=$(sed "s/ /-/g" <<< "$anchor")
      app_insert ""
      app_write "<h3><a name=\"$anchor\"></a>${line:9}</h3>"
      app_insert ""
      let linenumber=linenumber+5
    fi
    
    # Check for readme.io callout
    if [ "${line:0:15}" = "[block:callout]" ]; then
      codetype=$(sed 's/\"//g' <<< "${lines[linenumber+1]:10}")
      codetype=$(sed 's/,$//g' <<< "$codetype")
      let linenumber=linenumber+2
      read_line
      line=$(sed 's/\"//g' <<< "${line:9}")
      app_insert ""
      app_insert "{{% callout-$codetype %}}"
      app_write "$line"
      app_insert "{{% /callout-$codetype %}}"
      app_insert ""
      let linenumber=linenumber+2
    fi    
    
    # Check for readme.io code block  
    if [ "${line:0:18}" = "[block:code]" ]; then
      let linenumber=linenumber+3
      read_line
      line=$(sed 's/\"//g' <<< "${line:13}")
      line=$(sed 's/,$//g' <<< "$line")
      #echo "BEFORE $line"
      #echo "AFTER $line"
      app_insert ""
      app_insert "{{< callout-code >}}"
      line=$(sed -E 's/\\n/Z/g' <<< "$line")
      old_IFS=$IFS
      IFS='Z'
      codelines=($line)
      IFS=$old_IFS
      #app_write "$line"
      let codenumber=0
      while (("$codenumber" <= "${#codelines[@]}")); do
        app_write "${codelines[$codenumber]}"
        let codenumber=$codenumber+1
      done
      app_insert "{{< /callout-code >}}"
      app_insert ""
      let linenumber=linenumber+5
    fi
    
    # Check for readme.io image block
    if [ "${line:0:19}" = "[block:image]" ]; then
      image_name=$(sed 's/\"//g' <<< "${lines[linenumber+5]:8}")
      image_name=$(sed 's/,$//g' <<< "$image_name")
      app_insert ""
      app_write "<img src=\"$image_prefix$image_name\">"
      app_insert ""
      let linenumber=linenumber+15
    fi

    # Rebuild <a href> links
    if [[ $line =~ .*\[[^]]*\] ]]; then
      app_insert " "
      
    fi
    
    # Write line not written
    if [ $app_written -lt 1 ]; then
      app_write "$line"
    fi
  done
done

#rename 's/\.md$/\.mdold/' *.md
#rename 's/\.mdnew$/\.md/' *.mdnew


