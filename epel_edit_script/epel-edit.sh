#!/bin/bash


## Test script to add and remove hashes from certain lines of a file ##

# declare files to edit"
TEMPFILE="temp.repo"
DIR="/etc/yum.repos.d/"
for FILENAME in "${DIR}epel.repo" "${DIR}epel-testing.repo"
do
  while IFS= read -r line
  do
  
  # add '#' to lines starting with metalink	
    if [[ ${line::9} == "metalink=" ]]
    then
      MOD_LINE="#${line}"
        
  # remove '#' to lines starting with #baseurl    
    elif [[ ${line::9} == "#baseurl=" ]]
    then
      MOD_LINE=$(echo $line | cut -c 2-)	  
  
  # do not edit the remaining lines    
    else
      MOD_LINE=$line  
    fi 
    echo $MOD_LINE >> $TEMPFILE #adds the modded line to temp file
  done < $FILENAME 
  
  mv "${TEMPFILE}" "${FILENAME}" #replaces original file
done  
  



