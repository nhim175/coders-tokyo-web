#!/bin/bash

if ! [[ $(pwd) =~ /home/root/app$ ]]; then
  echo "ERROR: Wrong directory. Please change directory to /home/root/app and try again"
  exit 1
fi

set -e

npm check || npm install
hexo server --ip 0.0.0.0
