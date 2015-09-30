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
  #echo "before: $line"
  line=$(sed "s/\s\*\*/ <b>/g" <<< "$line")
  line=$(sed 's/\*\*\s/<\/b> /g' <<< "$line") 
  line=$(sed "s/\*\*\./<\/b>./g" <<< "$line") 
  #echo "after: $line"
}

function replace_italic {
  #echo "before: $line"
  line=$(sed "s/\s\*/ <i>/g" <<< "$line")
  line=$(sed "/[a-zA-Z]\*/s/\*\s/<\/i> /g" <<< "$line") 
  line=$(sed "s/\*\./<\/i>./g" <<< "$line") 
  #echo "after: $line"
}

function replace_singletick {
  #echo "before: $line"
  line=$(sed 's/`/```/g' <<< "$line")
  #echo "after: $line"
}

function app_write {
  let app_written=$app_written+1
  echo $1
}

function app_insert {
  echo $1
}

leftnav="leftnav-user-guide.html"
ext=".new"
headerdate=$(date +"%Y-%m-%dT%k:%M:%S-07:00")
let app_written=0
let ol_counter=0
let ol_current=0
let ol_top=0
let ol_done=0
doc_replace="/user-guides/"
image_prefix="/assets/images/"
ol_readahead=12

#echo $headerdate
for filename in *; do
  #title1=`sed "s/-/ /g" <<< "$filename"`
  #title2=${title1%".md"}""
  #title3=`sed -r 's/\<./\U&/g' <<< "$title2"`
  htmlfile=$(sed 's/\.md/\.html/g' <<< "$filename")
  newfile="$filename$ext"
  old_IFS=$IFS
  IFS=$'\n'
  lines=($(cat "$filename"))
  IFS=$old_IFS
  title=${lines[1]:7}
  echo "$filename $newfile $htmlfile"
  echo "+++"
  echo "date = \"$headerdate\""
  echo "draft = true"
  echo "title = $title"
  echo "leftnav = \"$leftnav\""
  echo "+++"
  echo "<br>"
  linenumber=4
  while [ $linenumber -lt ${#lines[@]} ]; do
    read_line
    #echo "$linenumber ${#lines[@]} $line"
    if [ "${line:0:2}" = "* " ]; then
      app_insert "<ul>"
      while [ "${line:0:2}" = "* " ]; do
        #echo "$line"
        #text="${line:2}"
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
    if [ "${line:0:3}" = "1. " ]; then
      app_insert "<ol>"
      ol_counter=1
      ol_current=0
      ol_top=0
      ol_done=0
      let top=linenumber+"$ol_readahead"
      #echo "LR $linenumber $ol_readahead $top"
      for ra in `seq "$linenumber" "$top"`; do
        ol_line=${lines[$ra]}
        if [ ${#ol_line} -gt 2 ]; then
          ol_current=$(sed "s/\.//g" <<< ${ol_line:0:2})
          if [[ $ol_current =~ [1-9] ]]; then
            #echo "OL_cur_count_top_done $ol_current $ol_counter $ol_top $ol_done"
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
      #echo "OL_top_done_count_cur $ol_top $ol_done $ol_counter $ol_current"
    fi
    if [[ ${line:0:1} =~ [1-9] ]]; then
      app_write "  <li>${line:3}</li>"
      let ol_counter=ol_counter+1
      if [ $ol_counter -gt $ol_top ]; then
    #elif [[ ol_counter -gt 0 ]]; then
        app_insert "</ol>"
        ol_counter=0
      fi
    fi
    if [ "${line:0:5}" = "#####" ]; then
      line="<h5>${line:6}</h5>"
      app_write "$line"
    fi
    if [ "${line:0:4}" = "####" ]; then
      line="<h4>${line:5}</h4>"
      app_write "$line"
    fi
    if [ "${line:0:3}" = "###" ]; then
      line="<h3>${line:4}</h3>"
      app_write "$line"
    fi
    if [ "${line:0:2}" = "##" ]; then
      #echo "LINENUMBER $linenumber"
      line="<h2>${line:3}</h2>"
      app_write "$line"
    fi
    if [ "${line:0:1}" = "#" ]; then
      #echo "LINENUMBER $linenumber"
      line="<h1>${line:2}</h1>"
      app_write "$line"
    fi
    if [ "${line:0:18}" = "[block:api-header]" ]; then
      line=$(sed 's/\"//g' <<< "${lines[linenumber+2]}")
      #anchor=$(sed -r 's/\<./\L&/g' <<< "${line:9}")
      anchor=$(sed -e 's/\(.*\)/\L\1/' <<< "${line:9}")
      
      anchor=$(sed "s/ /-/g" <<< "$anchor")
      app_insert ""
      app_write "<h3><a name=\"$anchor\"></a>${line:9}</h3>"
      app_insert ""
      let linenumber=linenumber+5
    fi
    if [ "${line:0:15}" = "[block:callout]" ]; then
      codetype=$(sed 's/\"//g' <<< "${lines[linenumber+1]:10}")
      codetype=$(sed 's/,$//g' <<< "$codetype")
      let linenumber=linenumber+2
      read_line
      line=$(sed 's/\"//g' <<< "${line:9}")
      #echo "TYPE $codetype"
      #info, warning, danger,success
      app_insert ""
      app_insert "{{% callout-$codetype %}}"
      app_write "$line"
      app_insert "{{% /callout-$codetype %}}"
      app_insert ""
      let linenumber=linenumber+3
    fi      
    if [ "${line:0:18}" = "[block:code]" ]; then
      let linenumber=linenumber+3
      read_line
      line=$(sed 's/\"//g' <<< "${line:13}")
      line=$(sed 's/,$//g' <<< "$line")
      app_insert ""
      app_insert "{{< callout-code >}}"
      app_write "$line"
      app_insert "{{< /callout-code >}}"
      app_insert ""
      let linenumber=linenumber+6
    fi
    if [ "${line:0:19}" = "[block:image]" ]; then
      image_name=$(sed 's/\"//g' <<< "${lines[linenumber+5]:8}")
      image_name=$(sed 's/,$//g' <<< "$image_name")
      #echo "IMAGE_NAME: $image_name"
      app_insert ""
      app_write "<img src=\"$image_prefix$image_name\">"
      app_insert ""
      let linenumber=linenumber+15
    fi
    if [[ $line == *"](doc:"* ]]; then
      #echo "HERE"
      #line=$(sed -e "s/\]\(doc:/\]\($doc_replace/g" <<< "$line")
      #app_write "$line"
      test="test"
    fi
    #echo "app_written is:$app_written"
    if [ $app_written -lt 1 ]; then
      app_write "$line"
    fi
  done
done


