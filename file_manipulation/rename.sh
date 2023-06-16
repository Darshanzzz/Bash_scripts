#!/bin/bash

##### Script to rename all files in a directory with a specific extension ####


# Enter the directory and extension

read -p "Enter the directory:(e.g /etc ) " -r DIR
read -p "Enter the extension (e.g .repo): " EXT


# Check and report if it exists in dir


if [ ! -d "$DIR" ];
then
  echo "Directory doesn't exist"

elif [ -n "$(ls -l ${DIR}/*${EXT} 2>/dev/null )" ];
then
  
  for file in ${DIR}/*${EXT};
  do
	  read -p "What would you like to rename ${file} as? (type 'skip' go to next file) : " ANS
    if [[ $ANS == "skip" ]];
    then
     continue
    else
      mv $file ${DIR}/$ANS
     	    
    fi      
    
  done    
  
elif [ ! -n "$(ls -l ${DIR}/*${EXT} 2>/dev/null )" ];
then
  
  echo "There are no file with such extensions in that directory!"
fi

