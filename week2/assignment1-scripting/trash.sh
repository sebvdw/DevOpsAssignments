#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage:"
  echo "    trash <file>     : Moves the file to the trash."
  echo "    trash -l         : Lists all the files in the trash."
  echo "    trash -r <file>  : Moves the file from the trash to the current directory."
  echo "    trash -s <keyword> : Searches for files with the specified keyword in the filenames in the trash."
  echo "    trash -sf <keyword> : Searches for files with the specified keyword in the filenames in the trash, including compressed archives."
  exit 1
fi

if [ "$1" = "-l" ]; then
  ls -1 trash/
elif [ "$1" = "-r" ]; then
  if [ $# -ne 2 ]; then
    echo "Usage: trash -r <file>"
    exit 1
  fi
  mv trash/$2 .
  echo "Moved $2 from trash to current directory."
elif [ "$1" = "-s" ]; then
  if [ $# -ne 2 ]; then
    echo "Usage: trash -s <word>"
    exit 1
  fi
  # search for word in files in trash and archive directory
  grep -rHn "$2" trash/ trash/archive/
else
  if [ ! -f "$1" ]; then
    echo "$1 is not a file."
    exit 1
  fi
  if [ ! -d "trash" ]; then
    mkdir trash
  fi
  mv $1 trash/
  echo "Moved $1 to trash folder."
  
  # create archive directory if it does not exist
  mkdir -p trash/archive

  # create tarball from files in trash directory, excluding archive directory
  tar -czvf trash/archive/$(date +"%Y-%m-%d-%H-%M").tar.gz --exclude='./archive' trash/*
fi
